/**
*   @Author:
*       Wagner Araujo - keyrox@gmail.com
*   @Description
*       Validates an input field and shows an error tooltip using the message defined in 
*       the file validation.your-lang.js if the valition fails.
*   @Reference
*       <script type="text/javascript" src="../scripts/validation.pt-br.js">
*       <script type="text/javascript" src="../scripts/validation.js">
*   @Usage: 
*       <input type="text" validate="[min=5][max=100][mail]" />
*   @Params:
*       [mail] 			        - valid mail address
*       [min=x]			        - characters => x
*       [max=x]			        - characters <= x
*       [required]		        - required field
*       [eq=x]			        - value == x
*       [num]			        - value must contains only number
*       [char]			        - value must contains only letters
*       [numchar]		        - value must contains only numbers and letters
*       [date]			        - valid date
*       [int]			        - value integer
*       [float]			        - valid float
*       [callback=myfunction]	- your validate function return "true/false" or "{ success: false, msg: 'Invalid value!' }"
*       [focus=true/false]	    - define if the field must get focus on validation error
*       [timeout=x]		        - timeout to hide the error tooltip = x
*       [scrool=true/false]	    - define if the page will scroll to the field on validation error
*       [blur=true/false]	    - define if the field will be validated on lost focus
*   
**/

function SetupValidator() {
    ValidationProvider = new ValidationManager();
    if ($('input').length > 0) {
        $('body input').each(function (index) {
            $(this).css('background', '#FFFFFF').data('validations', null);
        });

        $('body').find('*[validate*="[required]"]').each(function (index) {
            $(this).css('background', '#FFFACD');
        });

        ValidationProvider.Setup();
     }
}
///
///
///
var ValidationProvider = null;
///
///
///
$(document).ready(function () {
    SetupValidator();
});
///
///
///
jQuery.fn.validate = function () {
    return ValidationProvider.ValidateForm(this);
  //  if ($(this)[0].tagName == 'DIV') { return ValidationProvider.ValidateForm(this); }
  //  else if ($(this)[0].tagName == 'INPUT') { return ValidationProvider.RaiseValidationEvents(this); }
};


function verificaDuplicados(array, nameInput) {
    var contador = 0;
    $.each(array, function (index, item) {
        if (item.name == nameInput) {
            contador++;
        }
    });
    if(contador > 0)
        return false;

    return true;
}


function ValidationManager() {

    this.InputFocusAfterValidation = false;
    this.HideTooltipTimeout = 10000;
    this.ScrollToInputOnError = false;
    this.ValidateOnLostFocus = true;

    this.ShowCallBackErrors = function () { 
        
    }

    this.Setup = function () {
        var checkArray = [];

        $('input, select').each(function (index) {
            if ($(this).attr("type") == "checkbox") {
                chkNameInput = $(this).attr("name");

                if (verificaDuplicados(checkArray, chkNameInput)) {
                    checkArray.push({
                        'name': chkNameInput
                    });

                    ValidationProvider.ParseValidation($(this));
                    ValidationProvider.RegisterValidationEvents($(this));
                }
            }
            else {
                ValidationProvider.ParseValidation($(this));
                ValidationProvider.RegisterValidationEvents($(this));
            }
        });

    };

    this.RegisterValidationEvents = function (input) {
        if (ValidationProvider.ValidateOnLostFocus) {
            if ($(input).data('validations') != null && $(input).data('validations').length > 0) {

                var validations = $(input).data('validations');
                for (var i = 0; i < validations.length; i++) { if (validations[i].blur == false) { return; } }

                $(input).focusout(function () {
                    ValidationProvider.RaiseValidationEvents(input);
                });
            }
        }
    };

    this.RaiseValidationEvents = function (input) {
        if ($(input).attr('disabled') != 'disabled') {
            var validations = $(input).data('validations');
            if (validations != null) {
                for (var i = 0; i < validations.length; i++) {
                    var validationObj = validations[i];
                    if (validationObj.callback != null) {
                        var res = ValidationProvider.Validate(validationObj.callback, $(input), validationObj.args);
                        if (res == true) { return false; }                        
                    }
                }
            }
        }
        return true;
    };

    this.ValidateForm = function (form) {
        var inputs = $(form).find('input, select');
        var result = true;
        for (var i = 0; i < inputs.length; i++) {
            if (!ValidationProvider.RaiseValidationEvents(inputs[i])) {
                result = false;
            }
        }
        return result;
    };

    this.ValidateAll = function (selector) {
        if (select != null && selector.toString().length > 0) {
            $(selector).each(function (idx) {
                ValidationProvider.RaiseValidationEvents(this);
            });
        }
        else {
            $('input').each(function (idx) {
                ValidationProvider.RaiseValidationEvents(this);
            });
        }
    };


    this.Validate = function (callback, input, args) {
        var res = callback(input, args);
        if (res.success == false) {
            ValidationProvider.GenerateTooltipTemplate(input, res.msg);
            return true;
        }
        return false;
    };

    this.ParseValidation = function (input) {
        var validatecode = $(input).attr('validate');
        if (validatecode != '' && validatecode != null) {

            var validateobj = ValidationProvider.GetValidationArray(validatecode);
            jQuery.each(validateobj, function (idx, val) {
                ValidationProvider.ParseInputValidation(input, this);
            });
        }
    };

    this.ParseInputValidation = function (input, validation) {
        if (validation != null && validation.key != null && validation.key.toString().length > 0) {
            var callback = null;
            var validateOnBlur = false;
            switch (validation.key) {
                case 'select': callback = ValidationProvider.ValidateSelect; break;
                case 'mail': callback = ValidationProvider.ValidateMail; break;
                case 'min': callback = ValidationProvider.ValidateMinSize; break;
                case 'max': callback = ValidationProvider.ValidateMaxSize; break;
                case 'minFloat': callback = ValidationProvider.ValidateMinSizeFloat; break;
                case 'maxFloat': callback = ValidationProvider.ValidateMaxSizeFloat; break;
                case 'required': callback = ValidationProvider.ValidateRequired; break;
                case 'eq': callback = ValidationProvider.ValidateEquals; break;
                case 'num': callback = ValidationProvider.ValidateNum; break;
                case 'char': callback = ValidationProvider.ValidateChar; break;
                case 'numchar': callback = ValidationProvider.ValidateNumChar; break;
                case 'date': callback = ValidationProvider.ValidateDate; break;
                case 'MesAno': callback = ValidationProvider.ValidateMesAno; break;
                case 'minMesAno': callback = ValidationProvider.ValidateMinMesAno; break;
                case 'maxMesAno': callback = ValidationProvider.ValidateMaxMesAno; break;
                case 'minDate': callback = ValidationProvider.ValidateMinDate; break;
                case 'maxDate': callback = ValidationProvider.ValidateMaxDate; break;
                case 'int': callback = ValidationProvider.ValidateInt; break;
                case 'float': callback = ValidationProvider.ValidateFloat; break;
                case 'callback': callback = ValidationProvider.ValidateCallback; break;
                case 'focus': ValidationProvider.InputFocusAfterValidation = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
                case 'timeout': ValidationProvider.HideTooltipTimeout = ValidationProvider.GetDefaultTimeout(validation.value);
                case 'scroll': ValidationProvider.ScrollToInputOnError = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
                case 'blur': validateOnBlur = ValidationProvider.IsStringTrue(validation.value) ? true : false; break;
                case 'telefone': callback = ValidationProvider.ValidateTelefone; break;
                case 'rangeDatas': callback = ValidationProvider.RangeDatas; break;                 
            };
            if (callback != null || validateOnBlur == false) { ValidationProvider.AddValidationCallback(input, { callback: callback, args: validation.value, key: validation.key, blur: validateOnBlur }); }
        }
    };

    this.AddValidationCallback = function (input, callbackObj) {
        if ($(input).data('validations') != null) {
            var callbacks = $(input).data('validations');

            var existentCallbacks = [];
            for (var i = 0; i < callbacks.length; i++) { if (callbacks[i].key == callbackObj.key) { existentCallbacks.push(i); } }
            for (var i = 0; i < existentCallbacks.length; i++) { callbacks.remove(existentCallbacks[i]); }

            callbacks.push(callbackObj);
            $(input).data('validations', callbacks);
        }
        else { $(input).data('validations', [callbackObj]); }
    };

    this.RangeDatas = function (input) {
        var valorInput = $(input).val();
        var cont;
        var valorProximoInput;

        $(':input').each(function (index) {
            if (cont == 1) {
                valorProximoInput = $(this).val();
                cont = 0;
            }
            if ($(this).attr('id') == $(input).attr('id'))
                cont = 1;
        });

        var obj = ValidationMessages.GetMessage('rangeDatas');

        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(valorInput, valorProximoInput), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(valorInput, valorProximoInput), msg: obj.message };
        }
        return true;

    };

    this.ValidateSelect = function (input) {

        var name = $(input).attr('name');

        var obj = ValidationMessages.GetMessage('select');

        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(name), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(name), msg: obj.message };
        }
        return true;

    };

    this.ValidateMail = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('mail');
        return { success: obj.regex.test(val), msg: obj.message };
    };

    this.ValidateMinSize = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('min');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateMaxSize = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('max');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateMinSizeFloat = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('minFloat');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (args != 'NaN' && obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateMaxSizeFloat = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('maxFloat');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateRequired = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('req');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateEquals = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('eq');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateNum = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('num');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateChar = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('char');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateNumChar = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('numchar');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateDate = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('date');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;        
    };

    this.ValidateMesAno = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('MesAno');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateMinMesAno = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('minMesAno');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };


    this.ValidateMaxMesAno = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('maxMesAno');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateMinDate = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('minDate');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };


    this.ValidateMaxDate = function (input, args) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('maxDate');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val, args), msg: obj.message.format(args) };
        }
        return true;
    };

    this.ValidateInt = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('int');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }

        return true;
    };

    this.ValidateFloat = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('float');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateTelefone = function (input) {
        var val = $(input).val();
        var obj = ValidationMessages.GetMessage('telefone');
        if (obj.regex != null && obj.regex != undefined) {
            return { success: obj.regex.test(val), msg: obj.message };
        }
        else if (obj.evaluation != null && obj.evaluation != undefined) {
            return { success: obj.evaluation(val), msg: obj.message };
        }
        return true;
    };

    this.ValidateCallback = function (input, args) {
        var res = eval('{0}(\'{1}\', {2})'.format(args, $(input).val(), '\'' + $(input)[0].id + '\''));
        if (typeof res === 'boolean') {
            return { success: res, msg: ValidationMessages.UnknowMessage.message };
        }
        else if (typeof res === 'object') {
            var success = res.hasOwnProperty('success') ? res.success : false;
            var msg = res.hasOwnProperty('msg') ? res.msg : ValidationMessages.UnknowMessage.message;
            return { success: success, msg: msg };
        }
        return { success: false, msg: ValidationMessages.UnknowMessage.message };
    };

    this.GetValidationArray = function (code) {
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
    };

    this.GenerateTooltipTemplate = function (input, msg) {

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


        if ($(input).attr("type") == "checkbox") {
            var templateId = 'dvErro-' + $(input).attr("name");
            var templateElId = '#' + templateId;
        }
        else {
            var templateId = 'dvErro-' + $(input)[0].id;
            var templateElId = '#' + templateId;
        }



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

    };

    this.IsStringTrue = function (string) {
        return string == 'true' || string == '1' || string == 'on' || string == 'yes';
    };

    this.GetDefaultTimeout = function (string) {
        var timeout = parseInt(string);
        return timeout < 3000 ? 3000 : timeout;
    };

    this.IsRequired = function (control) {
        if (control.attr('validate').indexOf('[required]') != -1)
            return true;
        else
            return false;
    };
};