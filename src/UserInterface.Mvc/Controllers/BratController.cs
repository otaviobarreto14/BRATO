using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.BusinessRules;
using System.Text;

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
            ViewData["UF"] = (new List<SelectListItem>());
            ViewData["Municipio"] = (new List<SelectListItem>());
            ViewData["Bairro"] = (new List<SelectListItem>());
            ViewData["Logradouro"] = (new List<SelectListItem>());
            ViewData["Cor"] = (new List<SelectListItem>());
            // ViewData["UfExpedicaoCnh"] = (new List<SelectListItem>()); NÃO TEM NECESSIDADE NESTE MOMENTO
            // ViewData["CategoriaCnh"] = (new List<SelectListItem>()); É UM ENUM
            return View();
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
                uint numBrat = 0;
                if (ultimoBrat != null)
                    numBrat = ultimoBrat.NumBrat + 1;
                else
                    numBrat = 1000;

                entity.NumBrat = numBrat;

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

    }
}
