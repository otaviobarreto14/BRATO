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
        $("#divBuscarPorCpf").hide();
        $("#divBuscarPorBrat").hide();

        $("#buscarPorCpf").click(function () {
            $("#divBuscarPorCpf").show();
            $("#divBuscarPorBrat").hide();
            $("input[type=text]").val('');
        });

        $("#buscarPorBrat").click(function () {
            $("#divBuscarPorBrat").show();
            $("#divBuscarPorCpf").hide();
            $("input[type=text]").val('');
        });
    });
</script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <span>Buscar por:</span>
    <div class="formItem inteiro">
        <%= Html.RadioButtonFor(model => model.BuscarPorCpf, true, new {@style="width:10px;", id="buscarPorCpf"}) %>CPF
    </div>
    <div class="formItem inteiro">
        <%= Html.RadioButtonFor(model => model.BuscarPorCpf, false, new { @style = "width:10px;", id = "buscarPorBrat" })%>Nº
        BRAT
    </div>
    <div class="formItem inteiro" id="divBuscarPorCpf">
        <span>Informe o CPF:</span>
        <div>
            <%= Html.TextBoxFor(model => model.Cpf) %>
        </div>
    </div>
    <div class="formItem inteiro" id="divBuscarPorBrat">
        <span>Informe o número do BRAT:</span>
        <div>
            <%= Html.TextBoxFor(model => model.NumeroBrat) %>
        </div>
    </div>    
</asp:Content>
