var TipoAbrangenciaEnum =
    {
        Estadual: 1,
        Municipal: 2,
        GrupoDeMunicipios: 3,
        GrupoDeEstados: 4,
        Nacional: 5
    };

jQuery.fn.abrangencia = function (options) {

    var settings = jQuery.extend({
        listUrl: null,
        parentKeyName: null,
        parentKeyValue: null,
        tipoAbrangencia: 0,
        exibirTipoAbrangencia: true
    }, options);

    function popularTipoAbrangencia(tipo) {
        var isLoading = true;
        var loaded = false;

        $('#TipoAbrangencia_CodTipoAbrangencia').jqDropDownList({
            url: '/TipoAbrangencia/GetAllInJson/?sidx=TxtDescricao',
            textField: 'TxtDescricao',
            valueField: 'CodTipoAbrangencia',
            selectedValue: '<%= Model.TipoAbrangencia != null ? Model.TipoAbrangencia.CodTipoAbrangencia : 0 %>',
            onFinish: function () {
                isLoading = false;

                if (!loaded && tipo != 0) {
                    loaded = true;
                    $('#TipoAbrangencia_CodTipoAbrangencia').val(tipo)
                }

                exibirCampos($('#TipoAbrangencia_CodTipoAbrangencia').val());

                if (!settings.exibirTipoAbrangencia)
                    $('#divTipoAbrangencia').hide();

                popularAbrangencia(settings.parentKeyValue);
            },
            onChange: function () {
                exibirCampos($('#TipoAbrangencia_CodTipoAbrangencia').val());

                if (settings.tipoAbrangencia == parseInt($('#TipoAbrangencia_CodTipoAbrangencia').val()))
                    popularAbrangencia(settings.parentKeyValue);
                else if (!isLoading && isNew(settings.parentKeyValue))
                    limparAbrangencia();
            }
        });
    }

    function configurarAutoCompleteMunicipios() {
        $("#municipio").autocomplete({
            minLength: 3,
            source: function (request, response) {
                $.ajax({
                    url: '/Correios/BuscarMunicipios/',
                    data: { nome: $("#municipio").val(), uf: $("#uf").val() },
                    type: "post",
                    success: function (data) {
                        response($.map(data.Items, function (item) {
                            return {
                                label: item.NomeOfiLocalidade,
                                value: item.ChaveLocDne
                            }
                        }));
                    }
                });
            },
            select: function (event, ui) {
                $("#chaveLocDne").val('');
                $("#nomeOficial").val('');
                $("#chaveLocDne").val(ui.item.value);
                $("#nomeOficial").val(ui.item.label);
                ui.item.value = ui.item.label;
            }
        });
    }

    function popularUf() {
        $('#uf').jqDropDownList({
            url: '/Correios/ListarUfs',
            textField: 'NomeOficialUf',
            valueField: 'SiglaUf',
            onChange: function () {
                $("#municipio").val('');
                configurarAutoCompleteMunicipios();
            }
        });
    }

    function limparAbrangencia() {
        var tbody = $('#tableAbrangencia tbody');
        if (tbody.size() > 0)
            tbody.empty();
        else
            $('#tableAbrangencia').empty();
    }

    $('#TipoAbrangencia_CodTipoAbrangencia').change(function () {
        if (possuirAbrangencia())
            limparAbrangencia();
    });

    function isNew(keyValue) {
        return (keyValue == null || keyValue == '' || parseInt(keyValue) == 0);
    }

    function popularAbrangencia(keyValue) {
        if (isNew(keyValue))
            return;

        $.ajax({
            url: settings.listUrl,
            data: { 'codigo': keyValue },
            cache: false,
            success: function (html) {
                $('#tableAbrangencia tbody').html(html);
            }
        });
    }

    function limparFormulario(limparUf) {
        if (limparUf)
            $('#uf').val('');
        $('#municipio').val('');
        $("#chaveLocDne").val('');
        $("#nomeOficial").val('');
    }

    function exibirFormulario(exibirMunicipio, exibirAdicionar) {
        $('#divUf').show();
        $('#divMunicipio').toggle(exibirMunicipio);
        $('#divNovaAbrangencia').show();
    }

    function exibirCampos(tipoAbrangencia) {
        switch (parseInt(tipoAbrangencia)) {
            case TipoAbrangenciaEnum.GrupoDeEstados:
                limparFormulario(true);
                exibirFormulario(false, true);
                break;

            case TipoAbrangenciaEnum.Estadual:
                limparFormulario(true);
                exibirFormulario(false, !possuirAbrangencia());
                break;

            case TipoAbrangenciaEnum.GrupoDeMunicipios:
                limparFormulario(true);
                exibirFormulario(true, true);
                break;

            case TipoAbrangenciaEnum.Municipal:
                limparFormulario(true);
                exibirFormulario(true, !possuirAbrangencia());
                break;

            case TipoAbrangenciaEnum.Nacional:
            default:
                $('#divNovaAbrangencia').hide();
                break;
        }
    }

    function possuirAbrangencia() {
        return $('#tableAbrangencia tr').size() > 0;
    }

    function validarAbrangencia(codTipoAbrangencia, uf, chaveLocDne) {
        switch (parseInt(codTipoAbrangencia)) {
            case TipoAbrangenciaEnum.GrupoDeMunicipios:
            case TipoAbrangenciaEnum.Municipal:
                if (chaveLocDne == '') {
                    jAlert('Informe uma localidade.', 'Informação');
                    return false;
                }
                if (uf == '') {
                    jAlert('Escolha um estado.', 'Informação');
                    return false;
                }
                if (verificarExistencia(codTipoAbrangencia, uf, chaveLocDne)) {
                    jAlert('Esta localidade já está na abrangência.', 'Informação');
                    return false;
                }
                break;

            case TipoAbrangenciaEnum.Estadual:
                if (possuirAbrangencia()) {
                    jAlert('Já existe uma localidade cadastrada.', 'Informação');
                    return false;
                }

            case TipoAbrangenciaEnum.GrupoDeEstados:
                if (uf == '') {
                    jAlert('Escolha um estado.', 'Informação');
                    return false;
                }
                if (verificarExistencia(codTipoAbrangencia, uf, chaveLocDne)) {
                    jAlert('Esta localidade já está na abrangência.', 'Informação');
                    return false;
                }
                break;
        }

        return true;
    }

    function adicionarAbrangencia(sender, codTipoAbrangencia, uf, chaveLocDne, nomeOficial) {
        if (!validarAbrangencia(codTipoAbrangencia, uf, chaveLocDne)) {
            limparFormulario(false);
            return false;
        }

        $.ajax({
            url: sender.href + '?' + settings.parentKeyName + '=' + settings.parentKeyValue,
            data: {
                'siglaUf': uf,
                'chaveLocDne': chaveLocDne,
                'nomeOficial': nomeOficial
            },
            cache: false,
            success: function (html) {
                var tbody = $('#tableAbrangencia tbody');
                if (tbody.size() > 0)
                    tbody.append(html);
                else
                    $('#tableAbrangencia').append(html);
                $('#tableAbrangencia').show();
                limparFormulario(false);
            }
        });

        return false;
    }

    function excluirAbrangencia(sender, codTipoAbrangencia) {
        sender.parents("tr:first").remove();
        return false;
    }

    function verificarExistencia(codTipoAbrangencia, uf, chaveLocDne) {
        var count = 0;
        switch (parseInt(codTipoAbrangencia)) {
            case TipoAbrangenciaEnum.Estadual:
            case TipoAbrangenciaEnum.GrupoDeEstados:
                count = $('#tableAbrangencia tr > td')
                                .find('input[id$="SiglaUf"][value="' + uf + '"]')
                                .size();
                break;

            case TipoAbrangenciaEnum.GrupoDeMunicipios:
            case TipoAbrangenciaEnum.Municipal:
                count = $('#tableAbrangencia tr > td')
                                .find('input[id$="SiglaUf"][value="' + uf + '"]')
                                .parent()
                                .find('input[id$="ChaveLocDne"][value="' + chaveLocDne + '"]')
                                .size();
                break;
        }

        return count > 0;
    }

    popularTipoAbrangencia(settings.tipoAbrangencia);
    popularUf();

    $('.deleteRow').live('click', function () {
        excluirAbrangencia($(this), $('#TipoAbrangencia_CodTipoAbrangencia').val());
        return false;
    });

    $('#adicionarAbrangencia').click(function () {
        adicionarAbrangencia(this, $('#TipoAbrangencia_CodTipoAbrangencia').val(), $('#uf').val(), $('#chaveLocDne').val(), $('#nomeOficial').val());
        return false;
    });
}