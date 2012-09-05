<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        var parentGrid = $("#grid").parents('div[id="divGridTestemunha"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#gridTestemunha").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'CPF',
                'Sexo'
            ],
            colModel: [
                { name: 'Nome' },
                { name: 'Cpf' },
                { name: 'Sexo' }
            ],
            sortname: 'Nome'
        }).navGrid(
            "#pagerTestemunha",
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
<table id="gridTestemunha">
</table>
<div id="pagerTestemunha">
</div>
