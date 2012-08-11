jQuery.fn.jqDropDownList = function(options) {

    var container = this;

    var settings = jQuery.extend({
        textField: "Text",
        valueField: "Value",
        rootField: "Items",
        method: "POST",
        url: null,
        selectedValue: null,
        onChange: function() { },
        onFinish: function() { }
    }, options);

    container.attr("disabled", "disabled");
    $.ajax({
        type: settings.method,
        url: settings.url,
        dataType: "json",
        data: {},
        timeout: 30000,
        error: function() {
            container.removeAttr("disabled");
        },
        success: function(data, status) {
            var items = eval((settings.rootField == null) ? "data" : "data." + settings.rootField);

            for (i = 0; i < items.length; i++) {
                var newOption = document.createElement("option");
                $(newOption).html(eval("items[i]." + settings.textField));
                $(newOption).attr("value", eval("items[i]." + settings.valueField));
                if (eval("items[i]." + settings.valueField) == settings.selectedValue) {
                    $(newOption).attr("selected", "selected");
                }
                container.append(newOption);
            }

            container.change(settings.onChange);

            if (settings.selectedValue != null)
                settings.onChange();

            container.removeAttr("disabled");

            settings.onFinish();
        }
    });
};

jQuery.fn.selectValue = function(selectedValue) {

    var container = this;
    
    container.children("option").removeAttr("selected");
    container.children("option").each(function(){
        if (this.attr("value") == selectedValue)
            this.attr("selected", "selected");
    });
}