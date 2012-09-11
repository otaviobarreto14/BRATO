using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Brato.UserInterface.Controllers
{
    public class RelatorioController : Controller
    {
        public ActionResult RelAnalitico()
        {
            return View();
        }
        public ActionResult RelGerencial()
        {
            return View();
        }
        public ActionResult RelPolicial()
        {
            return View();
        }
    }
}
