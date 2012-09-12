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

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .botao
        {
            padding: 0px 20px;
            text-decoration: none;
            position: relative;
            font-size: 18px;
            width: 100px;
            text-align: center;
            margin: 5px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#btnSalvar").click(function () {
                $("#mainForm").submit();
            });
            $("#btnCancelar").click(function () {
                $("input[type='text']").val('');
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>();
        var lstPerfil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<PerfilEnum>();
    %>
    <% using (Html.BeginForm("Salvar", "Policial", FormMethod.Post, new { id = "mainForm" }))
       { %>
    <div class="formItems">
        <div class="formItem inteiro">
            <div class="formItem quarto">
                <span>*Matrícula</span>
                <%= Html.TextBoxFor(model => model.Matricula, new { size = "15", MaxLength = "15" })%>
            </div>
        </div>
        <div class="formItem inteiro">
            <div class="formItem doisTercos">
                <span>*Nome</span>
                <%= Html.TextBoxFor(model => model.Nome, new { size = "60", MaxLength = "60" })%>
            </div>
            <div class="formItem quarto">
                <span>*Batalhão</span>
                <%= Html.DropDownListFor(model => model.Batalhao, lstBatalhao, "Selecione", null)%>
            </div>
        </div>
        <div class="formItem inteiro">
            <div class="formItem quarto">
                <span>*Perfil</span>
                <%= Html.DropDownListFor(model => model.IdPerfil.IdPerfil, lstPerfil, "Selecione", null)%>
            </div>
            <div class="formItem quarto">
                <span>*Senha</span>
                <%= Html.PasswordFor(model => model.Senha, new { size = "20", MaxLength = "8" })%>
            </div>
            <div class="formItem quarto">
                <span>*Confirmar Senha</span><%= Html.Password("ConfSenha")%>
            </div>
            <div class="formItem quarto">
                <%= Html.HiddenFor(model => model.Status)%>
            </div>
        </div>
        <div class="formItem inteiro">
            <a href="#" id="btnSalvar" class="ui-state-default ui-corner-all botao" style="float: left;">Salvar
                Dados</a> <a href="#" id="btnCancelar" class="ui-state-default ui-corner-all botao" style="float: left;">
                    Cancelar Dados</a>
        </div>
    </div>
    <%} %>
</asp:Content>
