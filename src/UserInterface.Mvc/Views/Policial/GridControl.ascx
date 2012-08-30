﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<link href="/Content/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/grid.locale-pt-br.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="/Scripts/jquery.jqGrid-default.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var parentGrid = $("#grid").parents('div[id="divGrid"]');
        var nameWidth = parentGrid.width() / 100 * 45;
        $("#grid").jqGrid({
            url: '',
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
                { name: 'Batalhao' },
                { name: 'Perfil' },
                { name: 'Status' }
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