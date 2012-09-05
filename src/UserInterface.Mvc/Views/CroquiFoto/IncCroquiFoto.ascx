<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados               
--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Brato.Entities.BratEntity>" %>
<div class="formItems">
    <div class="formItem inteiro">
        <div class="formItem doisQuintos">
            <span>Foto do Acidente:</span>
            <%= Html.TextBoxFor(model => model.FotoAcidente)%>
        </div>
        <div class="formItem inteiro">
            <span>Croqui do Acidente:</span>
            <%= Html.TextAreaFor(model => model.Croqui, null)%>
        </div>
    </div>
