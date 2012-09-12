<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<link href="/Content/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/grid.locale-pt-br.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid-default.js" type="text/javascript"></script>
<script type="text/javascript">
    function AlterarPolicial()
    {
        var selrow = 0;
        selrow = $("#gridP").getGridParam('selrow');
        if (selrow == null) {
            $.jgrid.viewModal("#alertmod", { gbox: "#gbox_grid", jqm: true });
            $("#jqg_alrt").focus();
        }
        else {
            $.ajax({
                url: '<%= Url.Action("AlterarStatusPolicial") %>/',
                data: { 'matricula': selrow },
                type: 'post',
                cache: false
            });
        }
        $("#gridP").trigger("reloadGrid");
    }
    $(function () {
        var parentGrid = $("#gridP").parents('div[id="divGrid"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#gridP").jqGrid({
            url: '<%= Url.Action("GetPagedInJson") %>',
            colNames: [
                'Nome',
                'Matricula',
                'Batalhão',
                'Perfil',
                'Status'
            ],
            colModel: [
                { name: 'Nome', width: nameWidth },
                { name: 'Matricula' },
                { name: 'BatalhaoFormatted', index: 'Batalhao' },
                { name: 'IdPerfil.Descricao' },
                { name: 'StatusFormatted' }
            ],
            sortname: 'Nome',
            pager: "#pagerP",
            jsonReader: {
                id: "Matricula"
            }
        }).navGrid(
            "#pagerP",
            {
                editfunc: function (selrow) {
                    window.location = '<%= Url.Action("Edit")%>/' + selrow;
                },
                addfunc: function (selrow) {
                    window.location = '<%= Url.Action("New")%>';
                },
                del : false,            
            }
        ).navButtonAdd('#pagerP', {
            caption: "",
            title: "Ativar/Desativar Policial",
            buttonicon: "ui-icon-gear",
            onClickButton: function () {
                AlterarPolicial();
            },
            position: "first"
        });
    });
</script>
<table id="gridP">
</table>
<div id="pagerP">
</div>
