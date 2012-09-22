using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TopDown.TopFramework.BusinessRules;
using Brato.Entities;

namespace Brato.UserInterface.Controllers
{
    public class EnderecoController : Controller
    {
        public JsonResult ObterUfs()
        {
            return new JsonResult()
            {
                Data = new
                {
                    Items = RulesManager.CreateByEntity<UfEntity, string>().GetAll().ToArray()
                }
            };
        }
        public JsonResult ObterMunicipios()
        {
            return new JsonResult()
            {
                Data = new
                {
                    Items = RulesManager.CreateByEntity<MunicipioEntity, int>().GetAll().ToArray()
                }
            };
        }
        public JsonResult ObterBairros()
        {
            return new JsonResult()
            {
                Data = new
                {
                    Items = RulesManager.CreateByEntity<BairroEntity, int>().GetAll().ToArray()
                }
            };
        }


        public JsonResult ObterLogradouros()
        {
            return new JsonResult()
            {
                Data = new
                {
                    Items = RulesManager.CreateByEntity<LogradouroEntity, int>().GetAll().ToArray()
                }
            };
        }

    }
}
