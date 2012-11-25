using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using DevExpress.XtraReports.UI;
using System.Dynamic;

namespace SISSMO.UserInterface.Model
{
    public class XtraReportModel
    {
        public XtraReportModel()
        {
        }
        public XtraReportModel(XtraReport rpt)
        {
            this.Report = rpt;
        }

        public string PartialSufix = "Partial";

        public string ExportReportSufix = "ExporReportViewer";

        public string Controller { get; set; }

        public string Action { get; set; }

        public XtraReport Report { get; set; }

        public string PartialMethod
        {
            get
            {
                return Action + PartialSufix;
            }
        }

        public string ExporReportMethod
        {
            get
            {
                return Action + ExportReportSufix;
            }
        }

        public BaseReportRouteObject RouteObject = new BaseReportRouteObject();

        public object CallBackRoute(bool exportReport = false)
        {
            RouteObject.Controller = Controller;
            RouteObject.Action = PartialMethod;
            return RouteObject;
        }

        public bool IsExportCall()
        {
            string export = string.Empty;
            if (HttpContext.Current != null)
                export = HttpContext.Current.Request.Params["DXArgument"];
            return !string.IsNullOrEmpty(export) && (export.Contains("saveToDisk") || export.Contains("saveToWindow"));
        }

    }
}