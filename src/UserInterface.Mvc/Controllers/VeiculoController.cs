using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Brato.UserInterface.Controllers
{
    public class VeiculoController : Controller
    {
        public ActionResult IncVeiculo()
        {
            ViewData["TipoVeiculo"] = (new List<SelectListItem>());
            ViewData["Fabricante"] = (new List<SelectListItem>());
            ViewData["Modelo"] = (new List<SelectListItem>());
            ViewData["Cor"] = (new List<SelectListItem>());
            return View();
        }

    }
}
