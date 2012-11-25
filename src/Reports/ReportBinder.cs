using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using DevExpress.XtraReports.UI;
using System.Globalization;

namespace Brato.Reports
{
    public class ReportBinder<T> where T : class
    {
        private XtraReport _report;

        public ReportBinder(XtraReport report)
        {
            this._report = report;
        }

        private string GetBodyToString<TResult>(Expression<Func<T, TResult>> expression)
        {
            var propertyName = string.Join(".", expression.Body.ToString().Split('.').Skip(1));
            return propertyName;
        }

        /// <summary>
        /// Liga uma propriedade do relatório a uma propriedade do tipo da fonte de dados no formato de texto
        /// </summary>
        /// <typeparam name="TResult">Tipo da entidade que fará ligação com o relatório</typeparam>
        /// <param name="control">Controle/Propriedade do relatório</param>
        /// <param name="expression">Propriedade da entidade</param>
        public virtual ReportBinder<T> BindText<TResult>(XRControl control, Expression<Func<T, TResult>> expression)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression));
            return this;
        }

        /// <summary>
        /// Liga uma propriedade do relatório a uma propriedade do tipo da fonte de dados no formato numérico
        /// </summary>
        /// <typeparam name="TResult">Tipo da entidade que fará ligação com o relatório</typeparam>
        /// <param name="control">Controle/Propriedade do relatório</param>
        /// <param name="expression">Propriedade da entidade</param>
        public virtual ReportBinder<T> BindNumber<TResult>(XRControl control, Expression<Func<T, TResult>> expression)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression), "{0:N}");
            return this;
        }

        /// <summary>
        /// Liga uma propriedade do relatório a uma propriedade do tipo da fonte de dados em um formato específico de string
        /// </summary>
        /// <typeparam name="TResult">Tipo da entidade que fará ligação com o relatório</typeparam>
        /// <param name="control">Controle/Propriedade do relatório</param>
        /// <param name="expression">Propriedade da entidade</param>
        public virtual ReportBinder<T> BindFormat<TResult>(XRControl control, Expression<Func<T, TResult>> expression, string format)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression), format);
            return this;
        }

        /// <summary>
        /// Liga uma propriedade do relatório a uma propriedade do tipo da fonte de dados no formato de unidade monetária
        /// </summary>
        /// <typeparam name="TResult">Tipo da entidade que fará ligação com o relatório</typeparam>
        /// <param name="control">Controle/Propriedade do relatório</param>
        /// <param name="expression">Propriedade da entidade</param>
        public virtual ReportBinder<T> BindCurrency<TResult>(XRControl control, Expression<Func<T, TResult>> expression)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression), "{0:C}");
            return this;
        }

        /// <summary>
        /// Liga uma propriedade do relatório a uma propriedade do tipo da fonte de dados no formato de data (DD/MM/YYYY)
        /// </summary>
        /// <typeparam name="TResult">Tipo da entidade que fará ligação com o relatório</typeparam>
        /// <param name="control">Controle/Propriedade do relatório</param>
        /// <param name="expression">Propriedade da entidade</param>
        public virtual ReportBinder<T> BindDate<TResult>(XRControl control, Expression<Func<T, TResult>> expression)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression), "{0:dd/MM/yyyy}");
            return this;
        }

        public virtual ReportBinder<T> BindMonthYear<TResult>(XRControl control, Expression<Func<T, TResult>> expression)
        {
            control.DataBindings.Add("Text", _report.DataSource, GetBodyToString(expression), "{0:MM/yyyy}");
            return this;
        }

        public virtual ReportBinder<T> BindGroupHeader<TResult>(GroupHeaderBand control, Expression<Func<T, TResult>> expression)
        {
            control.GroupFields.Add(new GroupField(GetBodyToString(expression)));
            return this;
        }
    }
}
