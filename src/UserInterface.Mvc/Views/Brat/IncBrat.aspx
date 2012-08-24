<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados                      
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.BratEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="formItem inteiro" style="margin-left:800px">
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
    <span>Numero:</span>
    <div class="formItem inteiro">
        <%= Html.TextBoxFor(model => model.IdEndereco.Numero, new { size = "10", MaxLength = "7" })%>
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
        <%= Html.DropDownListFor(model => model.CondTempo, null)%>
    </div>
    <span>*Sinalização:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.TipoSinalizacao, null)%>
    </div>
    <span>*Tipo de Acidente:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.TipoAcidente, null)%>
    </div>
    <span>*Circunstância:</span>
    <div class="formItem inteiro">
        <%= Html.DropDownListFor(model => model.Circunstancia, null)%>
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
    <input type="button" id="RemBrat" value="Remover Brat" style="width: 120px; height: 24px;
        text-align: center" />
</asp:Content>
