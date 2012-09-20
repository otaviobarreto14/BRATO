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
            width: 45%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".accordion").accordion({ header: "h3", icons: { "headerSelected": "ui-icon-search"} });
        });
    </script>
    <script type="text/javascript">
        $(function () {
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
                //$("#mainForm").submit();
            });

            $("#btnCancelar").click(function () {
                $("input[type='text']").val('');
                $("select ").val("Selecione");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>(); %>
    <div class="clear" style="position: fixed; margin-top: 8%; margin-left: 8.5%; margin-right: 2%">
        <div class="accordion" style="display: inline-table;">
            <div>
                <h3>
                    <a href="#">Consulta de Policial</a></h3>
                <div class="formItems" style="width: inherit; height: 259px;">
                    <div class="clear" style="position: fixed; margin-top: 4%; margin-left: 45.5%;">
                        <a href="#" id="btnBuscar" class="ui-state-default ui-corner-all botao" style="float: inherit;">
                            Buscar Dados</a> <a href="#" id="btnCancelar" class="ui-state-default ui-corner-all botao"
                                style="float: inherit;">Cancelar Dados</a>
                    </div>
                    <div class="formItem inteiro">
                        <div class="formItem oitavo">
                            <span>Matrícula</span>
                            <%= Html.TextBoxFor(model => model.Matricula, new {size="15", MaxLength="15"})%>
                        </div>
                        <div class="formItem metade">
                            <span>Nome</span>
                            <%= Html.TextBoxFor(model => model.Nome, new { size = "60", MaxLength = "60" })%>
                        </div>
                        <div class="formItem oitavo">
                            <span>Batalhão</span>
                            <%= Html.DropDownListFor(model => model.Batalhao, lstBatalhao, "Selecione", null) %>
                        </div>
                    </div>
                    <br style="clear: both;" />
                    <br style="clear: both;" />
                </div>
            </div>
        </div>
        <div class="formItem inteiro" id="divGrid" style="clear: both;">
            <% Html.RenderPartial("GridControl"); %>
        </div>
    </div>
</asp:Content>
