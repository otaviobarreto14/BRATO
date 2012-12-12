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
            $(".accordion").accordion({ header: "h3", icons: { "headerSelected": "ui-icon-search"} });
        });
    </script>
    <script type="text/javascript">
        $(function () {

            $("#filtros").show();
            $("#result").hide();

            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#cancelar").click(function () {
                $("input[type='text']").val("");
            });
            $("#voltar").click(function () {
                $("input[type='text']").val("");
                $("#links").html('');
                $("#filtros").show();
                $("#result").hide();
            });

            $("#consultar").click(function () {
                $.ajax({
                    url: '/Brat/BuscarBrat/',
                    data: $("#mainForm").serialize(),
                    type: "post",
                    cache: false,
                    success: function (json) {
                        //Sucesso = true, BuscaPorNumero = false, NumBrat = lst
                        if (json.Sucesso == true) {
                            if (json.BuscaPorNumero == true) {
                                window.location = "/Brat/VisualizarBrat?numero=" + json.NumBrat
                            }
                            else {
                                $("#result").show();
                                var str = "";
                                for (v in json.NumBrat) {
                                    str = "<div class='formItem inteiro'><a href='/Brat/VisualizarBrat?numero=" + json.NumBrat[v] + "' target='_blank'>Clique Aqui para Abrir - BRAT Número " + json.NumBrat[v] + "</a></div>";
                                    $("#links").append(str);
                                }

                                $("#filtros").hide();

                            }
                        }
                        else {
                            jAlert("Nenhum BRAT encontrado");
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="mainForm">
    <div class="formItems" style="margin-left: 34%; margin-right: 30%; margin-top: 10%;
        width: 30%; height: 10%;">
        <div class="accordion" style="display: inline-table;" id="filtros">
            <h3>
                <a href="#">Consultar BRAT</a></h3>
            <div>
                <div class="formItem inteiro" id="divBuscarPorCpf">
                    <span style="margin-left: 18%;">Informe o CPF</span>
                    <div class="formItem doisTercos" style="margin-left: 18%;">
                        <%= Html.TextBoxFor(model => model.Cpf, new { @alt = "99999999999", MaxLength = "11" })%>
                    </div>
                </div>
                <div class="formItem inteiro">
                </div>
                <span class="clear" style="margin-left: 45%;">Ou</span>
                <div class="formItem inteiro">
                </div>
                <div class="formItem inteiro" id="divBuscarPorBrat">
                    <span style="margin-left: 18%;">Informe o número do BRAT</span>
                    <div class="formItem doisTercos" style="margin-left: 18%;">
                        <%= Html.TextBoxFor(model => model.NumeroBrat) %>
                    </div>
                </div>
                <div class="formItem inteiro" style="margin-left: 6%;">
                    <div class="formItem metade">
                        <a href="#" id="consultar" class="ui-state-default ui-corner-all botao" style="float: left;">
                            Consultar</a></div>
                    <div class="formItem metade">
                        <a href="#" id="cancelar" class="ui-state-default ui-corner-all botao" style="float: left;">
                            Cancelar</a></div>
                </div>
            </div>
        </div>
        <div class="accordion" id="result" style="display: inline-table;">
            <div class="formItem inteiro" id="links">
            </div>
            <div class="formItem metade">
                <a href="#" id="voltar" class="ui-state-default ui-corner-all botao" style="float: left;">
                    Voltar</a></div>
        </div>
    </div>
    </form>
</asp:Content>
