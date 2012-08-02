<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%--
<link href="/Content/Styles/themes/base/ui.datepicker.css" 
      rel="stylesheet" type="text/css" />
<script src="/Scripts/ui.datepicker-pt-BR.js" 
        type="text/javascript"></script>
--%>
<script type="text/javascript">
    $(function() {
        var datetime = $('#<%= ViewData.TemplateInfo.GetFullHtmlFieldId(null) %>');
        datetime.datepicker({
            changeMonth: true,
            changeYear: true
        });

        datetime.attr('readonly', 'true');
    });
</script>
<%
    object date = Model;
    if (date != null)
        date = ((DateTime)date).ToString("dd/MM/yyyy");
%>
<%= Html.TextBox(null, date) %>