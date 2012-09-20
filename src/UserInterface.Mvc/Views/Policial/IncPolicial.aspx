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
            font-size: 15px;
            margin: 5px;
            padding: 5px;
            position: relative;
            text-align: center;
            text-decoration: none;
            width: 18%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".accordion").accordion({ header: "h3", icons: { "headerSelected": "ui-icon-document"} });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            var retorno = '<%= ViewData["Retorno"].ToString() %>'
            if (retorno == "Sucesso") {
                jAlert("Policial Cadastrado com Sucesso");
                $("input[type='text']").val('');
                $("select").val('');
            }
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#btnSalvar").click(function () {
                //                $.ajax({
                //                    url: '/Policial/Salvar/',
                //                    data: $("#mainForm").serialize(),
                //                    type: "post",
                //                    cache: false,
                //                    success: function (Data) {
                //                        jAlert(Data.Mensagem);
                //                    }
                //                });
                $("#mainForm").submit();
            });
            $("#btnCancelar").click(function () {
                $("input[type='text']").val('');
                $("select ").val("Selecione");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var validationSummary = Html.ValidationSummary("Ocorreram os seguintes erros:");
        var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>();
        var lstPerfil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<PerfilEnum>();
    %>
    <% using (Html.BeginForm("Salvar", "Policial", FormMethod.Post, new { id = "mainForm" }))
       {  %>
    <div class="clear" style="position: fixed; margin-top: 10%; margin-left: 15%;">
        <div class="accordion">
            <div style="margin-right: -7.1%;">
                <h3>
                    <a href="#">Cadastro de Policial</a></h3>
                <div class="formItems" style="display: inline-table;">
                    <% Response.Write(validationSummary); %>
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
                    <div class="clear" style="margin-top: 25%; margin-left: 35%;">
                        <a href="#" id="btnSalvar" class="ui-state-default ui-corner-all botao" style="float: inherit;">
                            Salvar Dados</a> <a href="#" id="btnCancelar" class="ui-state-default ui-corner-all botao"
                                style="float: inherit;">Cancelar Dados</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
