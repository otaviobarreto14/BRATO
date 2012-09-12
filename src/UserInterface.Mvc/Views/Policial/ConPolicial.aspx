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
            width: 5%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>(); %>
    <div class="formItems ">
        <div class="formItem quinto">
            <span>Matrícula</span>
            <%= Html.TextBoxFor(model => model.Matricula, new {size="15", MaxLength="15"})%>
        </div>
        <div class="formItem doisTercos">
            <span>Nome</span>
            <%= Html.TextBoxFor(model => model.Nome, new { size = "60", MaxLength = "60" })%>
        </div>
        <div class="formItem oitavo">
            <span>Batalhão</span>
            <%= Html.DropDownListFor(model => model.Batalhao, lstBatalhao, "Selecione", null) %>
        </div>
    </div>
    <div class="formItem quarto">
        <a href="#" id="buscar" class="ui-state-default ui-corner-all botao" style="float: left;">
            Buscar</a>
    </div>
    <br style="clear: both;" />
    <div class="formItem inteiro" id="divGrid" style="clear: both;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
</asp:Content>
