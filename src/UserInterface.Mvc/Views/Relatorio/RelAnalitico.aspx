<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.RelatorioModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var lstCirc = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CircunstanciaEnum>();
        var lstCatCnh = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CategoriaCNH>();
        var lstCondTempo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CondTempoEnum>();
        var lstEstCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>();
        var lstFerimentos = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<FerimentosEnum>();
        var lstSexo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SexoEnum>();
        var lstSinalizacao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SinalizacaoEnum>();
        var lstTipoAcidente = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<TipoAcidenteEnum>();
    %>
    <div id="divInformacoes">
        <span>Circunstância:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Todos", null)%>
        </div>
        <span>Condições do Tempo:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.CondicaoTempo, lstCondTempo, "Todos", null)%>
        </div>
        <span>Sinalização:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.Sinalizacao, lstSinalizacao, "Todos", null)%>
        </div>
        <span>Tipo do Acidente:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.TipoAcidente, lstTipoAcidente, "Todos", null)%>
        </div>
    </div>
    <div id="divLocalidade">
        <h2>
            Localidade</h2>
        <span>UF:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.UF, new { size = "15", MaxLength = "2" })%>
        </div>
        <span>Municipio:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.Município, new { size = "15", MaxLength = "15" })%>
        </div>
        <span>Bairro:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.Bairro, new {size="15", MaxLength="15"})%>
        </div>
        <span>Logradouro:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.Logradouro, new { size = "15", MaxLength = "15" })%>
        </div>
    </div>
    <div id="divMotorista">
        <span>Sexo:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.SexoMotorista, lstSexo, "Todos", null)%>
        </div>
        <span>Categoria CNH:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.CategoriaCnh, lstCatCnh, "Todos", null)%>
        </div>
        <span>Estado Civil:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.EstadoCivilMotorista, lstEstCivil, "Todos", null)%>
        </div>
        <span>Idade:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.IdadeMotorista, new { size = "15", MaxLength = "15" })%>
        </div>
    </div>
    <div id="divVitimas">
        <span>Com Vitimas:</span>
        <div class="formItem inteiro">
            <%= Html.CheckBoxFor(model => model.ComVitimas)%>
        </div>
        <span>Ferimentos:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.Ferimentos, lstFerimentos, "Todos", null)%>
        </div>
        <span>Idade:</span>
        <div class="formItem inteiro">
            <%= Html.TextBoxFor(model => model.Idade, new { size = "15", MaxLength = "15" })%>
        </div>
        <span>Sexo:</span>
        <div class="formItem inteiro">
            <%= Html.DropDownListFor(model => model.Sexo, lstSexo, "Todos", null)%>
        </div>
    </div>
</asp:Content>
