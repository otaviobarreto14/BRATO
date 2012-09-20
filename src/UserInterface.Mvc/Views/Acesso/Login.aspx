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
        .botao
        {
            font-size: 15px;
            margin: 5px;
            padding: 5px;
            position: relative;
            text-align: center;
            text-decoration: none;
            width: 70%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".accordion").accordion({ header: "h3" });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#cancelar").click(function () {
                $("input[type='text']").val("");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="formItems" style="margin-left: 34%; margin-right: 30%; margin-top: 10%;
        width: 30%; height: 10%;">
        <div class="accordion" style="display: inline-table;">
            <h3>
                <a href="#">Login</a></h3>
            <div>
                <div class="formItem inteiro">
                    <span style="margin-left: 18%;">Matrícula</span>
                    <div class="formItem doisTercos" style="margin-left: 18%;">
                        <%= Html.TextBoxFor(model => model.Matricula, new { size = "15", MaxLength = "15" })%>
                    </div>
                </div>
                <div class="formItem inteiro" id="divBuscarPorBrat">
                    <span style="margin-left: 18%;">Senha</span>
                    <div class="formItem doisTercos" style="margin-left: 18%;">
                        <%= Html.PasswordFor(model => model.Senha, new { size = "15", MaxLength = "8" })%>
                    </div>
                </div>
                <div class="formItem inteiro" style="margin-left: 6%;">
                    <div class="formItem metade">
                        <a href="#" id="btnLogin" class="ui-state-default ui-corner-all botao" style="float: left;">
                            Login</a></div>
                    <div class="formItem metade">
                        <a href="#" id="btnCancelar" class="ui-state-default ui-corner-all botao" style="float: left;">
                            Cancelar</a></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
