using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using SISSMO.Entities;
using System.Reflection;
using System.ComponentModel;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    public class EnumHelper
    {
        public static IEnumerable<KeyValuePair<int, string>> GetList<T>()
        {
            var arrayValues = (int[])(Enum.GetValues(typeof(T)).Cast<int>());
             List<KeyValuePair<int, string>> lst = null;
            for (int i = 0; i < arrayValues.Length; i++)
            {
                if (lst == null)
                    lst = new List<KeyValuePair<int, string>>();
                int value = arrayValues[i];
                string name = GetEnumDescription<T>((value));
                lst.Add(new KeyValuePair<int, string>( value, name ));
            }
            return lst;
        }

        public static string GetEnumDescription<TEnum>(int value)
        {
            return GetEnumDescription((Enum)(object)((TEnum)(object)value));
        }

        public static string GetEnumDescription(Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes =
                (DescriptionAttribute[])fi.GetCustomAttributes(
                typeof(DescriptionAttribute),
                false);

            if (attributes != null &&
                attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }
    }
}