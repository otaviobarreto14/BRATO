<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Relatório/Relatório de Acidentes/Gerenciais
        Título da Tela = Relatório Gerencial
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

            $("#GerRelatorio").click(function () {
                $("#mainForm").submit();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%
        var lstCirc = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CircunstanciaEnum>();
        var lstCatCnh = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CategoriaCNH>();
        var lstCondTempo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CondTempoEnum>();
        var lstEstCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>();
        var lstFerimentos = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<FerimentosEnum>();
        var lstSexo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SexoEnum>();
        var lstSinalizacao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SinalizacaoEnum>();
        var lstTipoAcidente = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<TipoAcidenteEnum>();
        var lstBatalhao = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<BatalhaoEnum>();
    %>
    <div class="clear" style="position: fixed; margin-top: 2%; margin-left: 68%;">
        <a href="#" id="GerRelatorio" class="ui-state-default ui-corner-all botao" style="float: inherit;">
            Gerar Relatório</a> <a href="#" id="cancelar" class="ui-state-default ui-corner-all botao"
                style="float: inherit;">Cancelar</a></div>
    <br>
    <br>
    <br>
    <% using (Html.BeginForm("FiltrarRelatórioGerencial", "Relatorio", FormMethod.Post, new { id = "mainForm" }))
       { %>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Localidade</a></h3>
            <div id="divLocalidade" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem ">
                            <span>UF</span>
                            <%= Html.TextBoxFor(model => model.UF, new { size = "1", MaxLength = "2" })%>
                        </div>
                        <div class="formItem ">
                            <span>Municipio</span>
                            <%= Html.TextBoxFor(model => model.Município, new { size = "35", MaxLength = "50" })%>
                        </div>
                        <div class="formItem ">
                            <span>Bairro</span>
                            <%= Html.TextBoxFor(model => model.Bairro, new {size="30", MaxLength="50"})%>
                        </div>
                        <div class="formItem ">
                            <span>Logradouro</span>
                            <%= Html.TextBoxFor(model => model.Logradouro, new { size = "50", MaxLength = "50" })%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Acidente</a></h3>
            <div id="divAcidente" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem quinto">
                            <span>Condições do Tempo</span>
                            <%= Html.DropDownListFor(model => model.CondicaoTempo, lstCondTempo, "Todos", null)%>
                        </div>
                        <div class="formItem quinto">
                            <span>Sinalização</span>
                            <%= Html.DropDownListFor(model => model.Sinalizacao, lstSinalizacao, "Todos", null)%>
                        </div>
                        <div class="formItem quinto">
                            <span>Tipo do Acidente</span>
                            <%= Html.DropDownListFor(model => model.TipoAcidente, lstTipoAcidente, "Todos", null)%>
                        </div>
                        <div class="formItem quinto">
                            <span>Circunstância</span>
                            <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Todos", null)%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Vítima</a></h3>
            <div id="divVitimas" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem nono">
                            <span>Com Vitima(s)</span>
                            <%= Html.CheckBoxFor(model => model.ComVitimas)%>
                        </div>
                        <div class="formItem ">
                            <span>Idade</span>
                            <%= Html.TextBoxFor(model => model.IdadeVitima, new { size = "4", MaxLength = "3" })%>
                        </div>
                        <div class="formItem setimo">
                            <span>Sexo</span>
                            <%= Html.DropDownListFor(model => model.SexoVitima, lstSexo, "Todos", null)%>
                        </div>
                        <div class="formItem sexto">
                            <span>Ferimentos</span>
                            <%= Html.DropDownListFor(model => model.FerimentosVitima, lstFerimentos, "Todos", null)%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Veículo</a></h3>
            <div id="divVeiculo" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem ">
                            <span>Tipo de Veículo</span>
                            <%= Html.TextBoxFor(model => model.TipoVeiculo, new { size = "30", MaxLength = "30" })%>
                        </div>
                        <div class="formItem ">
                            <span>Fabricante</span>
                            <%= Html.TextBoxFor(model => model.Fabricante, new { size = "30", MaxLength = "30" })%>
                        </div>
                        <div class="formItem ">
                            <span>Modelo</span>
                            <%= Html.TextBoxFor(model => model.Modelo, new { size = "30", MaxLength = "30" })%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Motorista</a></h3>
            <div id="divMotorista" style="display: block;">
                <div class="formItems" style="margin: 0px; width: 97.5%">
                    <div class="formItem inteiro">
                        <div class="formItem ">
                            <span>Idade</span>
                            <%= Html.TextBoxFor(model => model.IdadeMotorista, new { size = "4", MaxLength = "3" })%>
                        </div>
                        <div class="formItem setimo">
                            <span>Sexo</span>
                            <%= Html.DropDownListFor(model => model.SexoMotorista, lstSexo, "Todos", null)%>
                        </div>
                        <div class="formItem setimo">
                            <span>Estado Civil</span>
                            <%= Html.DropDownListFor(model => model.EstadoCivilMotorista, lstEstCivil, "Todos", null)%>
                        </div>
                        <div class="formItem setimo">
                            <span>Categoria CNH</span>
                            <%= Html.DropDownListFor(model => model.CategoriaCnh, lstCatCnh, "Todos", null)%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" style="display: inline-table;">
        <div>
            <h3>
                <a href="#">Policial</a></h3>
            <div id="divPolicial" style="display: block;">
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
    <%} %>
</asp:Content>
