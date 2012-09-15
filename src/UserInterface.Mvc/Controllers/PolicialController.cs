using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.WebUserInterfaceHelper.Mvc;
using TopDown.TopFramework.BusinessRules;

namespace Brato.UserInterface.Controllers
{
    public class PolicialController : Controller
    {

        IRules<PolicialEntity, string> rules = null;

        public PolicialController()
        {
            rules = RulesManager.CreateByEntity<PolicialEntity, string>();
        }
        public JsonResult CarregarBatalhoes()
        {
            return new JsonResult()
            {
                Data = new { Items = EnumHelper.GetList<BatalhaoEnum>() }
            };
        }

        public ActionResult IncPolicial()
        {
            ViewData["Retorno"] = "";
            return View();
        }

        public ActionResult ConPolicial()
        {
            return View();
        }

        public ActionResult Salvar(PolicialEntity entity)
        {
            ModelState.Remove("IdPerfil.Descricao");
            ModelState.Remove("IdPerfil.IdPerfil");
            ModelState.Remove("Status");

            if (entity == null)
                ModelState.AddModelError("Entity", "Entidade é nula.");

            if (entity.IdPerfil == null || entity.IdPerfil.IdPerfil == 0)
                ModelState.AddModelError("Perfil", "O campo é obrigatório");

            if (entity == null)
                ModelState.AddModelError("Entity", "Entidade é nula.");

            if (rules.FindAll(p => p.Matricula == entity.Matricula).ToList().Any())
                ModelState.AddModelError("Matricula", "Matricula Já Cadastrada");

            if (!ModelState.IsValid)
            {
                ViewData["Retorno"] = "Erro";
                return View("IncPolicial", entity);
            }

            entity.Status = "A";
            rules.Create(entity);
            ViewData["Retorno"] = "Erro";

            return View("IncPolicial", new PolicialEntity());
        }

        public JsonResult GetPagedInJson(int page, int rows, string sidx, string sord)
        {
            int totalfound = 0;
            var query = rules.FindAll(p => p.Matricula != "", sidx, sord == "true", page, rows, out totalfound);
            return new JsonResult()
            {
                Data = new
                {
                    Items = query.ToArray(),
                    ItemCount = totalfound,
                    PageIndex = page,
                    TotalPages = (totalfound / rows) + 1
                }
            };
        }

        public JsonResult AlterarStatusPolicial(string matricula)
        {
            var policial = rules.GetById(matricula);
            if (policial.Status == "A")
                policial.Status = "I";
            else
                policial.Status = "A";

            rules.Update(policial);

            return new JsonResult()
            {
                Data = new
                {
                    Sucesso = true
                }
            };
        }


    }
}
