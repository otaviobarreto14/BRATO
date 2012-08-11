/* Brazilian initialisation for the jQuery UI date picker plugin. */
/* Written by Leonildo Costa Silva (leocsilva@gmail.com). */
jQuery(function ($) {
    $.datepicker.regional['pt-BR'] = {
        closeText: 'Fechar',
        prevText: '&#x3c;Anterior',
        nextText: 'Pr&oacute;ximo&#x3e;',
        currentText: 'Hoje',
        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
		'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
		'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
        dayNames: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sabado'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
        dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['pt-BR']);
});

$(function () {
    $('.monthpicker').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'mm/yy',
        justMonth: true,
        onClose: function (dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();

            month = (parseInt(month) + 1).toString();
            if (month.length < 2)
                month = '0' + month;
            $(this).val(month + '/' + year);

            // $(this).datepicker('setDate', new Date(year, month, 1));
        },
        beforeShow: function (input, inst) {
            if ((datestr = $(this).val()).length > 0) {
                year = datestr.split('/')[1];
                month = datestr.split('/')[0];
                $(this).datepicker('option', 'defaultDate', new Date(year, month - 1, 1));
                $(this).datepicker('setDate', new Date(year, month - 1, 1));
            }
        }
    });
});

//Configura os campos DateTime
$(document).ready(function () {
    setTimeout(function () {
        $('input[kind="Date"]').each(function () {
            $(this).keydown(function (e) {
                if (e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105) {
                    $(this).datepicker('hide');
                }
            }).attr({ 'readonly': false, "alt": "date" }).setMask();

            if ($(this).attr('lockByMonthYear') != '') {
                $(this).datepicker({
                    changeMonth: false,
                    changeYear: false
                });
            }
            else {
                $(this).datepicker({
                    changeMonth: true,
                    changeYear: true
                });
            }
        });
    }, 200);

});