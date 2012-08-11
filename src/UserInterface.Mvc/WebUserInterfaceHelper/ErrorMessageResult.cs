using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    public class ErrorMessageResult : ViewResult
    {
        /// <summary>
        /// Retorna uma view Erro com a mensagem de erro definida
        /// </summary>
        /// <param name="message">Mensagem de erro</param>
        public ErrorMessageResult(string message)
        {
            this.ViewName = "Erro";
            this.ViewData["msgErro"] = message;
        }
    }
}