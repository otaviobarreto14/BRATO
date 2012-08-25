using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;

namespace Brato.UserInterface.WebUserInterfaceHelper
{
    public class DropDownListHelper
    {
        public static IList<SelectListItem> CarregarDropDown<T>()
        {
            IList<SelectListItem> lst = new List<SelectListItem>();
            var enumItems = EnumHelper.GetList<T>();
            foreach (var enumitem in enumItems)
            {
                SelectListItem item = new SelectListItem() { Value = enumitem.Key.ToString(), Text = enumitem.Value };
                lst.Add(item);
            }
            return lst;
        }


    }
}