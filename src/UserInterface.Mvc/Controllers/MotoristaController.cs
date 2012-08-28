using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Brato.UserInterface.Controllers
{
    public class MotoristaController : Controller
    {
        //
        // GET: /Motorista/

        public ActionResult IncMotorista()
        {
            ViewData["UF"] = (new List<SelectListItem>());
            ViewData["Municipio"] = (new List<SelectListItem>());
            ViewData["Bairro"] = (new List<SelectListItem>());
            ViewData["Logradouro"] = (new List<SelectListItem>());
            ViewData["UfExpedicaoCnh"] = (new List<SelectListItem>());
            ViewData["CategoriaCnh"] = (new List<SelectListItem>());
            
            return View();
        }

    }
}
