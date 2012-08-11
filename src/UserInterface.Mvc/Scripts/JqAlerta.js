/*  Requerido
* jquery-ui-1.8.7.custom.min.js" type="text/javascript"></script>
* jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css" />
* JqAlerta.css" rel="stylesheet" type="text/css" />
*/



jQuery.fn.alerta = function(msg, options) {

    var container = this;

    var settings = jQuery.extend({
        onClick: function() { }
    }, options);

    container.append("<div class='divBlock' id='divAlerta'>" +
                      "</div>" +
                          "<div class='divAlerta' id='' style='display: block;'>" +
                          "<table>" +
                          " <tr>" +
                                "<td  class='conteudo' id='mensagem'>" + msg +
                                "</td>" +
                          "</tr>" +
                          "<tr>" +
                            "<td style='text-align:center'>" +
                               "<button id='ok'>ok</button>" +
                            "</td>" +
                          "</tr>" +
                          "</table>" +
                        "</div>");
    $("#ok").button({
        icons: {
            primary: "ui-icon-alert"
        }
    });
    $("#ok").click(settings.onClick)
    $("#ok").click(function() {
    $("#divAlerta").css("display", "none");
        return false;
    });

}
