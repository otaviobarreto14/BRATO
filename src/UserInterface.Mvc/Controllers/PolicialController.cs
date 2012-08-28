using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;

namespace Brato.UserInterface.Controllers
{
    public class PolicialController : Controller
    {
        public JsonResult CarregarBatalhoes()
        {
            return new JsonResult()
            {
                Data = new { Items = EnumHelper.GetList<BatalhaoEnum>() }
            };
        }

        public ActionResult IncPolicial()
        {
            return View();
        }

        public ActionResult ConPolicial()
        {
            return View();
        }
    }
}
