<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Common.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link href="/Content/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/grid.locale-pt-br.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.jqGrid-default.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <% Html.RenderPartial("GridControl"); %>
</asp:Content>
