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
    public enum EMasks { None, Numerico, Date, Metical }
    public enum ETextAlign { Left, Center, Rigth }

    public static class HtmlHelperExtensions
    {
        #region "Methods"
        private static string GetClassByETextAlign(ETextAlign param)
        {
            string retorno = "";

            switch (param)
            {
                case ETextAlign.Left:
                    retorno = "control-align-left";
                    break;
                case ETextAlign.Center:
                    retorno = "control-align-center";
                    break;
                case ETextAlign.Rigth:
                    retorno = "control-align-rigth";
                    break;
            }

            return retorno;
        }

        private static string GetMaskJsByEMask(EMasks mask)
        {
            string retorno = "";

            switch (mask)
            {
                case EMasks.Date:
                    return "date";
                case EMasks.Metical:
                    return "metical";
                case EMasks.Numerico:
                    return "numeric";
            }

            return retorno;
        }
        #endregion

        #region "Html Extesion"
        #region "Text Box"
        public static MvcHtmlString TextBoxFor<TModel, TProperty>(this HtmlHelper<TModel> helper,
                    Expression<Func<TModel, TProperty>> property, bool enabled = true, bool required = false, int? valMin = null, int? valMax = null,
                    EMasks mask = EMasks.None, ETextAlign align = ETextAlign.Rigth, string htmlClass = null, int width = -1, int heigth = -1, int maxLength = 255)
        {
            var html = new StringBuilder();

            var classes = new StringBuilder();

            //Alinhamento do conteudo do campo
            classes.Append(GetClassByETextAlign(align) + " ");

            if (htmlClass != null)
                classes.Append(htmlClass + " ");

            dynamic htmlAttributes = new ExpandoObject();
            htmlAttributes.style = "";
            htmlAttributes.validate = "";

            if (!enabled)
                htmlAttributes.disabled = "disabled";

            if (required)
                htmlAttributes.validate += "[required]";
            if (valMin != null)
                htmlAttributes.validate += "[minFloat=" + valMin.Value + "]";
            if (valMax != null)
                htmlAttributes.validate += "[maxFloat=" + valMax.Value + "]";

            if (mask != EMasks.None)
                htmlAttributes.alt = GetMaskJsByEMask(mask);

            if (width >= 0)
                htmlAttributes.style += "width: " + width.ToString() + "px;";
            if (heigth >= 0)
                htmlAttributes.style += "height: " + width.ToString() + "px;";

            htmlAttributes.maxlength = maxLength;

            htmlAttributes.kind = "TextBox";

            htmlAttributes.@class = classes.ToString();

            html.AppendLine(helper.TextBoxFor(property, (ExpandoObject)htmlAttributes).ToHtmlString());

            return new MvcHtmlString(html.ToString());
        }
        #endregion

        #region "Text Area"
        public static MvcHtmlString TextAreaFor<TModel, TProperty>(this HtmlHelper<TModel> helper,
                   Expression<Func<TModel, TProperty>> property, bool enabled = true, bool required = false, EMasks mask = EMasks.None,
                   ETextAlign align = ETextAlign.Rigth, int width = -1, int heigth = -1, int maxLength = 255, long digits = 0)
        {
            var html = new StringBuilder();

            var classes = new StringBuilder();

            //Alinhamento do conteudo do campo
            classes.Append(GetClassByETextAlign(align) + " ");

            dynamic htmlAttributes = new ExpandoObject();
            htmlAttributes.style = "";

            if (!enabled)
                htmlAttributes.disabled = "disabled";

            if (required)
                htmlAttributes.validate = "[required]";

            if (width >= 0)
                htmlAttributes.style += "width: " + width.ToString() + "px;";

            if (heigth >= 0)
                htmlAttributes.style += "height: " + width.ToString() + "px;";

            htmlAttributes.maxlength = maxLength;

            htmlAttributes.kind = "TextBox";

            htmlAttributes.@class = classes.ToString();

            html.AppendLine(helper.TextAreaFor(property, (ExpandoObject)htmlAttributes).ToHtmlString());

            return new MvcHtmlString(html.ToString());
        }
        #endregion

        #region "Month Year"

        public static MvcHtmlString MonthYearFor<TModel, TProperty>(this HtmlHelper<TModel> helper,
                Expression<Func<TModel, TProperty>> property, bool enabled = true, bool required = false, MonthYear? valMinMonthYear = null, MonthYear? valMaxMonthYear = null,
                ETextAlign align = ETextAlign.Rigth)
        {
            var html = new StringBuilder();

            var classes = new StringBuilder();

            //Alinhamento do conteudo do campo
            classes.Append(GetClassByETextAlign(align) + " ");

            dynamic htmlAttributes = new ExpandoObject();
            htmlAttributes.validate = "";

            if (!enabled)
                htmlAttributes.disabled = "disabled";

            if (required)
                htmlAttributes.validate += "[required]";

            if (valMinMonthYear != null)
                htmlAttributes.validate += "[minMesAno=" + valMinMonthYear.Value.ToString() + "]";
            if (valMaxMonthYear != null)
                htmlAttributes.validate += "[maxMesAno=" + valMaxMonthYear.Value.ToString() + "]";

            htmlAttributes.maxlength = 7;

            htmlAttributes.kind = "MonthYear";

            htmlAttributes.validate += "[MesAno]";

            htmlAttributes.@class = classes.ToString();


            html.AppendLine(helper.TextBoxFor(property, (ExpandoObject)htmlAttributes).ToHtmlString());

            return new MvcHtmlString(html.ToString());
        }
        #endregion

        #region "Date Picker"
        public static MvcHtmlString DatePickerFor<TModel, TProperty>(this HtmlHelper<TModel> helper,
                Expression<Func<TModel, TProperty>> property, bool enabled = true, bool required = false, MonthYear? lockByMonthYear = null,
                ETextAlign align = ETextAlign.Rigth, DateTime? valMaxDate = null, DateTime? valMinDate = null)
        {
            var html = new StringBuilder();
            var classes = new StringBuilder();
            classes.Append(GetClassByETextAlign(align) + " ");
            dynamic htmlAttributes = new ExpandoObject();
            if (!enabled)
                htmlAttributes.disabled = "disabled";
            htmlAttributes.validate = "[date]";
            if (required)
                htmlAttributes.validate += "[required]";
            htmlAttributes.maxlength = 10;
            htmlAttributes.kind = "Date";
            if (lockByMonthYear.HasValue)
            {
                valMinDate = lockByMonthYear.Value.GetDate(1);
                valMaxDate = valMinDate.Value.LastDayOfMonth();
            }
            htmlAttributes.@class = classes.ToString();
            if (valMinDate.HasValue)
                htmlAttributes.validate += "[minDate=" + valMinDate.Value.ToShortDateString() + "]";
            if (valMaxDate.HasValue)
                htmlAttributes.validate += "[maxDate=" + valMaxDate.Value.ToShortDateString() + "]";
            html.AppendLine(helper.TextBoxFor(property, (ExpandoObject)htmlAttributes).ToHtmlString());
            return new MvcHtmlString(html.ToString());
        }
        #endregion

        #region "Auto Complete"
        public static MvcHtmlString AutoCompleteFor<TModel, TProperty>(this HtmlHelper<TModel> helper,
    Expression<Func<TModel, TProperty>> property, string sourceUrl, bool enabled = true,
    bool allowInvalidValues = false, string htmlClass = null, int maxLength = 255, int width = -1,
    bool insertButton = true, string cascade = null, bool showSelectWatermark = true, bool canEdit = true)
        {

            var textBox = TextBoxFor(helper, property, enabled: enabled, htmlClass: "autoComplete", maxLength: maxLength, width: width).ToHtmlString();
            textBox = textBox.Insert(textBox.Length - 4, "source='" + sourceUrl + "' ");
            textBox = textBox.Insert(textBox.Length - 4, "allow-invalid='" + allowInvalidValues + "' ");

            if (!canEdit)
            {
                textBox = textBox.Insert(textBox.Length - 4, "readonly='true'");
            }

            if (showSelectWatermark)
            {
                textBox = textBox.Insert(textBox.Length - 4, "placeholder='Seleccione'");
            }

            /*
            if (cascade != null)
                textBox = textBox.Insert(textBox.Length - 4, "cascade='" + cascade + "' ");
            */
            string button = string.Empty;
            if (insertButton)
                button = @"<button id='" + (property.Body as MemberExpression).Member.Name + "Button' />";

            string hidden = "<input type='text' id='" + (property.Body as MemberExpression).Member.Name + "Id" + "' style='display: none;'/>";
            return new MvcHtmlString(textBox + hidden + button);
        }
        #endregion
        public static MvcHtmlString DropDownListDynamic<TModel, TProperty>(this HtmlHelper<TModel> helper, Expression<Func<TModel, TProperty>> expression, string textField, string valueField, bool validate, string controllerName, string areaName, bool disabled = false)
        {
            TModel entity = helper.ViewData.Model;
            string expressionId = expression.Body.ToString().Split('.')[1];

            //Devido a implementação de AREAS, deve ser pego o caminho /Area/Controller
            string jsControle = controllerName;
            //string jsControle = expression.Body.Type.Name.Replace("Entity", "");
            string jsIdCombo = helper.ViewData.TemplateInfo.GetFullHtmlFieldId(expressionId);
            string jsValorSelecionado = string.Empty;
            var propriedades = new[] { jsIdCombo, valueField };
            object obj = entity;

            foreach (var property in propriedades)
            {
                try
                {
                    var info = obj.GetType().GetProperty(property);
                    obj = info.GetValue(obj, null);
                }
                catch (NullReferenceException)
                {
                    jsValorSelecionado = "0";
                }
            }

            if (obj != null)
                jsValorSelecionado = obj.ToString();

            return new MvcHtmlString(TextHtml(textField, valueField, validate, jsControle, jsIdCombo, jsValorSelecionado, areaName, disabled).ToString());
        }

        private static StringBuilder TextHtml(string textField, string valueField, bool validate, string jsControle, string jsIdCombo, string jsValorSelecionado, string areaName, bool disabled)
        {
            StringBuilder sb = new StringBuilder();
            string id = jsIdCombo + "_" + valueField;
            string name = jsIdCombo + "." + valueField;

            if (validate)
                sb.AppendLine("<select id='" + id + "' name='" + name + "' validate=[required]>");
            else
                sb.AppendLine("<select id='" + id + "' name='" + name + "'>");


            sb.AppendLine("<option></option>");
            sb.AppendLine("</select>");

            sb.Append("<script type=\"text/javascript\">");
            sb.Append("$(function() {");
            sb.Append("$('#" + id + "').jqDropDownList({");
            sb.Append("url: '/" + areaName + "/" + jsControle + "/GetAllInJson/?sidx=" + textField + "',");
            sb.Append("textField: '" + textField + "',");
            sb.Append("valueField: '" + valueField + "',");
            sb.Append("selectedValue: '" + jsValorSelecionado + "'");
            sb.Append("});");


            if (disabled)
                sb.Append("$('#" + id + "').attr('disabled','disabled')");

            sb.Append("});");
            sb.AppendLine("</script>");


            return sb;
        }

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
        #endregion
    }
}