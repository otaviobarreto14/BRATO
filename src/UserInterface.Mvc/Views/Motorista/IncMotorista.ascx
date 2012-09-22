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
   var lstEstadoCivil = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<EstadoCivilEnum>();
   var lstCatCnh = Brato.UserInterface.WebUserInterfaceHelper.DropDownListHelper.CarregarDropDown<CategoriaCNH>(); %>
<div class="formItems">
    <form id="formMotorista">
    <input type="hidden" name="Brat.IdBrat" class="Brat_IdBrat" />
    <div class="formItem doisquintos">
        <span>*Nome</span>
        <%= Html.TextBoxFor(model => model.Pessoa.Nome, new { size = "60", MaxLength = "50" })%>
    </div>
    <div class="formItem inteiro">
        <div class="formItem oitavo">
            <span>*UF</span>
            <select name="Pessoa.UF.Uf" id="ddlUf" class="ddlUf">
            </select>
        </div>
        <div class="formItem terco">
            <span>*Município</span>
            <select name="Pessoa.Municipio.IdMunicipio" id="ddlMunicipio" class="ddlMunicipio">
                <option value="0" selected="selected">Selecione</option>
            </select>
        </div>
        <div class="formItem doisQuintos">
            <span>*Bairro</span>
            <select name="Pessoa.Bairro.IdBairro" id="ddlBairro" class="ddlBairro">
                <option value="0" selected="selected">Selecione</option>
            </select>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem tresQuintos">
            <span>*Logradouro</span>
            <select name="Pessoa.Logradouro.IdLogradouro" id="ddlLogradouro" class="ddlLogradouro">
                <option value="0" selected="selected">Selecione</option>
            </select>
        </div>
        <div class="formItem nono">
            <span>Numero</span>
            <%= Html.TextBoxFor(model => model.Pessoa.Numero, new { size = "7", MaxLength = "7" })%>
        </div>
        <div class="formItem tresQuintos">
            <span>Complemento</span>
            <%= Html.TextBoxFor(model => model.Pessoa.Complemento, new { size = "60", MaxLength = "50" })%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem sexto">
            <span>*Data Nasc.</span>
            <%= Html.TextBoxFor(model => model.DataNasc, new { size = "15", MaxLength = "10" })%>
        </div>
        <div class="formItem quarto">
            <span>*Sexo</span>
            <%= Html.DropDownListFor(model => model.Pessoa.Sexo, lstSexo, "Selecione", null)%>
        </div>
        <div class="formItem quarto">
            <span>*Estado Civil</span>
            <%= Html.DropDownListFor(model => model.EstadoCivil, lstEstadoCivil, "Selecione", null)%>
        </div>
        <div class="formItem quarto">
            <span>*CPF</span>
            <%= Html.TextBoxFor(model => model.Pessoa.Cpf, new { size = "20", MaxLength = "11" })%>
        </div>
    </div>
    <div class="formItem inteiro">
        <div class="formItem quinto">
            <span>*CNH</span>
            <%= Html.TextBoxFor(model => model.Cnh, new { size = "20", MaxLength = "16" })%>
        </div>
        <div class="formItem quinto">
            <span>*Prontuário CNH</span>
            <%= Html.TextBoxFor(model => model.ProntuarioCnh, new { size = "20", MaxLength = "16" })%>
        </div>
        <div class="formItem oitavo">
            <span>*UF Exp. CNH</span>
            <select name="UfExpedicaoCnh" id="ddlUfExpedicao" class="ddlUf">
            </select>
        </div>
        <div class="formItem setimo">
            <span>*Categoria CNH</span>
            <%= Html.DropDownListFor(model => model.CategoriaCnh, lstCatCnh, "Selecione", null)%>
        </div>
        <div class="formItem quarto">
            <span>*Validade Exm. Med. CNH</span>
            <%= Html.TextBoxFor(model => model.ValidadeExameChn, new { size = "15", MaxLength = "10" })%>
        </div>
    </div>
    <br />
    <br style="clear: both;" />
    <div class="formItem inteiro" id="divGridMotorista" style="clear: both; margin-top: 5%;">
        <% Html.RenderPartial("GridControl"); %>
    </div>
    </form>
    <div class="formItem inteiro">
        <a href="#" id="continuarMotorista" class="ui-state-default ui-corner-all btnContinua"
            style="float: inherit;">Continuar</a>
    </div>
</div>
