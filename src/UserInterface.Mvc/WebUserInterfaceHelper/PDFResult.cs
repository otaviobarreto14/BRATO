using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    public class PDFResult : System.Web.Mvc.ActionResult
    {
        private readonly byte[] pdf;

        public PDFResult(byte[] pdf)
        {
            this.pdf = pdf;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            var response = context.RequestContext.HttpContext.Response;
            response.Clear();
            response.ContentType = "image/jpeg";
            response.BinaryWrite(pdf);
            response.End();
        }
    }

}