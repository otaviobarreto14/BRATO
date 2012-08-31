<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados               
--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Brato.Entities.MotoristaEntity>" %>
<% var lstSexo = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<SexoEnum>();
   var lstEstadoCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>(); %>
<div class="formItem inteiro">
    <span>*Nome:</span>
    <div>
        <%= Html.TextBoxFor(model => model.Pessoa.Nome, new { size = "60", MaxLength = "50" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*UF:</span>
    <div>
        <%= Html.DropDownList("UF")%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Município:</span>
    <div>
        <%= Html.DropDownList("Municipio")%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Bairro:</span>
    <div>
        <%= Html.DropDownList("Bairro")%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Logradouro:</span>
    <div>
        <%= Html.DropDownList("Logradouro")%>
    </div>
</div>
<div class="formItem quinto">
    <span>Numero:</span>
    <div>
        <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.Numero, new { size = "10", MaxLength = "7" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>Complemento:</span>
    <div>
        <%= Html.TextBoxFor(model => model.Pessoa.IdEndereco.IdComplemento.Descricao, new { size = "60", MaxLength = "50" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Data Nasc.:</span>
    <div>
        <%= Html.TextBoxFor(model => model.DataNasc, new { size = "15", MaxLength = "10" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Sexo:</span>
    <div>
        <%= Html.DropDownListFor(model => model.Pessoa.Sexo, lstSexo, "Selecione", null)%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Estado Civil:</span>
    <div>
        <%= Html.DropDownListFor(model => model.EstadoCivil, lstEstadoCivil, "Selecione", null)%>
    </div>
</div>
<div class="formItem quinto">
    <span>*CPF:</span>
    <div>
        <%= Html.TextBoxFor(model => model.Pessoa.Cpf, new { size = "20", MaxLength = "11" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*CNH:</span>
    <div>
        <%= Html.TextBoxFor(model => model.Cnh, new { size = "20", MaxLength = "16" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Prontuário CNH:</span>
    <div>
        <%= Html.TextBoxFor(model => model.ProntuarioCnh, new { size = "20", MaxLength = "16" })%>
    </div>
</div>
<div class="formItem quinto">
    <span>*UF Exp. CNH:</span>
    <div>
        <%= Html.DropDownListFor(model => model.UfExpedicaoCnh, null)%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Categoria CNH:</span>
    <div>
        <%= Html.DropDownListFor(model => model.CategoriaCnh, null)%>
    </div>
</div>
<div class="formItem quinto">
    <span>*Validade Exm. Med. CNH:</span>
    <div>
        <%= Html.TextBoxFor(model => model.ValidadeExameChn, new { size = "15", MaxLength = "10" })%>
    </div>
</div>
<br />
<br style="clear: both;" />
<div class="formItem inteiro" id="divGrid" style="clear: both;">
    <% Html.RenderPartial("GridControl"); %>
</div>
