$(function () {
    $.jgrid.defaults = $.extend($.jgrid.defaults, {
        datatype: "json",
        mtype: "POST",
        height: '100%',
        rowList: [20, 40, 80, 160],
        jsonReader: {
            repeatitems: false,
            id: "Id",
            root: "Items",
            records: "ItemCount",
            page: "PageIndex",
            total: "TotalPages"
        },
        editurl: './DeleteByIdInJson/',
        pginput: false,
        viewrecords: true,
        pager: "#pager"
    });

})

jQuery.extend(jQuery.jgrid.del, {
    mtype: "post",
    reloadAfterSubmit: true,
    onclickSubmit: function (rp_ge, postdata) {
        rp_ge.url = './DeleteByIdInJson/' + postdata;
    },
    afterSubmit: function (response, postdata) {
        var json = eval('(' + response.responseText + ')');
        jAlert(json.Message, 'Mensagem');

        return { 0: true };
    }
}); 
