<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Menu Administração/Cadastrar Policial
        Título da Tela = Cadastrar Policial
        Msg de Sucesso = Policial Cadastrado com Sucesso
        Msg de Sucesso (Modo de Edição) = Policial Alterado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Cancelamento (Modo de Edição) = Alteração Cancelada
        Msg de Validação = Verificar Dados Informados
        Msg de Unicidade = Policial já Cadastrado         
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.PolicialEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <span>*Matrícula:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Matricula, new {size="15", MaxLength="15"})%>
    </div>
    <span>*Nome:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Nome, new { size = "60", MaxLength = "60" })%>
    </div>
    <span>*Batalhão:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Batalhao, null) %>
    </div>
    <span>*Perfil:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.IdPerfil, null) %>
    </div>
    <span>*Senha:</span>
    <div class="formItem inteiro">
        <%= Html.PasswordFor(model => model.Senha, new { size = "20", MaxLength = "8" })%>
    </div>
    <span>*Confirmar Senha:</span>
    <div class="formItem inteiro">
        <%= Html.Password("ConfSenha")%>
    </div>
    <div class="formItem inteiro">
        <%= Html.HiddenFor(model => model.Status) %>
    </div>
    <br />
    <br />
    <input type="button" id="Salvar" value="Salvar Dados" style="width: 120px; height: 24px;
        text-align: center" />
    <input type="button" id="Cancelar" value="Cancelar Dados" style="width: 120px; height: 24px;
        text-align: center" />
</asp:Content>
