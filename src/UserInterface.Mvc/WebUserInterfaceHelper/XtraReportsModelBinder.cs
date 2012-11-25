using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TopDown.TopFramework.WebUserInterfaceHelper.Mvc;
using System.Globalization;
using System.Web.Mvc;

namespace Brato.UserInterface.WebUserInterfaceHelper
{
    public class XtraReportsModelBinder : LocalizedModelBinder
    {
        private readonly CultureInfo _cultureInfo;

        /// <summary>
        /// Construtor com a opção de cultura.
        /// </summary>
        /// <param name="cultureName">Nome da cultura no formato xx-yy.</param>
        public XtraReportsModelBinder(string cultureName)
            : base(cultureName)
        {
            _cultureInfo = CultureInfo.GetCultureInfo(cultureName);
        }

        private bool IsXtraReportRequest(ModelBindingContext bindingContext)
        {
            return bindingContext.ValueProvider.ContainsPrefix("DXCallbackName");
        }

        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var valueProviderResult = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);

            if (valueProviderResult != null)
            {
                // Primeira requisição-filha
                if (controllerContext.IsChildAction && valueProviderResult.RawValue != null && valueProviderResult.RawValue.GetType() != typeof(string))
                {
                    return valueProviderResult.RawValue;
                }
                
                // Segunda requisição-filha
                if (!controllerContext.IsChildAction && IsXtraReportRequest(bindingContext))
                {
                    if (bindingContext.ModelType == typeof(DateTime) || bindingContext.ModelType == typeof(DateTime?))
                        return DateTime.Parse(valueProviderResult.AttemptedValue, valueProviderResult.Culture);
                    else if (bindingContext.ModelType == typeof(decimal) || bindingContext.ModelType == typeof(decimal?))
                        return decimal.Parse(valueProviderResult.AttemptedValue, valueProviderResult.Culture);
                    else if (bindingContext.ModelType == typeof(float) || bindingContext.ModelType == typeof(float?))
                        return float.Parse(valueProviderResult.AttemptedValue, valueProviderResult.Culture);
                    else if (bindingContext.ModelType == typeof(double) || bindingContext.ModelType == typeof(double?))
                        return double.Parse(valueProviderResult.AttemptedValue, valueProviderResult.Culture);
                }
            }

            return base.BindModel(controllerContext, bindingContext);
        }
    }
}