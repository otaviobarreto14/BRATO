using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TopDown.TopAccess.Entities;
using TopDown.TopFramework.BusinessRules;
using System.Text;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    public class SiteMapHelper
    {
        /// <summary>
        /// Monta o SiteMap a partir de um controller e uma action informada.
        /// </summary>
        public static string GetSiteMap(string controller, string action)
        {
            IRules<FuncaoEntity> funcaoRules = RulesManager.CreateByEntity<FuncaoEntity>();

            string concat = "";
            if (controller.ToLower() != "arrdeclaracaoremuneracao")
                concat = "/";

            FuncaoEntity funcao = funcaoRules.FindAll(c => c.NomExecutavel.ToLower() == action.ToLower()
                                                        && c.TxtDiretorio.EndsWith(concat + controller.ToLower())).FirstOrDefault();

            List<string> siteMap = new List<string>();

            if (funcao != null)
            {
                ModuloEntity modulo = funcao.Modulo;
                while (funcao != null && funcao.IndNivelFuncao >= 1)
                {
                    siteMap.Add(funcao.TxtTituloFuncao);
                    funcao = funcao.FuncaoPai;
                }
                siteMap.Add(modulo.NomModulo);
            }
            siteMap.Reverse();
            //Envolve o último item com um <span id="tituloFuncao" para habilitar trocar o nome da função via javascript
            if (siteMap.Count > 0)
                siteMap[siteMap.Count - 1] = string.Format("<span id=\"tituloFuncao\">{0}</span>", siteMap[siteMap.Count - 1]);
            return string.Join(" => ", siteMap);
        }

        /// <summary>
        /// Monta o SiteMap de acordo com a url anterior
        /// </summary>
        public static string GetSiteMapForReferrer()
        {
            if (HttpContext.Current.Request.UrlReferrer == null)
                return "&nbsp;<span id=\"tituloFuncao\"></span>";
            string absolutePath = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
            if (absolutePath.Where(c => c == '/').Count() == 0)
                return "&nbsp;<span id=\"tituloFuncao\"></span>";

            var absolutePathArray = absolutePath.Split('/');
            string action = absolutePathArray.Last();
            string controller = absolutePathArray[absolutePathArray.Length - 2];

            return GetSiteMap(controller, action);
        }
    }
}