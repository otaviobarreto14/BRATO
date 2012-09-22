<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados   
        
        AO SELECIONAR "SALVAR DADOS" EXIBIR NA TELA EM MODO DE RELATÓRIO PARA VALIDAÇÃO, APOS "CONFIRMAR DADOS" EXIBIR MSG DE SUCESSO
        CASO SELECIONE "CORRIGIR DADOS" VOLTA A TELA DE INCLUSÃO                
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.BratEntity>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link href="/Content/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/grid.locale-pt-br.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqGrid-default.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqDropDownList-1.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // Tabs
            $('#tabs').tabs();
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
            width: 18%;
        }
        .btnContinua
        {
            font-size: 15px;
            padding: 5px;
            text-align: center;
            text-decoration: none;
            width: 18%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#Matricula_Matricula").val("1223123");
            $("#tabs").tabs({ disabled: [1, 2, 3, 4, 5] });
            $('.botao').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);
            $('.btnContinua').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);

            $("#btnCancelar").click(function () {
                $("input[type='text']").val('');
                $("select ").val("Selecione");
                $("textarea").val('');
            });

            $('.ddlUf').jqDropDownList({
                url: '<%= Url.Action("ObterUfs", "Endereco")%>',
                textField: 'Uf',
                valueField: 'Uf'
            });

            $('.ddlMunicipio').jqDropDownList({
                url: '<%= Url.Action("ObterMunicipios", "Endereco")%>',
                textField: 'Descricao',
                valueField: 'IdMunicipio'
            });

            $('.ddlBairro').jqDropDownList({
                url: '<%= Url.Action("ObterBairros", "Endereco")%>',
                textField: 'Descricao',
                valueField: 'IdBairro'
            });

            $('.ddlLogradouro').jqDropDownList({
                url: '<%= Url.Action("ObterLogradouros", "Endereco")%>',
                textField: 'Descricao',
                valueField: 'IdLogradouro'
            });

            $("#continuarBrat").click(function () {
                $.ajax({
                    url: '/Brat/SalvarDadosBrat/',
                    data: $("#formBrat").serialize(),
                    type: "post",
                    cache: false,
                    success: function (Data) {
                        $("#grid").trigger("reloadGrid");
                        if (Data.Sucesso == false) {
                            jAlert(Data.Erros);
                        }
                        else {
                            $(".Brat_IdBrat").val(Data.IdBrat);
                            $("#tabs").tabs("enable", 1);
                            $("#tabs").tabs("select", 1);
                        }
                    }
                });

                $("#tabs").tabs("enable", 1);
                $("#tabs").tabs("select", 1);
            });

            $("#continuarMotorista").click(function () {
                $.ajax({
                    url: '/Motorista/SalvarMotorista/',
                    data: $("#formMotorista").serialize(),
                    type: "post",
                    cache: false,
                    success: function (Data) {
                        $("#grid").trigger("reloadGrid");
                        if (Data.Sucesso == false) {
                            jAlert(Data.Erros);
                        }
                        else {
                            $("#tabs").tabs("enable", 2);
                            $("#tabs").tabs("select", 2);
                        }
                    }
                });

                $("#tabs").tabs("enable", 2);
                $("#tabs").tabs("select", 2);
            });

            $("#continuarVeiculo").click(function () {
                $.ajax({
                    url: '/Veiculo/SalvarVeiculo/',
                    data: $("#formVeiculo").serialize(),
                    type: "post",
                    cache: false,
                    success: function (Data) {
                        $("#grid").trigger("reloadGrid");
                        if (Data.Sucesso == false) {
                            jAlert(Data.Erros);
                        }
                        else {
                            $("#tabs").tabs("enable", 3);
                            $("#tabs").tabs("select", 3);
                        }
                    }
                });

                $("#tabs").tabs("enable", 3);
                $("#tabs").tabs("select", 3);
            });

            $("#continuarVitima").click(function () {
                $.ajax({
                    url: '/Vitima/SalvarVitima/',
                    data: $("#formVitima").serialize(),
                    type: "post",
                    cache: false,
                    success: function (Data) {
                        $("#grid").trigger("reloadGrid");
                        if (Data.Sucesso == false) {
                            jAlert(Data.Erros);
                        }
                        else {
                            $("#tabs").tabs("enable", 4);
                            $("#tabs").tabs("select", 4);
                        }
                    }
                });
                $("#tabs").tabs("enable", 4);
                $("#tabs").tabs("select", 4);
            });

            $("#continuarTestemunha").click(function () {
                $.ajax({
                    url: '/Testemunha/SalvarTestemunha/',
                    data: $("#formTestemunha").serialize(),
                    type: "post",
                    cache: false,
                    success: function (Data) {
                        $("#grid").trigger("reloadGrid");
                        if (Data.Sucesso == false) {
                            jAlert(Data.Erros);
                        }
                        else {
                            $("#tabs").tabs("enable", 5);
                            $("#tabs").tabs("select", 5);
                        }
                    }
                });
                $("#tabs").tabs("enable", 5);
                $("#tabs").tabs("select", 5);
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
    %>
    <div id="tabs" style="left: 8.5%; width: 78%; height: 70%; margin: 2%; overflow: auto;
        position: fixed; display: inline-table;">
        <ul>
            <li><a href="#tabBrat">Informações do Acidente</a></li>
            <li><a href="#tabMotoristas">Motoristas</a></li>
            <li><a href="#tabVeiculos">Veículos</a></li>
            <li><a href="#tabVitimas">Vítimas</a></li>
            <li><a href="#tabTestemunhas">Testemunhas</a></li>
            <li><a href="#tabCroquiFotos">Croqui e Fotos</a></li>
        </ul>
        <div id="tabBrat">
            <div class="formItems">
                <form id="formBrat">
                <div class="formItem inteiro">
                    <%= Html.HiddenFor(model => model.Matricula.Matricula, null)%>
                </div>
                <div class="formItem inteiro" style="float: left;">
                    <div class="formItem doisTercos">
                    </div>
                    <div class="formItem sexto">
                    </div>
                    <div class="formItem sexto" style="float: left;">
                        <span>Número do BRAT:</span>
                        <%= Html.LabelFor(model => model.NumBrat, "000000-1")%>
                    </div>
                </div>
                <div class="formItem inteiro">
                    <div class="formItem oitavo">
                        <span>*UF</span>
                        <select name="UF.Uf" id="ddlUf" class="ddlUf">
                        </select>
                    </div>
                    <div class="formItem terco">
                        <span>*Município</span>
                        <select name="Municipio.IdMunicipio" id="ddlMunicipio" class="ddlMunicipio">
                            <option value="0" selected="selected">Selecione</option>
                        </select>
                    </div>
                    <div class="formItem doisQuintos">
                        <span>*Bairro</span>
                        <select name="Bairro.IdBairro" id="ddlBairro" class="ddlBairro">
                            <option value="0" selected="selected">Selecione</option>
                        </select>
                    </div>
                </div>
                <div class="formItem inteiro">
                    <div class="formItem tresQuintos">
                        <span>*Logradouro</span>
                        <select name="Logradouro.IdLogradouro" id="ddlLogradouro" class="ddlBairro">
                            <option value="0" selected="selected">Selecione</option>
                        </select>
                    </div>
                    <div class="formItem ">
                        <span>*Data do Acidente</span>
                        <%= Html.TextBoxFor(model => model.DataAcidente, new { size = "15", MaxLength = "10" })%>
                    </div>
                    <div class="formItem ">
                        <span>*Hora do Acidente</span>
                        <%= Html.TextBoxFor(model => model.HoraAcidente, new { size = "15", MaxLength = "8" })%>
                    </div>
                </div>
                <div class="formItem inteiro">
                    <div class="formItem quarto">
                        <span>*Cond. do Tempo</span>
                        <%= Html.DropDownListFor(model => model.CondTempo, lstCondTempo, "Selecione", null)%>
                    </div>
                    <div class="formItem quarto">
                        <span>*Sinalização</span>
                        <%= Html.DropDownListFor(model => model.TipoSinalizacao, lstSinalizacao, "Selecione", null)%>
                    </div>
                    <div class="formItem quarto">
                        <span>*Tipo de Acidente</span>
                        <%= Html.DropDownListFor(model => model.TipoAcidente, lstTipoAcidente, "Selecione", null)%>
                    </div>
                    <div class="formItem quarto">
                        <span>*Circunstância</span>
                        <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Selecione", null)%>
                    </div>
                </div>
                <div class="formItem inteiro" style="margin-bottom: 5%;">
                    <span>*Descrição do Acidente</span>
                    <%= Html.TextAreaFor(model => model.Descricao, new { @rows = 10})%>
                </div>
                </form>
                <div class="formItem inteiro">
                    <a href="#" id="continuarBrat" class="ui-state-default ui-corner-all btnContinua"
                        style="float: inherit;">Continuar</a>
                </div>
            </div>
        </div>
        <div id="tabMotoristas">
            <% Html.RenderAction("IncMotorista", "Motorista"); %>
        </div>
        <div id="tabVitimas">
            <% Html.RenderAction("IncVitima", "Vitima"); %>
        </div>
        <div id="tabVeiculos">
            <% Html.RenderAction("IncVeiculo", "Veiculo"); %>
        </div>
        <div id="tabTestemunhas">
            <% Html.RenderAction("IncTestemunha", "Testemunha"); %>
        </div>
        <div id="tabCroquiFotos">
            <% Html.RenderAction("IncCroquiFoto", "CroquiFoto"); %>
        </div>
    </div>
    <div class="clear" style="position: fixed; margin-top: 75%; margin-left: 56.6%;">
        <div class="clear">
            <a href="#" id="btnSalvar" class="ui-state-default ui-corner-all botao" style="float: inherit;">
                Salvar Dados</a> <a href="#" id="btnCancelar" class="ui-state-default ui-corner-all botao"
                    style="float: inherit;">Cancelar Dados</a></div>
    </div>
</asp:Content>
