<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Menu Administração/Consultar Policial        
        Título da Tela = Consultar Policial
        Msg de Cancelamento = Consulta Cancelada
        Msg de Dados não Encontrados = Policial não Cadastrado
        Alterar Policial = Chama a Tela de Inclusão (Modo de Edição)
        Ativação e Desativação do Policial (Confirmação)
            Msg de Sucesso = Policial Ativado com Sucesso
            Msg de Cancelamento = Ativação Cancelada
            Msg de Sucesso = Policial Desativado com Sucesso
            Msg de Cancelamento = Desativação Cancelada                        
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.ConsultarPolicialModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <span>Matrícula:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Matricula, new {size="15", MaxLength="15"})%>
    </div>
    <span>Nome:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Nome, new { size = "60", MaxLength = "60" })%>
    </div>
    <span>Batalhão:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Batalhao, null) %>
    </div>
    <br />
    <br />
    <span style="padding-right: 300px"></span>
    <input type="button" id="Consultar" value="Consultar Policial" style="width: 120px;
        height: 24px; text-align: center" />
    <input type="button" id="Cancelar" value="Cancelar" style="width: 120px; height: 24px;
        text-align: center" />
    <span style="padding-right: 185px"></span>
    <input type="button" id="Alterar" value="Alterar Policial" style="width: 120px; height: 24px;
        text-align: center" />
    <input type="button" id="Ativar" value="Ativar Policial" style="width: 120px; height: 24px;
        text-align: center" />
    <input type="button" id="Desativar" value="Desativar Policial" style="width: 120px;
        height: 24px; text-align: center" />
    <br />
    <br />
    <span>GRID</span>
</asp:Content>
