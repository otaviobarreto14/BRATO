<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Login
        Título da Tela = Login
        Msg de Sucesso = Não Aplicável
        Msg de Cancelamento = Login Cancelado
        Msg de Dados Não Encontrados = Usuário e/ou Senha Inválido(s)    
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.PolicialEntity>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        #login
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
            $('#login').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="margin-left: 45%; margin-right: 45%; margin-top: 10%;">
        <div class="formItem metade">
            <div class="formItem metade">
                <span>Matricula:</span>
                <div class="formItem metade">
                    <%= Html.TextBoxFor(model => model.Matricula, new { size = "15", MaxLength = "15" })%>
                </div>
            </div>
            <div class="formItem metade">
                <span>Senha:</span>
                <div class="formItem metade">
                    <%= Html.PasswordFor(model => model.Senha, new { size = "15", MaxLength = "8" })%>
                </div>
            </div>
            <div class="formItem metade">
                <a href="#" id="login" class="ui-state-default ui-corner-all" style="float: left;">Entrar</a>
            </div>
        </div>
    </div>
</asp:Content>
