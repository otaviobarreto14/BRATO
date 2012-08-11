var ValidationMessages = {

    GetMessage: function (key) {
        for (var i = 0; i < ValidationMessages.Messages.length; i++) {
            if (ValidationMessages.Messages[i].key == key) { return ValidationMessages.Messages[i]; }
        };
        return ValidationMessages.UnknowMessage;
    },

    UnknowMessage: {
        key: 'unknow',
        message: 'O valor deste campo é inválido',
        regex: null,
        evaluation: null
    },

    Messages: [
            {
            key: 'rangeDatas',
            message: 'A Data Inicial não pode ser maior que a Data Final',
            regex: null,
            evaluation: function (valorInput, valorProximoInput) {
                if (valorInput <= valorProximoInput)
                    return true;
                else
                    return false;
            }
        },
        {
            key: 'select',
            message: 'Marque uma opção válida',
            regex: null,
            evaluation: function (name) {
                var count = $('input[name=' + name + ']:checked').length;
                if (count == 0)
                    return false;
                else
                    return true;
            }
            //evaluation: function (val, args) { return val != null && parseFloat(val) <= parseFloat(args); }
        },
        {
            key: 'req',
            message: 'Este campo é obrigatório!',
            regex: null,
            evaluation: function (val, args) { return val != null && val.toString().length > 0; }
        },
        {
            key: 'min',
            message: 'Valor mínimo é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { return val != null && val.toString().length > 0; }
            //evaluation: function (val, args) { return val != null && parseFloat(val) >= parseFloat(args); }
        },
        {
            key: 'minFloat',
            message: 'Valor mínimo é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { if(val == null) return true; return parseFloat(val) >= parseFloat(args); }
        },        
        {
            key: 'max',
            message: 'Valor máximo é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { return val != null && val.toString().length > 0; }
            //evaluation: function (val, args) { return val != null && parseFloat(val) <= parseFloat(args); }
        },
        {
            key: 'maxFloat',
            message: 'Valor máximo é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { return val != null && parseFloat(val) <= parseFloat(args); }
        },
        {
            key: 'eq',
            message: 'O valor precisa ser igual à <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { return val == args; }
        },
        {
            key: 'mail',
            message: 'O valor deve ser um email válido',
            regex: /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/,
            evaluation: null
        },
        {
            key: 'num',
            message: 'O valor deve possuir apenas números',
            regex: /^[0-9\ ]+$/,
            evaluation: null
        },
        {
            key: 'char',
            message: 'O valor deve possuir apenas letras',
            regex: /^[a-zA-Z\ ]+$/,
            evaluation: null
        },
        {
            key: 'numchar',
            message: 'O valor deve possuir apenas letras e números',
            regex: /^[0-9a-zA-Z]+$/,
            evaluation: null
        },
        {
            key: 'date',
            message: 'O valor deve ser uma data válida',
            regex: null,
            evaluation: function (val) {
                if (val == '') {
                    return true
                }
                else {
                    var regex = /^[0-3]?[\d]-[01]?[\d]-[12][90][\d][\d]$/;
                    var parts = val.split('/');
                    var day = parseInt(parts[0]);
                    var month = parseInt(parts[1]);
                    var year = parseInt(parts[2]);

                    if (regex.test(val.replaceAll('/', '-'))) {
                        if (month > 12) { return false; }
                        else if (month == 2) {
                            if (day == 29) { if (year % 4 != 0 || year % 100 == 0 && year % 400 != 0) { return false; } }
                            else if (day > 28) { return false; }
                        }
                        else if (month == 4 || month == 6 || month == 9 || month == 11) {
                            if (day > 30) { return false; }
                        }
                        if (day > 31) { return false; }
                        return true;
                    }
                    return false;
                }
            }
        },
        {
            key: 'MesAno',
            message: 'O valor deve ser um mês e ano válidos',
            regex: /^(([1-9]|1[0,1,2]|0[1-9])[/][\d]{4})*$/,
            evaluation: null
        },
        {
            key: 'minMesAno',
            message: 'Referência mínima é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) {                
                var valTmp = '01/' + val;
                var argsTmp = '01/' + args;
                var result = compareDate(valTmp, argsTmp);

                return val != null && result < 1;
            }
        },
        {
            key: 'maxMesAno',
            message: 'Referência máxima é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { 
                var valTmp = '01/' + val;
                var argsTmp = '01/' + args;
                var result = compareDate(valTmp, argsTmp);
                
                return val != null && result > -1;
            }
        }, 
        {
            key: 'minDate',
            message: 'Data mínima é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) {
                var data1 = $.datepicker.parseDate('dd/mm/yy', val);
                var data2 = $.datepicker.parseDate('dd/mm/yy', args);;
                return val != null && data1 >= data2;
            }
        },
        {
            key: 'maxDate',
            message: 'Data máxima é de <b>{0}</b>',
            regex: null,
            evaluation: function (val, args) { 
                var data = $.datepicker.parseDate('dd/mm/yy', val);
                var max = $.datepicker.parseDate('dd/mm/yy', args);
                return data <= max;
            }
        }, 
        {
            key: 'int',
            message: 'O valor deve ser um número inteiro',
            regex: null,
            evaluation: function (val) {
                if (val == '') {
                    return true
                }
                else {
                    var regex = /^[\-\+]?\d+$/;

                    if (regex.test(val)) {
                        return true;
                    }
                    return false;
                }
            }

        },
        {
            key: 'float',
            message: 'O Valor deve ser um decimal válido',
            regex: /^[\-\+]?(([0-9]+)([\,]([0-9]+))?|([\,]([0-9]+))?)$/,
            evaluation: null
        },
        {
            key: 'telefone',
            message: 'O valor deve ser um telefone válido',
            regex: /^\+[0-9]+$/,
            evaluation: null
        }
    ]

};