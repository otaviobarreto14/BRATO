<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="TopDown.TopFramework.Common" %>
<%@ Import Namespace="TopDown.TopFramework.BusinessRules.Security.Authorization" %>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul id="dock">
    <%
        IAuthorizer authorizer = CommonContainer.Resolve<IAuthorizer>();
        foreach (ModuloEntity modulo in authorizer.GetModules(Page.User.Identity.Name))
            Html.RenderPartial("MenuHeader", modulo);        
    %>
</ul>
