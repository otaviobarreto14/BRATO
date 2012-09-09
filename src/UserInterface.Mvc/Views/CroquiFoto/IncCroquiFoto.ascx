<%--
        ESTAS MSGS ESTÃO NO TCC I, EM CASO DE MUDANÇA EFETUAR A MESMA NO ARQUIVO DO PROJETO
        Como chegar nesta Tela = Principal/Cadastrar Brat
        Título da Tela = Cadastrar Brat
        Msg de Sucesso = BRAT Cadastrado com Sucesso
        Msg de Cancelamento = Cadastro Cancelado
        Msg de Validação = Verificar Dados Informados               
--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Brato.Entities.BratEntity>" %>
<link href="/Content/Styles/uploadify.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/swfobject.js" type="text/javascript"></script>
<script src="/Scripts/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        $("#FotoAcidente").uploadify({
            height: 22,
            buttonText: 'Adicionar',
            swf: '/Content/uploadify.swf',
            uploader: '',
            formData: { 'AuthenticationToken': auth },
            onUploadSuccess: function (file, data, response) {
                alert("Upload");
            }
        });
        //$('#uploader-button').addClass("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary").css({ 'z-index': '-1', 'width': '84px', 'height': '24px' });
    });
</script>
<div class="formItems">
    <div class="formItem inteiro">
        <div class="formItem doisQuintos">
            <span>Foto do Acidente:</span>
            <input type="file" name="FotoAcidente" id="FotoAcidente"/>
        </div>
        <div class="formItem inteiro">
            <span>Croqui do Acidente:</span>
            <%= Html.TextAreaFor(model => model.Croqui, null)%>
        </div>
    </div>
</div>
