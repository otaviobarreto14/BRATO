<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.RelatorioModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            // Accordion
            //$("#accordion").accordion({ header: "h3", collapsible: true });
            $("#accordion").addClass("ui-accordion ui-accordion-icons ui-widget ui-helper-reset").find("h3")
    .addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
    .hover(function () { $(this).toggleClass("ui-state-hover"); })
    .prepend('<span class="ui-icon ui-icon-triangle-1-e"></span>')
    .click(function () {
        $(this)
        .toggleClass("ui-accordion-header-active ui-state-active ui-state-default ui-corner-bottom")
        .find("> .ui-icon").toggleClass("ui-icon-triangle-1-e ui-icon-triangle-1-s").end()
        .next().toggleClass("ui-accordion-content-active").slideToggle();
        return false;
    })
    .next()
      .addClass("ui-accordion-content  ui-helper-reset ui-widget-content ui-corner-bottom")
      .hide();
        });
    </script>
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
    <div id="accordion">
        <div>
            <h3>
                <a href="#">Localidade</a></h3>
            <div id="divLocalidade">
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
        </div>
        <div>
            <h3>
                <a href="#">Acidente</a></h3>
            <div id="divAcidente">
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
                <span>Circunstância:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Todos", null)%>
                </div>
            </div>
        </div>
        <div>
            <h3>
                <a href="#">Vítima</a></h3>
            <div id="divVitimas">
                <span>Com Vitima(s):</span>
                <div class="formItem inteiro">
                    <%= Html.CheckBoxFor(model => model.ComVitimas)%>
                </div>
                <span>Idade:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.IdadeVitima, new { size = "15", MaxLength = "15" })%>
                </div>
                <span>Sexo:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.SexoVitima, lstSexo, "Todos", null)%>
                </div>
                <span>Ferimentos:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.FerimentosVitima, lstFerimentos, "Todos", null)%>
                </div>
            </div>
        </div>
        <div>
            <h3>
                <a href="#">Veículo</a></h3>
            <div id="divVeiculo">
                <span>Tipo de Veículo:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.TipoVeiculo)%>
                </div>
                <span>Fabricante:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.Fabricante)%>
                </div>
                <span>Modelo:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.Modelo)%>
                </div>
            </div>
        </div>
        <div>
            <h3>
                <a href="#">Motorista</a></h3>
            <div id="divMotorista">
                <span>Idade:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.IdadeMotorista, new { size = "15", MaxLength = "15" })%>
                </div>
                <span>Sexo:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.SexoMotorista, lstSexo, "Todos", null)%>
                </div>
                <span>Estado Civil:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.EstadoCivilMotorista, lstEstCivil, "Todos", null)%>
                </div>
                <span>Categoria CNH:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.CategoriaCnh, lstCatCnh, "Todos", null)%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
