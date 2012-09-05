<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados  
        DEVE HAVER NO MINIMO 2 TESTEMUNHAS             
--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Brato.Entities.TestemunhaEntity>" %>
<% var lstSexo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SexoEnum>();
   var lstEstadoCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>(); %>
<div class="formItems">
    <div class="formItem doisquintos">
        <span>*Nome</span>
        <%= Html.TextBoxFor(model => model.Pessoa.Nome, new { size = "60", MaxLength = "50" })%>
    </div>
    <div class="formItem inteiro">
        <div class="formItem oitavo">
            <span>*UF</span>
            <%= Html.DropDownList("UF")%>
        </div>
        <div class="formItem terco">
            <span>*Município</span>
            <%= Html.DropDownList("Municipio")%>
        </div>
        <div class="formItem doisQuintos">
            <span>*Bairro</span>
            <%= Html.DropDownList("Bairro")%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem tresQuintos">
            <span>*Logradouro</span>
            <%= Html.DropDownList("Logradouro")%>
        </div>
        <div class="formItem nono">
            <span>Numero</span>
            <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.Numero, new { size = "7", MaxLength = "7" })%>
        </div>
        <div class="formItem tresQuintos">
            <span>Complemento</span>
            <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.IdComplemento.Descricao, new { size = "60", MaxLength = "50" })%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem quarto">
            <span>*Sexo</span>
            <%= Html.DropDownListFor(model => model.Pessoa.Sexo, lstSexo, "Selecione", null)%>
        </div>
        <div class="formItem quarto">
            <span>CPF</span>
            <%= Html.TextBoxFor(model => model.Pessoa.Cpf, new { size = "20", MaxLength = "11" })%>
        </div>
    </div>
    <br />
    <br style="clear: both;" />
    <div class="formItem inteiro" id="divGridTestemunha" style="clear: both; margin-top: 5%;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
</div>
