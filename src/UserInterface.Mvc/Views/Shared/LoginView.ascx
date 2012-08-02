<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="CasePlasa.UserInterface.Controllers" %>

<div id="divFuncaoTitulo"><span style="font-size: 22px; margin:0 18%; font-weight: bold; float:left" id="titulo"></span></div>

<span>
    <%  if (Request.IsAuthenticated)
        {
            Response.Write("Bem-vindo, " + Page.User.Identity.Name + " | " + Html.ActionLink("Trocar senha", "ChangePassword", "Acesso") + " | " + Html.ActionLink("Sair", "LogOff", "Acesso"));
        }
        else
        {
            Response.Write("Você não está autenticado | " + Html.ActionLink("Entrar", "LogOn", "Acesso"));
        } %>
</span>
<br/>
<span>Versão: <%= (Attribute.GetCustomAttribute(Assembly.GetAssembly(typeof(AcessoController)), typeof(AssemblyFileVersionAttribute)) as AssemblyFileVersionAttribute).Version %></span>
<%
    string authMessage = (string)Session["AuthMessage"];
    
    if (!string.IsNullOrEmpty(authMessage))
    {
        bool authMessageStay = (bool)Session["AuthMessage.Stay"]; 
        Response.Write(string.Format(@"<br /><span>{0}</span>", authMessage));
        
        if (!authMessageStay)
        {
            Session["AuthMessage"] = null;
            Session["AuthMessage.Stay"] = null;
        }
    } 
%>