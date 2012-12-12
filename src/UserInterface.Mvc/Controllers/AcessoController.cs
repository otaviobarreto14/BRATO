using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TopDown.TopFramework.BusinessRules;
using Brato.Entities;

namespace Brato.UserInterface.Controllers
{
    public class AcessoController : Controller
    {
        public ActionResult Login()
        {
            return View();
        }

        public JsonResult Logar(string Matricula, string Senha)
        {
            bool sucesso = false;
            if (RulesManager.CreateByEntity<PolicialEntity, int>().FindAll(p => p.Matricula == Matricula && p.Senha == Senha).Any())
            {
                FormsAuthentication.SetAuthCookie(Matricula, false);
                sucesso = true;
            }
            return new JsonResult()
            {
                Data = new { Sucesso = sucesso }
            };
        }

        public ActionResult Logoff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Acesso");
        }
    }
}
