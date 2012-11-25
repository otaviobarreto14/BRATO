<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
<%
        Html.DevExpress().GetStyleSheets(
            new StyleSheet { ExtensionSuite = ExtensionSuite.NavigationAndLayout },
            new StyleSheet { ExtensionSuite = ExtensionSuite.Editors },
            new StyleSheet { ExtensionSuite = ExtensionSuite.HtmlEditor },
            new StyleSheet { ExtensionSuite = ExtensionSuite.GridView },
            new StyleSheet { ExtensionSuite = ExtensionSuite.Chart },
            new StyleSheet { ExtensionSuite = ExtensionSuite.Report }
        );
    %>
    <% Html.DevExpress().GetScripts(
       new Script { ExtensionSuite = ExtensionSuite.NavigationAndLayout },
        new Script { ExtensionSuite = ExtensionSuite.HtmlEditor },
        new Script { ExtensionSuite = ExtensionSuite.GridView },
        new Script { ExtensionSuite = ExtensionSuite.Editors },
        new Script { ExtensionSuite = ExtensionSuite.Chart },
        new Script { ExtensionSuite = ExtensionSuite.Report }
       ); %>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

</asp:Content>
