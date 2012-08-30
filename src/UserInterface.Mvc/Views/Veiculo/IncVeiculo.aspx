<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados                       
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.VeiculoEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <span>*Nome do Proprietário:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.NomeProprietario, new { size = "60", MaxLength = "50" })%>
    </div>
    <span>*Tipo de Veículo:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.TipoVeiculo, null)%>
    </div>
    <span>*Fabricante:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Fabricante, null)%>
    </div>
    <span>*Modelo:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Modelo, null)%>
    </div>
    <span>*Ano:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Ano, new { size = "8", MaxLength = "4" })%>
    </div>
    <span>*Cor:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Cor, null)%>
    </div>
    <span>*Placa:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Placa, new { size = "10", MaxLength = "7" })%>
    </div>
    <span>Impacto(s):</span>
    <div class="formItem inteiro">
        <%= Html.CheckBox("Impacto")%>
    </div>
    <span>Avaria(s):</span>
    <div class="formItem inteiro">
        <%= Html.CheckBox("Avaria")%>
    </div>
    <br />
    <div class="formItem inteiro" id="divGrid" style="clear: both;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
</asp:Content>
