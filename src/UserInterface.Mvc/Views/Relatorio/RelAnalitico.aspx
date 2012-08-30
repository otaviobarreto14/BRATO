<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.RelatorioModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var lstCirc = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CircunstanciaEnum>();
        var lstCatCnh = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CategoriaCNH>();
    %>
    <span>Bairro:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Bairro, new {size="15", MaxLength="15"})%>
    </div>
    <span>Categoria CNH:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.CategoriaCnh, lstCatCnh, "Todos", null)%>
    </div>
    <span>Circunstância:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Todos", null)%>
    </div>

</asp:Content>
