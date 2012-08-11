using System.Linq;
using TopDown.TopFramework.Entities;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    /// <summary>
    /// Extension Methods para a criação de um menu em html.
    /// </summary>
    public static class MenuItemExtensions
    {
        /// <summary>
        /// Renderiza um enu usando listas html.
        /// </summary>
        /// <param name="menu">Menu sendo renderizado.</param>
        public static string RenderToHtml(this MenuItem menu)
        {
            if (!menu.Children.Any())
            {
                if (!string.IsNullOrEmpty(menu.Path))
                    return string.Format("<li><a href='{0}'>{1}</a></li>", menu.Path, menu.Title);
                else
                    return string.Format("<li><a href='#'>{0}</a></li>", menu.Title);
            }
            else
            {
                string html = "";

                if (!string.IsNullOrEmpty(menu.Path))
                    html += string.Format("<li><a href='{0}'>{1}</a>", menu.Path, menu.Title);
                else
                    html += string.Format("<li><a href='#'>{0}</a>", menu.Title);
                
                html += "<ul>";
                foreach (var child in menu.Children)
                    html += child.RenderToHtml();
                html += "</ul></li>";

                return html;
            }
        }
    }
}
