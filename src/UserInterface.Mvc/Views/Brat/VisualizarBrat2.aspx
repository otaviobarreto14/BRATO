<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Common.Master" Inherits="System.Web.Mvc.ViewPage<Brato.UserInterface.Models.BratModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="left: 8.5%; width: 78%; height: 70%; margin: 2%; overflow: auto; position: fixed;
        display: inline-table;">
        <% if (Model.Resultados)
           { %>
        <div class="formItem inteiro">
            <h3>
                Relatório de Acidente</h3>
        </div>
        <table>
            <tr>
                <td>
                    Município:
                    <%= Model.MunicipioAcidente %>
                </td>
                <td>
                    Data:
                    <%= Model.DataAcidente %>
                </td>
                <td>
                    Hora:
                    <%= Model.HoraAcidente %>
                </td>
            </tr>
        </table>
        <% }
           else
           { %>
        <div class="formItem inteiro">
            <%= Model.msgErro%>
        </div>
        <%} %>
    </div>
</asp:Content>
