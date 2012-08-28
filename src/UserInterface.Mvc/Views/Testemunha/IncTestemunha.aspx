<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados  
        DEVE HAVER NO MINIMO 2 TESTEMUNHAS             
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.TestemunhaEntity>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <% var lstSexo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SexoEnum>();
       var lstEstadoCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>(); %>
    <span>*Nome:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Pessoa.Nome, new { size = "60", MaxLength = "50" })%>
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
    <span>Numero:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.Numero, new { size = "10", MaxLength = "7" })%>
    </div>
    <span>Complemento:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.IdComplemento.Descricao, new { size = "60", MaxLength = "50" })%>
    </div>
    <span>*Sexo:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Pessoa.Sexo, lstSexo, "Selecione", null)%>
    </div>
    <span>*CPF:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Pessoa.Cpf, new { size = "20", MaxLength = "11" })%>
    </div>
    <br />
    <div class="formItem inteiro" id="divGrid" style="clear: both;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
</asp:Content>
