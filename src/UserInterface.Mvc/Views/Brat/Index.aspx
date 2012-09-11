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
    <script type="text/javascript">
        $(function () {

        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="formItems" style="margin-left: 30%; margin-right: 30%; margin-top: 10%;
        width: 20%; height: 5%;">
        <div class="formItem inteiro" id="divBuscarPorCpf">
            <span>Informe o CPF:</span>
            <div class="formItem inteiro">
                <%= Html.TextBoxFor(model => model.Cpf) %>
            </div>
        </div>
        <div class="formItem inteiro">
        </div>
        <span class="clear">Ou</span>
        <div class="formItem inteiro">
        </div>
        <div class="formItem inteiro" id="divBuscarPorBrat">
            <span>Informe o número do BRAT:</span>
            <div class="formItem inteiro">
                <%= Html.TextBoxFor(model => model.NumeroBrat) %>
            </div>
        </div>
    </div>
</asp:Content>
