<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<link href="/Content/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/grid.locale-pt-br.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid-default.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#grid").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'Matricula',
                'Batalhão',
                'Perfil',
            ],
            colModel: [
                { name: 'Nome' },
                { name: 'Matricula' },
                { name: 'Batalhao' },
                { name: 'Perfil' }
            ],
            sortname: 'Nome'
        }).navGrid(
            "#pager",
            {
                editfunc: function (selrow) {
                    window.location = '<%= Url.Action("Edit")%>/' + selrow;
                },
                addfunc: function (selrow) {
                    window.location = '<%= Url.Action("New")%>';
                }
            }
        ).navButtonAdd('#pager', {
            caption: "",
            title: "Ativar/Desativar Policial",
            buttonicon: "ui-icon-locked",
            onClickButton: function () {
                //TODO:Bloquear ou Desbloquear Policial
                alert("Bloqueia Policial");
            },
            position: "first"
        });
    });
</script>
<table id="grid">
</table>
<div id="pager">
</div>
