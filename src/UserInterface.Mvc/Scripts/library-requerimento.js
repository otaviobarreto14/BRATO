function reload() {
    window.location = "ManterOutrasSolicitacoes";
};

function formatar(src, mask) {
    var i = src.value.length;
    var saida = mask.substring(0, 1);
    var texto = mask.substring(i);
    if (texto.substring(0, 1) != saida) {
        src.value += texto.substring(0, 1);
    }
};

function VerificaData(digData) {
    var bissexto = 0;
    var data = digData;
    var tam = data.length;
    if (tam == 10) {
        var dia = data.substr(0, 2);
        var mes = data.substr(3, 2);
        var ano = data.substr(6, 4);
        if ((ano > 1900) || (ano < 2100)) {
            switch (mes) {
                case '01':
                case '03':
                case '05':
                case '07':
                case '08':
                case '10':
                case '12':
                    if (dia <= 31) {
                        return true;
                    }
                    break

                case '04':
                case '06':
                case '09':
                case '11':
                    if (dia <= 30) {
                        return true;
                    }
                    break
                case '02':
                    /* Validando ano Bissexto / fevereiro / dia */
                    if ((ano % 4 == 0) || (ano % 100 == 0) || (ano % 400 == 0)) {
                        bissexto = 1;
                    }
                    if ((bissexto == 1) && (dia <= 29)) {
                        return true;
                    }
                    if ((bissexto != 1) && (dia <= 28)) {
                        return true;
                    }
                    break
            }
        }
    }

    if (tam > 0)
        {
            alert("O valor digitado está incorreto. Formato correto para a data: dd/mm/yyyy");
        }
    return false;
};

function AbrePopUp(strPagina, dblLargura, dblAltura) {

    var dblEsquerda = (screen.width - dblLargura) / 2;
    var dblTopo = (screen.height - dblAltura) / 2;

    if (isNaN(dblEsquerda)) dblEsquerda = 10;
    if (isNaN(dblTopo)) dblTopo = 10;

    var strPaginaSemQs = strPagina.split('?')[0];

    //var objRegEx = new RegExp("\/?[a-z]*\.aspx$");
    var objRegEx = new RegExp("\/?[a-z]*\$");

    var strNomeJanela = objRegEx.exec(strPaginaSemQs)[0];
    strNomeJanela = strNomeJanela.replace("/", "");
    strNomeJanela = strNomeJanela.replace(".aspx", "");

    window.open(strPagina, strNomeJanela, "width=" + dblLargura + ", height=" + dblAltura + ", location=no,menubar=no,status=no,resizable=yes,titlebar=no,top=" + dblTopo + ",left=" + dblEsquerda);

}

function AbreDiv(strDiv, dblLargura, dblAltura) {

    var dblEsquerda = (screen.width - dblLargura) / 2;
    var dblTopo = (screen.height - dblAltura) / 2;

    if (isNaN(dblEsquerda)) dblEsquerda = 10;
    if (isNaN(dblTopo)) dblTopo = 10;

    $(strDiv).top = dblTopo;
    $(strDiv).left = dblEsquerda;
    $(strDiv).show();
}

//--------------------------------------------------
/* This script and many more are available free online at
The JavaScript Source!! http://javascript.internet.com
Created by: Robert Nyman | http://robertnyman.com/ */
/*Até funciona mas mto mal feito*/
function removeHTMLTags(strTextoComTags) {


    /* 
    This line is optional, it replaces escaped brackets with real ones, 
    i.e. < is replaced with < and > is replaced with >
    */
    strTextoComTags = strTextoComTags.replace(/&(lt|gt);/g, function (strMatch, p1) {
        return (p1 == "lt") ? "<" : ">";
    });
    var strTextoSemtags = strTextoComTags.replace(/<\/?[^>]+(>|$)/g, "");

    return strTextoSemtags;


}

function ExecutaChamadaSincrona(strUrlChamada, funcaoSucesso) {

    $.ajax({
        url: strUrlChamada,
        success: funcaoSucesso,
        error: ErroChamadaAssincrona
    });
}

function ErroChamadaAssincrona(error) {

    var strErro = removeHTMLTags(error.responseText);
    var intIndiceBody = strErro.indexOf('body');
    jAlert(strErro.slice(0, intIndiceBody), 'Alerta');

}
//---------------------------------------------------------------------------------------

function SomenteNumero(e) {
    var tecla = (window.event) ? event.keyCode : e.which;
    if ((tecla > 47 && tecla < 58)) return true;
    else {
        if (tecla == 8 || tecla == 0) return true;
        else return false;
    }
}

function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == 13) return true;
    key = String.fromCharCode(whichCode); // Valor para o código da Chave
    if (strCheck.indexOf(key) == -1) return false; // Chave inválida
    len = objTextBox.value.length;
    for (i = 0; i < len; i++)
        if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break;
    aux = '';
    for (; i < len; i++)
        if (strCheck.indexOf(objTextBox.value.charAt(i)) != -1) aux += objTextBox.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len == 0) objTextBox.value = '';
    if (len == 1) objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
    if (len == 2) objTextBox.value = '0' + SeparadorDecimal + aux;
    if (len > 2) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            if (j == 3) {
                aux2 += SeparadorMilesimo;
                j = 0;
            }
            aux2 += aux.charAt(i);
            j++;
        }
        objTextBox.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
            objTextBox.value += aux2.charAt(i);
        objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
    }
    return false;
}

