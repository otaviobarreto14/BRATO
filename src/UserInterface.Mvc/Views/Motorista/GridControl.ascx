<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">
    $(function () {
        $("#gridMotorista").jqGrid({
            url: '',
            colNames: [
                'Nome',
                'Sexo',
                'CNH',
                'Data Nascimento',
                'Estado Civil'
            ],
            colModel: [
                { name: 'Nome'},
                { name: 'Sexo' },
                { name: 'Cnh' },
                { name: 'DtNasc' },
                { name: 'EstadoCivil' }
            ],
            sortname: 'Nome'
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
