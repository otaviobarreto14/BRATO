<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Consultar Brat
        Título da Tela = Consultar Brat
        Msg de Sucesso = Não Aplicável
        Msg de Cancelamento = Consulta Cancelada
        Msg de Dados Não Encontrados = BRAT não Encontrado  
        
        AO ENCONTRAR MAIS DE UM RESULTADO AO CONSULTAR EXIBIR NO GRID, SENÃO EXIBIR DIRETO NA TELA EM MODO DE RELATÓRIO                   
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.ConsultarBratModel>" %>

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
    <div class="formItems" style="margin-left: 36%; margin-right: 30%; margin-top: 10%;
        width: 20%; height: 10%;">
        <div class="formItem inteiro" id="divBuscarPorCpf" style="margin-left: 29px;">
            <span>Informe o CPF:</span>
            <div class="formItem doisTercos">
                <%= Html.TextBoxFor(model => model.Cpf) %>
            </div>
        </div>
        <div class="formItem inteiro">
        </div>
        <span class="clear" style="margin-left: 41%;">Ou</span>
        <div class="formItem inteiro">
        </div>
        <div class="formItem inteiro" id="divBuscarPorBrat" style="margin-left: 29px;">
            <span>Informe o número do BRAT:</span>
            <div class="formItem doisTercos">
                <%= Html.TextBoxFor(model => model.NumeroBrat) %>
            </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem metade">
            <a href="#" id="consultar" class="ui-state-default ui-corner-all botao" style="float: left;">
                Consultar</a></div>
        <div class="formItem metade">
            <a href="#" id="cancelar" class="ui-state-default ui-corner-all botao" style="float: left;">
                Cancelar</a></div>
    </div>
    </div>
</asp:Content>
