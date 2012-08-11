using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TopDown.TopFramework.WebUserInterfaceHelper.Mvc;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    public class DateTimeModelBinder : LocalizedModelBinder
    {
        public DateTimeModelBinder() : base("pt-MZ")
        {
        }

        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var valueProviderResult = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);

            if (valueProviderResult != null && !string.IsNullOrEmpty(valueProviderResult.AttemptedValue))
            {
                string attemptedValue = valueProviderResult.AttemptedValue;
                string[] dateSplitted = attemptedValue.Split(' ')[0].Split('/');

                int dia, mes, ano, aux;
                dia = int.Parse(dateSplitted[0]);
                mes = int.Parse(dateSplitted[1]);
                ano = int.Parse(dateSplitted[2]);
                if (mes > 12)
                {
                    aux = mes;
                    mes = dia;
                    dia = aux;
                }
                return new DateTime(ano, mes, dia);
            }
            return base.BindModel(controllerContext, bindingContext);
        }
    }
}