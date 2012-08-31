<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        $("#gridVitima").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'Sexo',
                'Data Nascimento'
            ],
            colModel: [
                { name: 'Nome'},
                { name: 'Sexo' },
                { name: 'DtNasc' }
            ],
            sortname: 'Nome'
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
