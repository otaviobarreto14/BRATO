<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        var parentGrid = $("#grid").parents('div[id="divGridVeiculo"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#gridVeiculo").jqGrid({
            url: '',
            colNames: [
                'Nome Proprietario',
                'Tipo',
                'Modelo',
                'Placa',
                'Ano'
            ],
            colModel: [
                { name: 'NomeProp' },
                { name: 'Tipo' },
                { name: 'Modelo' },
                { name: 'Placa' },
                { name: 'Ano' }
            ],
            sortname: 'NomeProp'
        }).navGrid(
            "#pagerVeiculo",
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
<table id="gridVeiculo">
</table>
<div id="pagerVeiculo">
</div>
