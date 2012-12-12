<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.RetornoRelatorioModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="formItems" style="margin-left: 34%; margin-right: 30%; margin-top: 10%;
        width: 30%; height: 10%;">
        <% if (Model.Results)
           {
        %>
        <div class="formItem inteiro">
            <span>
                <%= Model.Mensagem%></span>
        </div>
        <div class="formItem inteiro">
            <a href="<%= Model.LinkPdf %>" target="_blank">Baixar PDF</a><br />
            <a href="<%= Model.LinkXls %>" target="_blank">Baixar XLS(Excel)</a><br />
            <a href="<%= Model.LinkRtf %>" target="_blank">Baixar RTF(Word)</a><br />
        </div>
        <%
           }
           else
           {%>
        <div class="formItem inteiro">
            <%=  Model.Mensagem%>
        </div>
        <% } %>
    </div>
</asp:Content>
