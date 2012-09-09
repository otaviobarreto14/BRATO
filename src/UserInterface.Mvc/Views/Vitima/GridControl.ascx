<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        var parentGrid = $("#grid").parents('div[id="divGridVitima"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#gridVitima").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'CPF',
                'Data Nasc.',
                'Ferimentos',
                'Sexo'
            ],
            colModel: [
                { name: 'Nome' },
                { name: 'Cpf' },
                { name: 'DataNasc' },
                { name: 'TipoFerimento'},
                { name: 'Sexo'}
            ],
            sortname: 'Nome',
            pager: "#pagerVitima"
        }).navGrid(
            "#pagerVitima",
            {
                editfunc: function (selrow) {
                    window.location = '<%= Url.Action("Edit")%>/' + selrow;
                },
                addfunc: function (selrow) {
                    window.location = '<%= Url.Action("New")%>';
                }
            }
        );
    });
</script>
<table id="gridVitima">
</table>
<div id="pagerVitima">
</div>
