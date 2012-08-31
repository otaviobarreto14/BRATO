<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        $("#gridTestemunha").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'Sexo',
                'Data Nascimento',
                'Estado Civil'
            ],
            colModel: [
                { name: 'Nome'},
                { name: 'Sexo' },
                { name: 'DtNasc' },
                { name: 'EstadoCivil' }
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
