using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Brato.UserInterface.Controllers
{
    public class BratController : Controller
    {
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
            return View();
        }
    }
}
