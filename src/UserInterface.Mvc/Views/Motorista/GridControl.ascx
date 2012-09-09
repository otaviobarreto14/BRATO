<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        var parentGrid = $("#gridMotorista").parents('div[id="divGridMotorista"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#gridMotorista").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'CNH',
                'Data Nasc.',
                'Est. Civil',
                'Sexo'
            ],
            colModel: [
                { name: 'Nome'},
                { name: 'Cnh' },
                { name: 'DataNasc' },
                { name: 'EstadoCivil' },
                { name: 'Sexo' }
            ],
            sortname: 'Nome',
            pager: "#pagerMotorista"
        }).navGrid(
            "#pagerMotorista",
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
<table id="gridMotorista">
</table>
<div id="pagerMotorista">
</div>
