$(document).ready(function () {
    ToolBarProvider = new ToolBarManager();    
});
///
///
///
var ToolBarProvider = null;
///
///
///
function ToolBarManager() {

     this.Action = "";
     this.Controller = "";
     this.Container = $("#repeat");

     var settings = {
         limpar: true,
         novo: false,
         editar: false,
         excluir: false,
         salvar: true,
         executar: false,
         cancelar: true,
         continuar: false,
         voltar: false,
         exportarExcel: false,
         onLimpar: function () {             
             $("input:not([type=hidden])").val('');
             $('select').val('');
             return false;
             /*
             "hdnMstAction"
             "hdnMstController"
             "hdnMstActionNew"
             "hdnMstActionEdit"
             "hdnMstActionList"

             "hdnAction"
             "hdnController"
             "hdnActionNew"
             "hdnActionEdit"
             "hdnActionList"
             */
         },
         onNovo: function () {
             window.location = $('#hdnMstActionNew').val();
             return false;
         },
         onEditar: function () {
             window.location = $('#hdnMstActionEdit').val();
             return false;
         },
         onExcluir: function () {
             return false;
         },
         onSalvar: function () {
             if (ValidationProvider.ValidateForm($('form'))) {
                 var controller = getController();
                 var action = getAction();

                 $.ajax({
                     url: '/' + getController() + '/' + getAction() + 'InJson',
                     type: 'post',
                     dataType: 'json',
                     data: $('form').serialize(),
                     success: function (json) {
                         var RedirectController = json.RedirectController;
                         if (RedirectController == '')
                             RedirectController = controller;
                         var RedirectAction = json.RedirectAction;
                         if (RedirectAction == '')
                             RedirectAction = 'List';
                         if (json.Sucesso) {
                             jAlert(json.Mensagem, 'Mensagem', function () {
                                 window.location.href = '/' + RedirectController + '/' + RedirectAction;
                             });
                         } else {
                             if (json.Mensagem == undefined) {
                                 var qtdErros = json.ValidationErros.length;
                                 for (var x = 0; x < qtdErros; x++) {
                                     ValidationProvider.GenerateTooltipTemplate($('#' + json.ValidationErros[x].Control), json.ValidationErros[x].Errors.join('<br>'));
                                 }
                             }
                             else {
                                 jAlert(json.Mensagem, 'Mensagem');
                             }
                         }
                     }
                 });
             }
             return false;
         },
         onCancelar: function () {
             window.location = $('#hdnMstActionList').val();
             return false;
         },
         onContinuar: function () {
             return false;
         },
         onExecutar: function () {
             return false;
         },
         onVoltar: function () {
             window.setTimeout(function () { history.go(-1) }, 1);
             return false;
         },
         onExportarExcel: function () {
             return false;
         }
     };

     this.Setup = function (options) {

         $("#repeat").buttonset();

         settings = jQuery.extend(settings, options);

         $("#limpar").toggle(settings.limpar);
         $("#novo").toggle(settings.novo);
         $("#editar").toggle(settings.editar);
         $("#excluir").toggle(settings.excluir);
         $("#salvar").toggle(settings.salvar);
         $("#cancelar").toggle(settings.cancelar);
         $("#continuar").toggle(settings.continuar);
         $("#voltar").toggle(settings.voltar);
         $("#exportarExcel").toggle(settings.exportarExcel);
         $('#executar').toggle(settings.executar);

         if (settings.executar) {
             $("#executar").button({
                 icons: { primary: "ui-icon-gear" }
             }).click(function () {
                 return settings.onExecutar();
             });
         }

         if (settings.limpar) {
             $("#limpar").button({
                 icons: { primary: "ui-icon-trash" }
             }).click(function () {
                 return settings.onLimpar();
             });
         }

         if (settings.novo) {
             $("#novo").button({
                 icons: { primary: "ui-icon-document" }
             }).click(function () {
                 return settings.onNovo();
             });
         }

         if (settings.editar) {
             $("#editar").button({
                 icons: { primary: "ui-icon-pencil" }
             }).click(function () {
                 return settings.onEditar();
             });
         }

         if (settings.excluir) {
             $("#excluir").button({
                 icons: { primary: "ui-icon-trash" }
             }).click(function () {
                 return settings.onExcluir();
             });
         }

         if (settings.salvar) {
             $("#salvar").button({
                 icons: { primary: "ui-icon-pencil" }
             }).click(function () {
                 return settings.onSalvar();
             });
         }

         if (settings.cancelar) {
             $("#cancelar").button({
                 icons: { primary: "ui-icon-document" }
             }).click(function () {
                 return settings.onCancelar();
             });
         }

         if (settings.continuar) {
             $("#continuar").button({
                 icons: { primary: "ui-icon-document" }
             }).click(function () {
                 return settings.onContinuar();
             });
         }

         if (settings.voltar) {
             $("#voltar").button({
                 icons: { primary: "ui-icon-document" }
             }).click(function () {
                 return settings.onVoltar();
             });
         }

         if (settings.exportarExcel) {
             $("#exportarExcel").button({
                 icons: { primary: "ui-icon-document" }
             }).click(function () {
                 return settings.onExportarExcel();
             });
         }

         showToolbar();
     };

    this.ParseInputValidation = function (input, validation) {
    /*
        if (validation != null && validation.key != null && validation.key.toString().length > 0) {
            var callback = null;
            var validateOnBlur = false;
            switch (validation.key) {
                case 'mail': callback = ValidationProvider.ValidateMail; break;
                case 'min': callback = ValidationProvider.ValidateMinSize; break;
                case 'max': callback = ValidationProvider.ValidateMaxSize; break;
                case 'required': callback = ValidationProvider.ValidateRequired; break;
                case 'eq': callback = ValidationProvider.ValidateEquals; break;
                case 'num': callback = ValidationProvider.ValidateNum; break;
                case 'char': callback = ValidationProvider.ValidateChar; break;
                case 'numchar': callback = ValidationProvider.ValidateNumChar; break;
                case 'date': callback = ValidationProvider.ValidateDate; break;
                case 'int': callback = ValidationProvider.ValidateInt; break;
                case 'float': callback = ValidationProvider.ValidateFloat; break;
                case 'callback': callback = ValidationProvider.ValidateCallback; break;
                case 'focus': ValidationProvider.InputFocusAfterValidation = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
                case 'timeout': ValidationProvider.HideTooltipTimeout = ValidationProvider.GetDefaultTimeout(validation.value);
                case 'scroll': ValidationProvider.ScrollToInputOnError = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
                case 'blur': validateOnBlur = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
            };
            if (callback != null || validateOnBlur == false) { ValidationProvider.AddValidationCallback(input, { callback: callback, args: validation.value, key: validation.key, blur: validateOnBlur }); }
        }
        */
    };

    this.GetValidationArray = function (code) {
        /*
        var res = [];
        var parts = code.replaceAll(']', '').split('[')
        for (var i = 0; i < parts.length; i++) {
            try {
                if (parts[i] != '' && parts[i].length > 0) {
                    var nparts = parts[i].split('=');
                    if (nparts.length > 0 && nparts[0].length > 0) {
                        if (nparts.length >= 2) {
                            res.push({ key: nparts[0], value: nparts[1] });
                        }
                        else {
                            res.push({ key: nparts[0], value: '' });
                        }
                    }
                }
            } catch (ex) { }
        }
        return res;
        */
    };

    this.GenerateTooltipTemplate = function (input, msg) {
    /*
        var template = '';
        template += '<div id="{0}" class="formtip error" style="display: none;{2}">';
        template += '   <table style="width: 100%;" cellpadding="0" cellspacing="0">';
        template += '       <tr>';
        template += '           <td class="left error">&nbsp;</td>';
        template += '           <td class="center error"><div class="error text">{1}</div></td>';
        template += '           <td class="right error">&nbsp;</td>';
        template += '       </tr>';
        template += '   </table>';
        template += '</div>';

        var top = ($(input).position().top + ($(input).height() - 25)).toString();
        var left = ($(input).position().left + $(input).width() + 15).toString();
        var templateStyle = 'position:absolute;top: ' + top + 'px;left:' + left + 'px;';
        var templateId = 'dvErro-' + $(input)[0].id;
        var templateElId = '#' + templateId;
        template = template.format(templateId, msg, templateStyle);

        $(templateElId).remove();
        $(input).keydown(function () { $(templateElId).fadeOut('slow', function () { $(this).remove(); }); });

        if ($(input).closest('.form').length > 0) {
            var form = $(input).closest('.form');
            $(form).append(template);
        }
        else { $($(input).parent()).append(template); }

        $(templateElId).click(function () { $(this).fadeOut('slow', function () { $(this).remove(); }); });
        $(templateElId).ready(function () {
            var tooltipdiv = $(templateElId);
            if (ValidationProvider.ScrollToInputOnError) { $(input).scrollTo(); }
            setTimeout(function () { $(templateElId).fadeIn(); if (ValidationProvider.InputFocusAfterValidation) { $(input).focus().select(); } }, 1000);
            setTimeout(function () { if ($(tooltipdiv)[0].tagName != undefined) { $(tooltipdiv).fadeOut('slow', function () { $(this).remove(); }); } }, ValidationProvider.HideTooltipTimeout);
        });
        */
    };

    this.GetDefaultTimeout = function (string) {
    /*
        var timeout = parseInt(string);
        return timeout < 3000 ? 3000 : timeout;
    */
    };

    this.ShowToolbar = function() {
        $('#toolbar-container').show();
        adjustLayout();
    }
   
};