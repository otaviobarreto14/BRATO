<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Common.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Scripts/MicrosoftMvcJQueryValidation.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqToolBar-1.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#repeat").buttonset();
            $("#repeat").jqToolBar({
                onNovo: function () {
                    window.location = '<%= Url.Action("New") %>';
                    return false;
                },
                onEditar: function () {
                    window.location = '<%= Url.Action("Edit") %>';
                    return false;
                },
                onCancelar: function () {
                    window.location = '<%= Url.Action("List")%>';
                    return false;
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <% var validationSummary = Html.ValidationSummary("Ocorreram os seguintes erros:"); %>
    <% using (Html.BeginForm())
       {
           Html.RenderPartial("Toolbar");
           Response.Write(validationSummary);
           Html.RenderPartial("FormControl");
       } %>
</asp:Content>
