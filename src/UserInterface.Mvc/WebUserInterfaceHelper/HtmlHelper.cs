using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using DevExpress.Web.Mvc.UI;
using DevExpress.XtraReports.Web;
using DevExpress.XtraRichEdit.Import.Html;
using DevExpress.Web.Mvc;
using System.Web.Routing;
using System.Dynamic;

namespace System.Web.Mvc.Html
{

    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString CustomReportToolbar(this HtmlHelper helper)
        {
            return helper.DevExpress().ReportToolbar(settings =>
            {
                // The following settings are necessary for a Report Toolbar. 
                settings.Name = "ReportToolbar";
                settings.ReportViewerName = "mainReportViewer";
                settings.Width = 820;
                // The following code defines the list of export formats available for the Report Toolbar. 
                ReportToolbarComboBox saveFormat = new ReportToolbarComboBox() { ItemKind = ReportToolbarItemKind.SaveFormat, Width = 70 };
                saveFormat.Elements.AddRange(new ListElement[] {
                    new ListElement { Value = "pdf", Text = "Pdf"},
                    new ListElement { Value = "xls", Text = "Xls"},
                    new ListElement { Value = "xlsx", Text = "Xlsx" },
                    new ListElement { Value = "rtf", Text = "Rtf" },
                    new ListElement { Value = "mht", Text = "Mht" },
                    new ListElement { Value = "txt", Text = "Txt" },
                    new ListElement { Value = "csv", Text = "Csv" },
                    new ListElement { Value = "png", Text = "Image" }
                });

                // The following code defines the items that the Report Toolbar contains. 
                settings.Items.AddRange(new ReportToolbarItem[] {
                    new ReportToolbarButton { 
                        ItemKind = ReportToolbarItemKind.PrintReport,
                        ToolTip = "Imprimir Relatório",
                    },
                    new ReportToolbarButton { 
                        ItemKind = ReportToolbarItemKind.PrintPage,
                        ToolTip = "Imprimir Página"
                    },
                    new ReportToolbarSeparator(),
                    new ReportToolbarButton {
                        ItemKind = ReportToolbarItemKind.FirstPage,
                        ToolTip = "Primeira Página"
                    },
                    new ReportToolbarButton {
                        ItemKind = ReportToolbarItemKind.PreviousPage,
                        ToolTip ="Página Anterior"
                    },
                    new ReportToolbarLabel { 
                        ItemKind = ReportToolbarItemKind.PageLabel,
                        Text = "Página"
                    },
                    new ReportToolbarComboBox { ItemKind = ReportToolbarItemKind.PageNumber, 
                            Width = 65 },
                    new ReportToolbarLabel { 
                        ItemKind = ReportToolbarItemKind.OfLabel,
                        Text = "de"
                    },
                    new ReportToolbarTextBox() { ItemKind = ReportToolbarItemKind.PageCount },
                    new ReportToolbarButton {
                        ItemKind = ReportToolbarItemKind.NextPage,
                        ToolTip ="Próxima Página"
                    },
                    new ReportToolbarButton {
                        ItemKind = ReportToolbarItemKind.LastPage,
                        ToolTip = "Última Página"
                    },
                    new ReportToolbarSeparator(),
                    new ReportToolbarButton { 
                        ItemKind = ReportToolbarItemKind.SaveToDisk,
                        ToolTip = "Exportar o relatório e salvar no disco"
                    },
                    new ReportToolbarButton { 
                        ItemKind = ReportToolbarItemKind.SaveToWindow,
                        ToolTip = "Exportar o relatório e abrir em uma nova janela",
                    },
                    saveFormat, 
                    new ReportToolbarSeparator(),
                    new ReportToolbarButton { ItemKind = ReportToolbarItemKind.Custom,
            Text = "Voltar", Name="btnVoltar" },
    });
                // And, the following code handles the button's Click event. 
                settings.ClientSideEvents.ItemClick =
                    "function(s, e) { if(e.item.name =='btnVoltar' ) history.go(-1); }";

            }).GetHtml();
        }
    }
}