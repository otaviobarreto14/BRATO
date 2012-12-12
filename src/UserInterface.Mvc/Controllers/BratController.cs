using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.BusinessRules;
using System.Text;
using Brato.UserInterface.Models;

namespace Brato.UserInterface.Controllers
{
    public class BratController : Controller
    {
        IRules<BratEntity, int> rules;

        public BratController()
        {
            rules = RulesManager.CreateByEntity<BratEntity, int>();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IncBrat()
        {
            var policial = RulesManager.CreateByEntity<PolicialEntity>().FindAll(p => p.Matricula == User.Identity.Name && p.Status == "A").FirstOrDefault();
            if (policial == null)
                return RedirectToAction("Login", "Acesso");
            else
            {
                ViewData["UF"] = (new List<SelectListItem>());
                ViewData["Municipio"] = (new List<SelectListItem>());
                ViewData["Bairro"] = (new List<SelectListItem>());
                ViewData["Logradouro"] = (new List<SelectListItem>());
                ViewData["Cor"] = (new List<SelectListItem>());
                // ViewData["UfExpedicaoCnh"] = (new List<SelectListItem>()); NÃO TEM NECESSIDADE NESTE MOMENTO
                // ViewData["CategoriaCnh"] = (new List<SelectListItem>()); É UM ENUM
                return View();
            }
        }

        public JsonResult SalvarDadosBrat(BratEntity entity)
        {
            IList<string> erros = Validar(entity);

            if (erros.Any())
            {

                var sb = new StringBuilder();
                foreach (var erro in erros)
                {
                    sb.Append(erro);
                    sb.Append("<br/>");
                }
                return new JsonResult()
                {
                    Data = new { Sucesso = false, Erros = sb.ToString() }
                };
            }
            else
            {
                Byte[] bytes = new Byte[1];
                entity.Croqui = bytes;

                EnderecoEntity endereco = new EnderecoEntity()
                {
                    IdLogradouro = entity.Logradouro
                };

                endereco.IdLogradouro.IdBairro = entity.Bairro;
                endereco.IdLogradouro.IdBairro.IdMunicipio = entity.Municipio;
                endereco.IdLogradouro.IdBairro.IdMunicipio.Uf = entity.UF;

                var enderecoRules = RulesManager.CreateByEntity<EnderecoEntity, int>();
                enderecoRules.Create(endereco);
                enderecoRules.Flush();

                entity.IdEndereco = endereco;
                var ultimoBrat = rules.GetAll(p => p.NumBrat, true).FirstOrDefault();
                int numBrat = 0;
                if (ultimoBrat != null)
                    numBrat = ultimoBrat.NumBrat + 1;
                else
                    numBrat = 1000;

                entity.NumBrat = numBrat;
                entity.Temp = "T";
                rules.Create(entity);
                return new JsonResult()
                {
                    Data = new { Sucesso = true, IdBrat = entity.IdBrat }
                };
            }
        }

        private IList<string> Validar(BratEntity entity)
        {
            IList<string> erros = new List<string>();
            if (entity.Circunstancia == 0)
                erros.Add("O campo 'Circunstância' é obrigatório");
            if (entity.CondTempo == 0)
                erros.Add("O campo 'Cond. Tempo' é obrigatório");
            if (entity.DataAcidente == new DateTime())
                erros.Add("O campo 'Data Acidente' é obrigatório");
            if (string.IsNullOrEmpty(entity.Descricao))
                erros.Add("O campo 'Descrição' é obrigatório");
            if (string.IsNullOrEmpty(entity.HoraAcidente))
                erros.Add("O campo 'Hora Acidente' é obrigatório");
            if (string.IsNullOrEmpty(entity.Matricula.Matricula))
                erros.Add("O campo 'Hora Acidente' é obrigatório");
            if (entity.TipoAcidente == 0)
                erros.Add("O campo 'Tipo Acidente' é obrigatório");
            if (entity.TipoSinalizacao == 0)
                erros.Add("O campo 'Tipo Sinalização' é obrigatório");

            if (entity.UF != null && string.IsNullOrEmpty(entity.UF.Uf))
                erros.Add("O campo 'UF' é obrigatório");
            if (entity.Municipio != null && entity.Municipio.IdMunicipio == 0)
                erros.Add("O campo 'Município' é obrigatório");
            if (entity.Bairro != null && entity.Bairro.IdBairro == 0)
                erros.Add("O campo 'Bairro' é obrigatório");
            if (entity.Logradouro != null && entity.Logradouro.IdLogradouro == 0)
                erros.Add("O campo 'Logradouro' é obrigatório");


            return erros;
        }

        public ActionResult VisualizarBrat(int numero)
        {
            BratEntity brat = RulesManager.CreateByEntity<BratEntity, int>().FindAll(b => b.NumBrat == numero).FirstOrDefault();
            IList<VeiculoEntity> veiculos = new List<VeiculoEntity>();
            IList<MotoristaEntity> motoristas = new List<MotoristaEntity>();
            IList<VitimaEntity> vitimas = new List<VitimaEntity>();
            IList<TestemunhaEntity> testemunhas = new List<TestemunhaEntity>();
            BratModel model = new BratModel();
            if (brat != null)
            {
                model.CondicaoTempoAcidente = EnumHelper.GetEnumDescription<CondTempoEnum>(brat.CondTempo);
                model.DataAcidente = string.Format("{0}/{1}/{2}", brat.DataAcidente.Day, brat.DataAcidente.Month, brat.DataAcidente.Year);
                model.DescricaoAcidente = brat.Descricao;
                model.HoraAcidente = brat.HoraAcidente;
                model.LinkCroqui = "";
                model.LinkFotos = new List<string>(); //TODO: Pegar fotos para o brat
                model.LocalAcidente = string.Format("{0} - {1}", brat.IdEndereco.IdLogradouro.Descricao, brat.IdEndereco.IdLogradouro.IdBairro.Descricao);
                model.Motoristas = RulesManager.CreateByEntity<MotoristaEntity, int>().FindAll(m => m.Brat.IdBrat == brat.IdBrat).ToList();
                model.MunicipioAcidente = brat.IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Descricao;
                model.SinalizacaoAcidente = EnumHelper.GetEnumDescription<SinalizacaoEnum>(brat.TipoSinalizacao);
                model.Testemunhas = RulesManager.CreateByEntity<TestemunhaEntity, int>().FindAll(m => m.Brat.IdBrat == brat.IdBrat).ToList();
                model.TipoAcidente = EnumHelper.GetEnumDescription<TipoAcidenteEnum>(brat.TipoAcidente);
                model.Veiculos = RulesManager.CreateByEntity<VeiculoEntity, int>().FindAll(m => m.Brat.IdBrat == brat.IdBrat).ToList();
                model.Vitimas = RulesManager.CreateByEntity<VitimaEntity, int>().FindAll(m => m.Brat.IdBrat == brat.IdBrat).ToList();
                model.msgErro = "";
                model.Resultados = true;
            }
            else
            {
                model.msgErro = "Não BRAT com o número informado.";
                model.Resultados = false;
            }
            return View(model);
        }

        public JsonResult BuscarBrat(string Cpf, string NumeroBrat)
        {
            int numbrat = 0;
            if (!string.IsNullOrEmpty(NumeroBrat) && int.TryParse(NumeroBrat, out numbrat))
            {
                BratEntity brat = RulesManager.CreateByEntity<BratEntity, int>().FindAll(b => b.NumBrat == int.Parse(NumeroBrat)).FirstOrDefault();
                if (brat != null)
                {
                    return new JsonResult()
                    {
                        Data = new { Sucesso = true, BuscaPorNumero = true, NumBrat = NumeroBrat }
                    };
                }
            }
            IList<int> lst = RulesManager.CreateByEntity<MotoristaEntity, int>().FindAll(m => m.Pessoa.Cpf == Cpf).Select(b => b.Brat).Select(b => b.NumBrat).ToList();

            if (lst.Any())
            {
                return new JsonResult()
                {
                    Data = new { Sucesso = true, BuscaPorNumero = false, NumBrat = lst }
                };
            }

            return new JsonResult()
            {
                Data = new { Sucesso = false }
            };
        }

        public JsonResult FinalizarBrat(int idBrat)
        {
            var bratRules = RulesManager.CreateByEntity<BratEntity, int>();
            var brat = bratRules.GetById(idBrat);
            if (brat != null)
            {
                brat.Temp = "D";
                bratRules.Update(brat);
            }

            return new JsonResult()
            {
                Data = new { Sucesso = true, NumeroBrat = brat.NumBrat }
            };
        }


        public JsonResult CancelarBrat(int idBrat)
        {
            var bratRules = RulesManager.CreateByEntity<BratEntity, int>();
            var brat = bratRules.GetById(idBrat);

            if (brat != null)
            {

                var motoristaRules = RulesManager.CreateByEntity<MotoristaEntity, int>();
                var vitimaRules = RulesManager.CreateByEntity<VitimaEntity, int>();
                var veiculoRules = RulesManager.CreateByEntity<VeiculoEntity, int>();
                var testemunhaRules = RulesManager.CreateByEntity<TestemunhaEntity, int>();
                bratRules.Delete(brat);

                
            }

            return new JsonResult()
            {
                Data = new { Sucesso = true }
            };
        }
    }
}
