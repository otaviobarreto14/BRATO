<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados                      
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.BratEntity>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            // Tabs
            $('#tabs').tabs();
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
    <div id="tabs" style="width: 98%; margin: 1%; overflow: auto;">
        <ul>
            <li><a href="#tabBrat">Informações do Acidente</a></li>
            <li><a href="#tabMotoristas">Motoristas</a></li>
            <li><a href="#tabVitimas">Vítimas</a></li>
            <li><a href="#tabVeiculos">Veículos</a></li>
            <li><a href="#tabTestemunhas">Testemunhas</a></li>
        </ul>
        <div id="tabBrat">
            <div class="formItem inteiro" style="margin-left: 800px">
                <span>Número do BRAT:</span>
                <%= Html.TextBoxFor(model => model.NumBrat, new { size = "10", MaxLength = "10" })%>
            </div>
            <span>*UF:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownList("UF")%>
            </div>
            <span>*Município:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownList("Municipio")%>
            </div>
            <span>*Bairro:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownList("Bairro")%>
            </div>
            <span>*Logradouro:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownList("Logradouro")%>
            </div>
            <span>*Data do Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.TextBoxFor(model => model.DataAcidente, new { size = "15", MaxLength = "10" })%>
            </div>
            <span>*Hora do Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.TextBoxFor(model => model.HoraAcidente, new { size = "15", MaxLength = "8" })%>
            </div>
            <span>*Cond. do Tempo:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownListFor(model => model.CondTempo, lstCondTempo, "Selecione", null)%>
            </div>
            <span>*Sinalização:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownListFor(model => model.TipoSinalizacao, lstSinalizacao, "Selecione", null)%>
            </div>
            <span>*Tipo de Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownListFor(model => model.TipoAcidente, lstTipoAcidente, "Selecione", null)%>
            </div>
            <span>*Circunstância:</span>
            <div class="formItem inteiro">
                <%= Html.DropDownListFor(model => model.Circunstancia, lstCirc, "Selecione", null)%>
            </div>
            <span>*Descrição do Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.TextAreaFor(model => model.Descricao, null)%>
            </div>
            <span>Foto do Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.TextBoxFor(model => model.FotoAcidente)%>
            </div>
            <span>Croqui do Acidente:</span>
            <div class="formItem inteiro">
                <%= Html.TextAreaFor(model => model.Croqui, null)%>
            </div>
            <div class="formItem inteiro">
                <%= Html.HiddenFor(model => model.Matricula, null)%>
            </div>
            <br />
            <br />
            <input type="button" id="AddBrat" value="Incluir Brat" style="width: 120px; height: 24px;
                text-align: center" />
            <input type="button" id="CancelarBrat" value="Cancelar" style="width: 120px; height: 24px;
                text-align: center" />
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
    </div>
</asp:Content>
