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
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#cancelar").click(function () {
                $("input[type='text']").val("");
                $("select ").val("Todos");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>();
    %>
    <div class="clear" style="position: fixed; margin-top: 2%; margin-left: 68%;">
        <a href="#" id="GerRelatorio" class="ui-state-default ui-corner-all botao" style="float: inherit;">
            Gerar Relatório</a> <a href="#" id="cancelar" class="ui-state-default ui-corner-all botao"
                style="float: inherit;">Cancelar</a></div>
    <br>
    <br>
    <br>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Policial</a></h3>
            <div id="div1" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem ">
                            <span>Matrícula</span>
                            <%= Html.TextBoxFor(model => model.MatriculaPolicial, new { size = "15", MaxLength = "15" })%>
                        </div>
                        <div class="formItem ">
                            <span>Nome</span>
                            <%= Html.TextBoxFor(model => model.NomePolicial, new { size = "60", MaxLength = "60" })%>
                        </div>
                        <div class="formItem ">
                            <span>Batalhão</span>
                            <%= Html.DropDownListFor(model => model.BatalhaoPolicial, lstBatalhao, "Todos", null)%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
