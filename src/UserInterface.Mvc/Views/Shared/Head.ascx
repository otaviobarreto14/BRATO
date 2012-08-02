<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div style="padding: 12px;">
    <span id="toolbar" class="ui-widget-header ui-corner-all"><span id="repeat">
        <button id="novo">
            novo</button>
        <button id="editar">
            editar</button>
        <button id="excluir">
            excluir</button>
        <button id="cancelar">
            cancelar</button>
        <button id="salvar">
            salvar</button>
        <button id="voltar">
            voltar</button>
        <button id="continuar">
            continuar</button>
        <button id="exportarExcel">
            exportar excel</button>
              <button id="limpar">
            limpar</button>
    </span></span>
</div>
<style type="text/css">
    #toolbar
    {
        padding: 8px 3px;
        z-index: 50;
    }
    .ui-button
    {
        font-size: 9px;
    }
</style>

<script type="text/javascript">
    $(function() {

        $("#repeat").buttonset();


        $("#limpar").button({
            icons: {
                primary: "ui-icon-trash"
            }
        }).click(function() {
       
            $(".validation-summary-errors").empty();
            $(".field-validation-error").empty();
            $("input:text").val('');
            $('select').val('');
            var selected = $("input:radio:checked");
            if (selected.length != 0)
                selected[0].checked = false;
            return false;
        });

        $("#novo").button({
            icons: {
                primary: "ui-icon-document"
            }
        }).click(function() {
            window.location = '<%= Url.Action("New") %>';


        });
        $("#editar").button({
            icons: {
                primary: "ui-icon-pencil"
            }
        });
        $("#salvar").button({
            icons: {
                primary: "ui-icon-pencil"
            }
        });
        $("#salvar").click(function() {
            $("form").submit();
        });
        $("#excluir").button({
            icons: {
                primary: "ui-icon-trash"
            }
        })
        $("#cancelar").button({
            icons: {
                primary: "ui-icon-document"
            }
        })

        $("#continuar").button({
            icons: {
                primary: "ui-icon-document"
            }
        })
        $("#voltar").button({
            icons: {
                primary: "ui-icon-document"
            }
        }).click(function() {
            window.setTimeout(function() { history.go(-1) }, 1);
        });

        $("#exportarExcel").button({
            icons: {
                primary: "ui-icon-document"
            }
        })
    });
    function montaToolBar(titulo, excluir, novo, editar, salvar, cancelar, exportarExcel, voltar, continuar,limpar) {
        //Botao de Excluir
        if (limpar == "s") {
            $("#limpar").show();
        }
        else if (limpar == "n") {
            $("#limpar").hide();
        }
        if (excluir == "s") {
            $("#excluir").show();
        }
        else if (excluir == "n") {
            $("#excluir").hide();
        }

        //Botao Novo
        if (novo == "s") {
            $("#novo").show();
        }
        else if (novo == "n") {
            $("#novo").hide();
        }

        //botao editar
        if (editar == "s") {
            $("#editar").show();
        }
        else if (editar == "n") {
            $("#editar").hide();
        }

        //botao salvar
        if (salvar == "s") {
            $("#salvar").show();
        }
        else if (salvar == "n") {
            $("#salvar").hide();
        }

        //botao cancelar
        if (cancelar == "s") {
            $("#cancelar").show();
        }
        else if (cancelar == "n") {
            $("#cancelar").hide();
        }

        //botao exportarExcel
        if (exportarExcel == "s") {
            $("#exportarExcel").show();
        }
        else if (exportarExcel == "n") {
            $("#exportarExcel").hide();
        }

        //botao voltar
        if (voltar == "s") {
            $("#voltar").show();
        }
        else if (voltar == "n") {
            $("#voltar").hide();
        }

        //botao continuar
        if (continuar == "s") {
            $("#continuar").show();
        }
        else if (continuar == "n") {
            $("#continuar").hide();
        }

        $("#titulo").html(titulo);


    }

</script>



