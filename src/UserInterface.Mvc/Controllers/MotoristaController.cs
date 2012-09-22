using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.BusinessRules;

namespace Brato.UserInterface.Controllers
{
    public class MotoristaController : Controller
    {
        IRules<MotoristaEntity, int> rules;

        public MotoristaController()
        {
            rules = RulesManager.CreateByEntity<MotoristaEntity, int>();
        }

        public ActionResult IncMotorista()
        {
            ViewData["UF"] = (new List<SelectListItem>());
            ViewData["Municipio"] = (new List<SelectListItem>());
            ViewData["Bairro"] = (new List<SelectListItem>());
            ViewData["Logradouro"] = (new List<SelectListItem>());
            ViewData["UfExpedicaoCnh"] = (new List<SelectListItem>());
            // ViewData["CategoriaCnh"] = (new List<SelectListItem>());   É UM ENUM
            return View();
        }

        public JsonResult SalvarMotorista(MotoristaEntity entity)
        {
            IList<string> erros = Validar(entity);

            if (erros.Any())
            {
                return new JsonResult()
                {
                    Data = new { Sucesso = false, Erros = erros }
                };
            }
            else
            {
                EnderecoEntity endereco = new EnderecoEntity()
                {
                    IdLogradouro = entity.Pessoa.Logradouro
                };

                endereco.IdLogradouro.IdBairro = entity.Pessoa.Bairro;
                endereco.IdLogradouro.IdBairro.IdMunicipio = entity.Pessoa.Municipio;
                endereco.IdLogradouro.IdBairro.IdMunicipio.Uf = entity.Pessoa.UF;
                endereco.IdComplemento = new ComplementoEntity();
                if (!string.IsNullOrEmpty(entity.Pessoa.Complemento))
                    endereco.IdComplemento.Descricao = entity.Pessoa.Complemento;
                else
                    endereco.IdComplemento.Descricao = "";

                endereco.Numero = entity.Pessoa.Numero;

                var complementoRules = RulesManager.CreateByEntity<ComplementoEntity, int>();
                var complemento = endereco.IdComplemento;
                complementoRules.Create(complemento);
                complementoRules.Flush();
                endereco.IdComplemento = complemento;

                var enderecoRules = RulesManager.CreateByEntity<EnderecoEntity, int>();
                enderecoRules.Create(endereco);
                enderecoRules.Flush();

                entity.Pessoa.IdEndereco = endereco;
                var pessoaRules = RulesManager.CreateByEntity<PessoaEntity, int>();
                pessoaRules.Create(entity.Pessoa);
                pessoaRules.Refresh(entity.Pessoa);

                rules.Create(entity);
                return new JsonResult()
                {
                    Data = new { Sucesso = true }
                };
            }
        }

        private IList<string> Validar(MotoristaEntity entity)
        {
            IList<string> erros = new List<string>();
            if (string.IsNullOrEmpty(entity.Pessoa.Cpf))
                erros.Add("O campo 'CPF' é obrigatório");
            if (string.IsNullOrEmpty(entity.Pessoa.Nome))
                erros.Add("O campo 'Nome' é obrigatório");
            if (string.IsNullOrEmpty(entity.Pessoa.Sexo))
                erros.Add("O campo 'Sexo' é obrigatório");
            if (entity.CategoriaCnh == 0)
                erros.Add("O campo 'Categoria CNH' é obrigatório");
            if (string.IsNullOrEmpty(entity.Cnh))
                erros.Add("O campo 'CNH' é obrigatório");
            if (entity.DataNasc.Year == 0001)
                erros.Add("O campo 'Data Nasc.' é obrigatório");
            if (entity.EstadoCivil == 0)
                erros.Add("O campo 'Estado Civil' é obrigatório");
            if (string.IsNullOrEmpty(entity.ProntuarioCnh))
                erros.Add("O campo 'Prontuario CNH' é obrigatório");
            if (string.IsNullOrEmpty(entity.UfExpedicaoCnh))
                erros.Add("O campo 'UF Expedicao CNH' é obrigatório");
            if (entity.ValidadeExameChn.Year == 0001)
                erros.Add("O campo 'Validade Exame CHN' é obrigatório");

            if (entity.Pessoa.UF != null && string.IsNullOrEmpty(entity.Pessoa.UF.Uf))
                erros.Add("O campo 'UF' é obrigatório");
            if (entity.Pessoa.Municipio != null && entity.Pessoa.Municipio.IdMunicipio == 0)
                erros.Add("O campo 'Município' é obrigatório");
            if (entity.Pessoa.Bairro != null && entity.Pessoa.Bairro.IdBairro == 0)
                erros.Add("O campo 'Bairro' é obrigatório");
            if (entity.Pessoa.Logradouro != null && entity.Pessoa.Logradouro.IdLogradouro == 0)
                erros.Add("O campo 'Logradouro' é obrigatório");
            if (string.IsNullOrEmpty(entity.Pessoa.Numero))
                erros.Add("O campo 'Número' é obrigatório");

            return erros;
        }

    }
}
