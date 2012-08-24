<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados               
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.MotoristaEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
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
    <span>*Data Nasc.:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.DataNasc, new { size = "15", MaxLength = "10" })%>
    </div>
    <span>*Sexo:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Pessoa.Sexo, null)%>
    </div>
    <span>*Estado Civil:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.EstadoCivil, null)%>
    </div>
    <span>*CPF:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Pessoa.Cpf, new { size = "20", MaxLength = "11" })%>
    </div>
    <span>*CNH:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.Cnh, new { size = "20", MaxLength = "16" })%>
    </div>
    <span>*Prontuário CNH:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.ProntuarioCnh, new { size = "20", MaxLength = "16" })%>
    </div>
    <span>*UF Exp. CNH:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.UfExpedicaoCnh, null)%>
    </div>
    <span>*Categoria CNH:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.CategoriaCnh, null)%>
    </div>
    <span>*Validade Exm. Med. CNH:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.ValidadeExameChn, new { size = "15", MaxLength = "10" })%>
    </div>
    <br />
    <br />
<<<<<<< HEAD
    <input type="button" id="AddMotorista" value="Adicionar Motorista" style="width: 125px; height: 24px;
        text-align: center; margin-left:800px" />
    <input type="button" id="RemMotorista" value="Remover Motorista" style="width: 125px; height: 24px;
=======
    <input type="button" id="AddMotorista" value="Incluir Motorista" style="width: 120px; height: 24px;
        text-align: center; margin-left:800px" />
    <input type="button" id="RemMotorista" value="Remover Motorista" style="width: 120px; height: 24px;
>>>>>>> 1320ec130c201324370b82adceb169f9cc99598d
        text-align: center; margin-left:inherit" />
    <br />
    <span>GRID</span>
</asp:Content>
