$(function () {
    $('.jqButton').each(function () {
        $(this).button({ icons: { primary: 'ui-icon-' + $(this).attr('icon')} });
        //         $(this).button("option", "icons", { primary: 'ui-icon-' + $(this).attr('icon') });
    });

    $('.jqButtonNoText').each(function () {
        $(this).button({ icons: { primary: 'ui-icon-' + $(this).attr('icon'), secondary: '' }, text: false });
    });

    adjustLayout();

    $('#toolbar').width($(window).width());

    $(window).bind('resize', function () {
        adjustLayout();
    });

    //Configura a mascara
    //$('input:text').setMask(); 
});

function showToolbar() {

    $('#toolbar-container').show();
    adjustLayout();
}

function compareDate(date1, date2) {
    var dataIni = $.datepicker.parseDate('dd/mm/yy', date1);
    var dataFim = $.datepicker.parseDate('dd/mm/yy', date2);

    return (dataFim > dataIni) - (dataIni > dataFim);
}

function SetupDatePicker() {
    setTimeout(function () {
        $('input[kind="Date"]').each(function () {

            $(this).datepicker({
                changeMonth: true,
                changeYear: true
            });

            $(this).keydown(function (e) {
                if (e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105) {
                    $(this).datepicker('hide');
                }
            }).attr({ 'readonly': false, "alt": "date" }).setMask();
        });
    }, 200);
}

function SetupControls() {
    //Configura a mascara
    $('input:text').setMask();

    //Configura o validador
    ValidationProvider = null;
    SetupValidator();

    //Configura o monthpicker
    SetupMonthPicker();

    //Configura o datepicker
    SetupDatePicker();

    //Configura o autocomplete
    AplicarAutoComplete()
}

function adjustLayout() {
    $('.form-inner').height($(window).height() -
                            $('#header').height() -
                            $('#nav').height() -
                            $('#voce-esta').height() -
                            $('#toolbar').height() - 20);
}

function setTituloFuncao(titulo) {
    $('#tituloFuncao').html(titulo);
    $('head title').text(titulo);
}

function simnao_formatter(v, o, s) {
    if (v == 'S')
        return 'Sim';
    return 'Não';
}

function getController() {
    return $('#hdnMstController').val();
}

function getAction() {
    return $('#hdnMstAction').val();
}

// Função que realiza uma pesquisa em um objeto Json, retorna o objeto que stisfaz a condição key / val
function getObjects(obj, key, val) {
    var objects = [];

    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;

        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        }
        else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
}

function Left(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else
        return String(str).substring(0, n);
}
function Right(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else {
        var iLen = String(str).length;
        return String(str).substring(iLen, iLen - n);
    }
}

////////////////////////////////////////////
///////////////AutoComplete/////////////////
////////////////////////////////////////////
function AplicarAutoComplete() {
    var obj = $('.autoComplete');
    var textBoxId = obj.attr('id');
    var hiddenId = textBoxId + 'Id';
    var sourceUrl = obj.attr('source');
    var allowInvalid = obj.attr('allow-invalid');
    var cascade = obj.attr('cascade');
    autoComplete(textBoxId, hiddenId, sourceUrl, obj.val(), allowInvalid);
    //defineAutoCompleteCascata(textBoxId, cascade);
    criaBotaoAutoComplete(textBoxId);
    //transformaComboSomenteLeitura(this);
}

function autoComplete(textBoxId, hiddenId, sourceUrl, defaultValue, allowInvalidValues, selectedCallback) {

    var textBox = $('#' + textBoxId);
    var hidden = $('#' + hiddenId);
    var dataKey = 'label_' + textBoxId;

    if (hidden.val() == '0') {
        hidden.val('');
    }

    if (textBox.val() != '') {
        hidden.data(dataKey, defaultValue);        
    }

    var selectComboEvent = function (e, ui) {
        hidden.val(ui.item.id);
        hidden.data(dataKey, ui.item.label);
        hidden.trigger('change');

        if (selectedCallback && typeof (selectedCallback) == 'function') {
            selectedCallback();
        }
    };
    textBox.focusout(function () {
        if (hidden.val() == '' || hidden.data(dataKey) != $(this).val()) {

            if (allowInvalidValues === 'false' || allowInvalidValues === 'False') {
                textBox.val('');
            }
            hidden.val('');
            hidden.data(dataKey, '');

            if (selectedCallback && typeof (selectedCallback) == 'function') {
                selectedCallback();
            }

            hidden.trigger('change');
        }
    });

    textBox.autocomplete({
        source: sourceUrl,
        minLength: 1,
        highlight: true,
        scroll: true,
        selectFirst: false,
        select: selectComboEvent,
        cacheLength: 1,
        appendTo: hidden.parent()
    });    
}

function transformaComboSomenteLeitura(combo) {
    if ($(combo).attr('readonly')) {
        $(combo).disable();
        $(combo).css('background-color', 'white');
    }
}

function criaBotaoAutoComplete(textBoxId) {
    if ($('#' + textBoxId + 'Button').size() > 0) {
        $('#' + textBoxId).autocomplete('option', 'minLength', 0);
        $('#' + textBoxId + 'Button').unbind('click').die()
                            .click(function () {
                                if ($('#' + textBoxId).autocomplete('widget').is(':visible')) {
                                    $('#' + textBoxId).autocomplete('widget').hide();
                                }
                                else {
                                    $('#' + textBoxId).autocomplete('search', '');
                                }
                                return false;
                            })
                            .button("destroy")
                            .button({ icons: { primary: "ui-icon-triangle-1-s" }, text: false })
                            .removeClass('ui-corner-all')
                            .removeAttr('title')
                            .addClass('ui-corner-right')
                            .addClass('botaoAutoComplete');

        if ($.browser.webkit) {
            $('#' + textBoxId + 'Button').css('margin-top', '2px');
            $('#' + textBoxId + 'Button').css('margin-left', '-7px');
        }
        if ($.browser.mozilla) {
            $('#' + textBoxId + 'Button > span:last').css('display', 'inline');
        }
        if ($.browser.msie) {
            $('#' + textBoxId + 'Button').css('height', '1.6em');
        }
    }
}

$.fn.clearAutoComplete = function () {
    this.autocomplete('option', 'source', '');
    if (!this.attr('placeholder') || this.attr('placeholder') != this.val())
        this.val('');
    $('#' + this.attr('id') + 'Id').val('');
};

function defineAutoCompleteCascata(autoCompletePai, autoCompleteCascata) {

    if (autoCompleteCascata) {
        $('#' + autoCompletePai + 'Id').attr('data-previous-value', $('#' + autoCompletePai + 'Id').val());

        $('#' + autoCompletePai).focusout(function () {

            var previousValue = $('#' + autoCompletePai + 'Id').attr('data-previous-value');
            var currentValue = $('#' + autoCompletePai + 'Id').val();

            if (previousValue != currentValue) {
                var originalSource = $('#' + autoCompleteCascata).attr('source');
                var sourceWithParentId = originalSource + '?id=' + $('#' + autoCompletePai + 'Id').val();
                $('#' + autoCompleteCascata).clearAutoComplete();

                if ($('#' + autoCompletePai + 'Id').val() > 0) {
                    $('#' + autoCompleteCascata).autocomplete('option', 'source', sourceWithParentId);
                } else {
                    $('#' + autoCompleteCascata).autocomplete('option', 'source', originalSource);
                }

                $('#' + autoCompletePai + 'Id').attr('data-previous-value', currentValue);
            }
        });
    }
}

$.fn.addValidation = function (validation) {
    var attr = $(this).attr('validate');
    var val = validation.replace('[', '').replace(']', '');
    if (attr.toUpperCase().indexOf('[' + val.toUpperCase() + ']') == -1)
        attr = attr + '[' + val + ']';

    $(this).attr('validate', attr);
    SetupControls();
};

$.fn.removeValidation = function (validation) {
    var attr = $(this).attr('validate');
    var val = validation.replace('[', '').replace(']', '');

    attr = attr.replace('[' + val + ']', '');
    $(this).attr('validate', val);
    SetupControls();
}