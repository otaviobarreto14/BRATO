<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Relatório/Relatório de Policiais/Policiais Cadastrados
        Título da Tela = Relatório Policial
        Msg de Sucesso = Não Aplicável
        Msg de Cancelamento = Relatório Cancelado        
        Msg de Dados Não Encontrados = Sem Dados para Geração                 
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.RelatorioModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            $(".accordion").accordion({ header: "h3", collapsible: true, active: 2 });
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
        var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>();
    %>
    <div class="accordion">
        <div>
            <h3>
                <a href="#">Policial</a></h3>
            <div id="divPolicial">
                <span>Nome:</span>
                <div class="formItem inteiro">
                    <%= Html.TextBoxFor(model => model.NomePolicial, new { size = "60", MaxLength = "60" })%>
                </div>
                <span>Batalhão:</span>
                <div class="formItem inteiro">
                    <%= Html.DropDownListFor(model => model.BatalhaoPolicial, lstBatalhao, "Todos", null)%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
