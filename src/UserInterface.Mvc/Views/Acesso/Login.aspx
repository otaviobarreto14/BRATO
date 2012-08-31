<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.Entities.PolicialEntity>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        #buscar
        {
            padding: 0px 20px;
            text-decoration: none;
            position: relative;
            font-size: 18px;
            width: 100px;
            text-align: center;
            margin: 5px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#buscar').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="formItems">
        <div class="formItem inteiro">
            <span>Matricula:</span>
            <div class="formItem quarto">
                <%= Html.TextBoxFor(model => model.Matricula, new { size = "15", MaxLength = "15" })%>
            </div>
        </div>
        <div class="formItem inteiro">
            <span>Senha:</span>
            <div class="formItem quarto">
                <%= Html.PasswordFor(model => model.Senha, new { size = "24", MaxLength = "24" })%>
            </div>
        </div>
        <div class="formItem quarto">
            <a href="#" id="buscar" class="ui-state-default ui-corner-all" style="float: left;">
                Entrar</a>
        </div>
    </div>
</asp:Content>
