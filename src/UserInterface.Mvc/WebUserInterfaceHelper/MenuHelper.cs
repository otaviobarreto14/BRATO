using System.Collections.Generic;
using System.Linq;
using TopDown.TopFramework.BusinessRules.Security.Authorization;
using TopDown.TopFramework.Common;
using TopDown.TopFramework.Entities;

namespace SISSMO.UserInterface.WebUserInterfaceHelper
{
    /// <summary>
    /// Classe auxiliadora na construção de menus.
    /// </summary>
    public class MenuHelper
    {
        private readonly IList<MenuItem> _menu;

        /// <summary>
        /// Cria uma instância do MenuHelper, usando o usuário especificado para filtrar as funções onde o usuário possui acesso.
        /// </summary>
        /// <param name="username">Nome do usuário.</param>
        /// <param name="moduleId">Identificador do módulo agrupador.</param>
        public MenuHelper(string username, int moduleId)
        {
            IAuthorizer authorizer = CommonContainer.Resolve<IAuthorizer>();
            _menu = authorizer.GetMenuTree(username, moduleId);
        }

        /// <summary>
        /// Renderiza o menu a partir do nó raiz.
        /// </summary>
        public string RenderMenu()
        {
            return RenderMenu(null);
        }

        /// <summary>
        /// Renderiza o menu a partir de um nó específico.
        /// </summary>
        /// <param name="parentMenu">Menu por onde começar a renderização.</param>
        public string RenderMenu(MenuItem parentMenu)
        {
            string html = "";

            foreach (var item in _menu.Where(m => m.Parent == parentMenu))
                html += item.RenderToHtml();

            return html;
        }
    }
}
