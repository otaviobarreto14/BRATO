<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados                       
--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Brato.Entities.VeiculoEntity>" %>
<div class="formItems">
    <div class="formItem doisquintos">
        <span>*Nome do Proprietário</span>
        <%= Html.TextBoxFor(model => model.NomeProprietario, new { size = "60", MaxLength = "50" })%>
    </div>
    <div class="formItem inteiro">
        <div class="formItem terco">
            <span>*Tipo de Veículo</span>
            <%= Html.DropDownListFor(model => model.TipoVeiculo, null)%>
        </div>
        <div class="formItem terco">
            <span>*Fabricante</span>
            <%= Html.DropDownListFor(model => model.Fabricante, null)%>
        </div>
        <div class="formItem terco">
            <span>*Modelo</span>
            <%= Html.DropDownListFor(model => model.Modelo, null)%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem oitavo">
            <span>*Ano</span>
            <%= Html.TextBoxFor(model => model.Ano, new { size = "8", MaxLength = "4" })%>
        </div>
        <div class="formItem quarto">
            <span>*Cor</span>
            <%= Html.DropDownListFor(model => model.Cor, null)%>
        </div>
        <div class="formItem setimo">
            <span>*Placa</span>
            <%= Html.TextBoxFor(model => model.Placa, new { size = "10", MaxLength = "7" })%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem metade">
            <span>Impacto(s)</span><%= Html.CheckBox("Impacto")%>
        </div>
        <div class="formItem metade">
            <span>Avaria(s)</span>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
            <%= Html.CheckBox("Avaria")%>
        </div>
    </div>
    <br />
    <br style="clear: both;" />
    <div class="formItem inteiro" id="divGridVeiculo" style="clear: both; margin-top: 5%;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
</div>