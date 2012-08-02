<%@ Import Namespace="TopDown.TopFramework.WebUserInterfaceHelper" %>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ModuloEntity>" %>
<li class="aba" style='background-image: url(/Content/Images/<%= Model.CodModulo %>.jpg);'>
    <ul class="free">
        <li class="header"><a href="#" class="dock">Fixar</a> <a href="#" class="undock">Soltar</a>
            <%= Model.NomModulo %>
        </li>
        <li class="menuItems">
            <ul>
                <%= new MenuHelper(Page.User.Identity.Name, (int)Model.CodModulo).RenderMenu() %></ul>
        </li>
    </ul>
</li>
