//valida CPF
function vercpf(cpf) {
    if (cpf != '' && cpf != null) {
        cpf = cpf.replace('.', '');
        cpf = cpf.replace('.', '');
        cpf = cpf.replace('-', '');
        if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999")
            return false;
        add = 0;
        for (i = 0; i < 9; i++)
            add += parseInt(cpf.charAt(i)) * (10 - i);
        rev = 11 - (add % 11);
        if (rev == 10 || rev == 11)
            rev = 0;
        if (rev != parseInt(cpf.charAt(9)))
            return false;
        add = 0;
        for (i = 0; i < 10; i++)
            add += parseInt(cpf.charAt(i)) * (11 - i);
        rev = 11 - (add % 11);
        if (rev == 10 || rev == 11)
            rev = 0;
        if (rev != parseInt(cpf.charAt(10)))
            return false;
        return true;
    } else { return true; }
}

//valida Cnpj
function validaCNPJ(cnpj) {
    if (cnpj != '' && cnpj != null) {
        cnpj = cnpj.replace('/', '');
        cnpj = cnpj.replace('.', '');
        cnpj = cnpj.replace('.', '');
        cnpj = cnpj.replace('-', '');

        var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
        digitos_iguais = 1;

        if (cnpj.length < 14 && cnpj.length < 15) {
            return false;
        }
        for (i = 0; i < cnpj.length - 1; i++) {
            if (cnpj.charAt(i) != cnpj.charAt(i + 1)) {
                digitos_iguais = 0;
                break;
            }
        }

        if (!digitos_iguais) {
            tamanho = cnpj.length - 2
            numeros = cnpj.substring(0, tamanho);
            digitos = cnpj.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;

            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2) {
                    pos = 9;
                }
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0)) {
                return false;
            }
            tamanho = tamanho + 1;
            numeros = cnpj.substring(0, tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2) {
                    pos = 9;
                }
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1)) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    } else { return true; }
}

// Veriica se valor é um número
function eNumero(valor) {
    validChar = '0123456789.,-';
    for (var i = 0; i < valor.length; i++)
        if (validChar.indexOf(valor.substr(i, 1)) < 0)
        return false;
    return true;
}

//Bloqueia digitação de caracteres q nao sejam numeros
function somenteNumeros(dom) {
    dom.value = dom.value.replace(/\D/g, '');
}

function SomenteValores(textBox) {
    //debugger; 
    var num = document.getElementById(textBox).value;
    if (document.all)
        var tecla = event.keyCode;
    else if (document.layers)
        var tecla = num.which;
    if ((tecla > 47 && tecla < 58) || tecla == 44 || tecla == 46)
        return true;
    else {
        if (tecla != 8)
            event.keyCode = 0;
        else
            return true;
    }
}

//Retira espaços em branco de uma string
function trim(str) {
    return str.replace(/^\s+|\s+$/g, "");
}
//left trim
function ltrim(str) {
    return str.replace(/^\s+/, "");
}
//right trim
function rtrim(str) {
    return str.replace(/\s+$/, "");
}


// check date JavaScript function   
// if date is valid then function returns true, otherwise returns false
function isDate(txtDate) {

    var objDate;  // date object initialized from the txtDate string   
    var mSeconds; // milliseconds from txtDate   

    // date length should be 10 characters - no more, no less   
    if (txtDate.length != 10) return false;

    // extract day, month and year from the txtDate string   
    // expected format is mm/dd/yyyy   
    // subtraction will cast variables to integer implicitly   
    //var day = txtDate.substring(3, 5) - 0; // EUA
    //var month = txtDate.substring(0, 2) - 1; // EUA // because months in JS start with 0
    var day = txtDate.substring(0, 2) - 0; // funcao substrig de javascript: substring(dePosInicial, atePosFinalSemIncluirCaracterDessaPosicao)
    var month = txtDate.substring(3, 5) - 1; // because months in JS start with 0               
    var year = txtDate.substring(6, 10) - 0;

    // third and sixth character should be /   
    if (txtDate.substring(2, 3) != '/') return false;
    if (txtDate.substring(5, 6) != '/') return false;

    // test year range   
    if (year < 999 || year > 3000) return false;

    // convert txtDate to the milliseconds   
    mSeconds = (new Date(year, month, day)).getTime();

    // set the date object from milliseconds   
    objDate = new Date();
    objDate.setTime(mSeconds);

    // if there exists difference then date isn't valid   
    if (objDate.getFullYear() != year) return false;
    if (objDate.getMonth() != month) return false;
    if (objDate.getDate() != day) return false;

    // otherwise return true   
    return true;
}

//Se data_1 maior que data_2, retorna 1
//Se data_1 igual a data_2, retorna 0
//Se data_1 menor que data_2, retorna -1
function comparaDatas(data_1, data_2) {
    var Compara01 = parseInt(data_1.split("/")[2].toString() + data_1.split("/")[1].toString() + data_1.split("/")[0].toString());
    var Compara02 = parseInt(data_2.split("/")[2].toString() + data_2.split("/")[1].toString() + data_2.split("/")[0].toString());

    if (Compara01 > Compara02) {
        return 1;
    }
    if (Compara01 == Compara02) {
        return 0;
    }
    if (Compara01 < Compara02) {
        return -1;
    }

    return false;
}

//Converte data formato americano para formato brasileiro
function dataUSparaBR(dataUS) {
    dataUS = dataUS.split("/");
    var dataBR = dataUS[1] + "/" + dataUS[0] + "/" + dataUS[2];
    return dataBR;
}

//Informa numero de dias entre duas datas
function calculaDias(inicio, fim) {
    inicio = inicio.split("/");
    fim = fim.split("/");
    var sDate = new Date(inicio[1] + "/" + inicio[0] + "/" + inicio[2]);
    var eDate = new Date(fim[1] + "/" + fim[0] + "/" + fim[2]);
    var DiasApart = Math.abs(Math.round((sDate - eDate) / 86400000));
    return DiasApart;
}

// dd/mm/yyyy
function obtemDataAtual() {
    var hoje = new Date();
    var dia = hoje.getDate();
    if (dia.toString().length < 2)
        dia = "0" + dia;
    var mes = hoje.getMonth() + 1;
    if (mes.toString().length < 2)
        mes = "0" + mes;
    var ano = hoje.getFullYear();
    var sData = dia + "/" + mes + "/" + ano;

    return sData;
}

function somenteValoresDentroDePai(idDivPai) {
    $(idDivPai).find('input:text').each(function() { // 21 22
        $(this).bind("keypress", function(e) {  //19 20
            //alert('tecla pressionada: ' + e.keyCode);
            if ((e.which > 47 && e.which < 58) || e.which == 44 || e.which == 46)
                return true;
            if (e.which == 8) {
                return true;
            }
            return false;
        });   //19 20               
    });    //21 22
}

//Adiciona "0" quando o dia ou o mês for de um dígito "1/1/2010" para "01/01/2010"
function acertarData(dataCerta) {
    if (dataCerta.substring(1, 2) == "/") {
        dataCerta = "0" + dataCerta.substring(0, 10);
    }
    if (dataCerta.substring(4, 5) == "/") {
        dataCerta = dataCerta.substring(0, 3) + "0" + dataCerta.substring(3, 10);
    }
    else { dataCerta = dataCerta.substring(0, 10); }

    return dataCerta;
}

function validaCompetencia(txtCompetencia) {

    var objDate;  // objeto de data inicializado da strig txtCompetencia
    var mSeconds; // millisegundos de txtCompetencia

    // tamanho da competência deve ser de 7 caracteres, nem mais, nem menos
    if (txtCompetencia.length != 7) return false;

    // extrair mês e ano de txtCompetencia.
    // definir dia como 01 para ser concatenado a txtCompetencia mais a frente, convertendo-o em uma data 
    // o formato esperado é mm/yyyy
    // subtração irá converter variáveis para inteiro implicitamente
    var day = 1;
    var month = txtCompetencia.substring(0, 2) - 1; // Os meses em Javascript começam com 0 (Janeiro é 0, Fevereiro é 1). Isso para tratamento pelo índice do mês.
    var year = txtCompetencia.substring(3, 7) - 0; // funcao substrig de javascript: substring(dePosInicial, atePosFinalSemIncluirCaracterDessaPosicao)

    // terceiro caractere deve ser /
    if (txtCompetencia.substring(2, 3) != '/') return false;

    // Teste período do ano
    if (year < 999 || year > 3000) return false;

    // Converte txtCompetencia para milisegundos
    mSeconds = (new Date(year, month, day)).getTime();

    // Seta o objeto tipo data através dos milisegundos
    objDate = new Date();
    objDate.setTime(mSeconds);

    // Se existirem diferenças então data passada era inválida 
    if (objDate.getFullYear() != year) return false;
    if (objDate.getMonth() != month) return false;
    if (objDate.getDate() != day) return false;

    // Caso contrário, retorne true
    return true;
}

function mascaraData(campoData) {
    var data = campoData.value;
    if (data.length == 2) {
        data = data + '/';
        $(campoData).attr('value', data);
        return true;
    }
    if (data.length == 5) {
        data = data + '/';
        $(campoData).attr('value', data);
        return true;
    }
}

function validaDataJqgridEdit(value) {
    if (isDate(value)) {
        return [true, "", ""];
    }
    else {
        return [false, "Informe uma data válida!", ""];
    }
}

//Seta o atributo validate, do componente validator-0.3, removendo inclusive a classe highlight, quando validate em branco
function setaAtributoValidate(campo, chaveValidate) {
    campo.attr("validate", chaveValidate);

    if (chaveValidate == "") {
        campo.removeClass("highlight");
    }
}

//Limpa campos HTML. Por enquanto só age em campos input[text] e select. Implementar também para input[radio], input[checkbox], e textarea
function limpaCampo(campo) {
    var _nomeTag = campo[0].tagName;
    if (_nomeTag == "INPUT") {
        var _tipoCampoInput = campo.attr("type");

        if (_tipoCampoInput == "text")
            campo.attr("value", "");

        if (_tipoCampoInput == "radio")
            campo.attr("checked", "");

        if (_tipoCampoInput == "checkbox")
            campo.attr("checked", "");
    }

    if (_nomeTag == "SELECT")
        campo.empty();
}

function borda(borda) {
    $(function() {
        jQuery.each(jQuery.browser, function(i, val) {
            //i = nome do browser
            if (i == "mozilla") {
                $(borda).corner("10px");
            }
        });
    });
}

function calculaDvMilitar(ordem) {
    var dv = 0;
    if (ordem.length == 6) {
        // funcao substrig de javascript: substring(dePosInicial, atePosFinalSemIncluirCaracterDessaPosicao)
        //pegar cada caracter e separar em variaveis
        var c6 = ordem.substring(5, 6); //variavel c6 significa caracter6
        var c5 = ordem.substring(4, 5); //variavel c5 significa caracter5
        var c4 = ordem.substring(3, 4); //variavel c4 significa caracter6
        var c3 = ordem.substring(2, 3); //variavel c3 significa caracter6
        var c2 = ordem.substring(1, 2); //variavel c2 significa caracter6
        var c1 = ordem.substring(0, 1); //variavel c1 significa caracter6
        //multiplicar cada um por 11 e posteriormente somar
        c6 = c6 * 2;
        c5 = c5 * 3;
        c4 = c4 * 4;
        c3 = c3 * 5;
        c2 = c2 * 6;
        c1 = c1 * 7;

        //somar tudo
        var soma = c6 + c5 + c4 + c3 + c2 + c1;

        var resto = soma % 11;
        if (resto == 0 || resto == 1) {
            dv = resto;
        }
        else {
            dv = 11 - resto;
        }

        return dv;

    }
}

function calculaDvCivil(matricula, max) {
    //funcao para calcular o DV dos CIVIS - Ativos e Inativos ou Pensionistas
    //se o MAX = 7 entao o CIVIL ´ativo ou inativo, e se for 8, ele é Pensionista
    var dv = 0;
    if (max == 7) {
        // funcao substrig de javascript: substring(dePosInicial, atePosFinalSemIncluirCaracterDessaPosicao)
        //pegar cada caracter e separar em variaveis
        var c12 = matricula.substring(11, 12); //variavel c12 significa caracter6
        var c11 = matricula.substring(10, 11); //variavel c11 significa caracter6
        var c10 = matricula.substring(9, 10); //variavel c10 significa caracter6
        var c9 = matricula.substring(8, 9); //variavel c9 significa caracter6
        var c8 = matricula.substring(7, 8); //variavel c8 significa caracter6
        var c7 = matricula.substring(6, 7); //variavel c7 significa caracter6
        var c6 = matricula.substring(5, 6); //variavel c6 significa caracter6
        var c5 = matricula.substring(4, 5); //variavel c5 significa caracter5
        var c4 = matricula.substring(3, 4); //variavel c4 significa caracter6
        var c3 = matricula.substring(2, 3); //variavel c3 significa caracter6
        var c2 = matricula.substring(1, 2); //variavel c2 significa caracter6
        var c1 = matricula.substring(0, 1); //variavel c1 significa caracter6
        //multiplicar cada um por 11 e posteriormente somar


        c12 = c12 * 2;
        c11 = c11 * 3;
        c10 = c10 * 4;
        c9 = c9 * 5;
        c8 = c8 * 6;
        c7 = c7 * 7;
        c6 = c6 * 8;
        c5 = c5 * 9;
        c4 = c4 * 2;
        c3 = c3 * 3;
        c2 = c2 * 4;
        c1 = c1 * 5;

        //somar tudo
        var soma = c12 + c11 + c10 + c9 + c8 + c7 + c6 + c5 + c4 + c3 + c2 + c1;

        var resto = soma % 11;
        if (resto == 0) {
            dv = 1;
        }
        else {
            if (resto == 1) {
                dv = 0;
            }
            else {
                dv = 11 - resto;
            }
        }

        return dv;

    } else {
        // funcao substrig de javascript: substring(dePosInicial, atePosFinalSemIncluirCaracterDessaPosicao)
        //pegar cada caracter e separar em variaveis
        var c13 = matricula.substring(12, 13); //variavel c13 significa caracter6
        var c12 = matricula.substring(11, 12); //variavel c12 significa caracter6
        var c11 = matricula.substring(10, 11); //variavel c11 significa caracter6
        var c10 = matricula.substring(9, 10); //variavel c10 significa caracter6
        var c9 = matricula.substring(8, 9); //variavel c9 significa caracter6
        var c8 = matricula.substring(7, 8); //variavel c8 significa caracter6
        var c7 = matricula.substring(6, 7); //variavel c7 significa caracter6
        var c6 = matricula.substring(5, 6); //variavel c6 significa caracter6
        var c5 = matricula.substring(4, 5); //variavel c5 significa caracter5
        var c4 = matricula.substring(3, 4); //variavel c4 significa caracter6
        var c3 = matricula.substring(2, 3); //variavel c3 significa caracter6
        var c2 = matricula.substring(1, 2); //variavel c2 significa caracter6
        var c1 = matricula.substring(0, 1); //variavel c1 significa caracter6
        //multiplicar cada um por 11 e posteriormente somar

        c13 = c13 * 2;
        c12 = c12 * 3;
        c11 = c11 * 4;
        c10 = c10 * 5;
        c9 = c9 * 6;
        c8 = c8 * 7;
        c7 = c7 * 8;
        c6 = c6 * 9;
        c5 = c5 * 2;
        c4 = c4 * 3;
        c3 = c3 * 4;
        c2 = c2 * 5;
        c1 = c1 * 6;

        //somar tudo
        var soma = c13 + c12 + c11 + c10 + c9 + c8 + c7 + c6 + c5 + c4 + c3 + c2 + c1;

        var resto = soma % 11;
        if (resto == 0) {
            dv = 1;
        }
        else {
            if (resto == 1) {
                dv = 0;
            }
            else {
                dv = 11 - resto;
            }
        }

        return dv;
    }
}
function hoverButton() {
    $('.simpleButton,  .iconButton, .gridButton,  ul#icons li').hover(
					        function() { $(this).addClass('ui-state-hover'); },
					        function() { $(this).removeClass('ui-state-hover'); }
				        );

}
