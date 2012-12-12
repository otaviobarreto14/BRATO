using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.BusinessRules;

namespace Brato.UserInterface.Controllers
{
    public class VeiculoController : Controller
    {
        IRules<VeiculoEntity, int> rules;

        public VeiculoController()
        {
            rules = RulesManager.CreateByEntity<VeiculoEntity, int>();
        }
        public ActionResult IncVeiculo()
        {
            ViewData["TipoVeiculo"] = (new List<SelectListItem>());
            ViewData["Fabricante"] = (new List<SelectListItem>());
            ViewData["Modelo"] = (new List<SelectListItem>());
            ViewData["Cor"] = (new List<SelectListItem>());
            return View();
        }

        public JsonResult SalvarVeiculo(VeiculoEntity entity)
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
                var bratRules = RulesManager.CreateByEntity<BratEntity, int>();
                var brat = bratRules.GetById(entity.Brat.IdBrat);
                entity.Brat = brat;
                rules.Create(entity);
                return new JsonResult()
                {
                    Data = new { Sucesso = true }
                };
            }
        }

        private IList<string> Validar(VeiculoEntity entity)
        {
            IList<string> erros = new List<string>();

            if (entity.Ano == 0)
                erros.Add("O campo 'Ano' é obrigatório");
            if (entity.Cor == 0)
                erros.Add("O campo 'Cor' é obrigatório");
            if (entity.Fabricante == 0)
                erros.Add("O campo 'Fabricante' é obrigatório");
            if (entity.Modelo == 0)
                erros.Add("O campo 'Modelo' é obrigatório");
            if (entity.TipoVeiculo == 0)
                erros.Add("O campo 'Tipo Veiculo' é obrigatório");
            if (string.IsNullOrEmpty(entity.NomeProprietario))
                erros.Add("O campo 'Nome Proprietário' é obrigatório");
            if (string.IsNullOrEmpty(entity.Placa))
                erros.Add("O campo 'Placa' é obrigatório");

            return erros;
        }

    }
}
