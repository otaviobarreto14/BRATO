function getMenuHeight() {
    var a = $(window).height();
    var b = $("#dock").position().top;
    return a - b;
}

$(document).ready(function() {
    var docked = 0;

    $("#dock > li > ul").height(getMenuHeight());

    var a = $(window).height();
    var b = $("#dock").position().top + 28; // HACK! 28 = height(15) + padding(5 + 5) + borders
    $("#dock li.menuItems").height(a - b);
    
    $("#dock .dock").click(function() {
        $(this).parent().parent().addClass("docked").removeClass("free");

        docked += 1;
        var dockH = getMenuHeight() / docked;
        var dockT = 0;

        var a1 = $(window).height();
        var b1 = $("#dock li.menuItems").offset().top;
        $("#dock li.menuItems").height(a1 - b1);
        
        $("#dock li ul.docked").each(function() {
            $(this).height(dockH).css("top", dockT + "px");
            dockT += dockH;
        });
        $(this).parent().find(".undock").show();
        $(this).hide();

        if (docked > 0)
            $("#content").css("margin-left", "250px");
        else
            $("#content").css("margin-left", "60px");
    });

    $("#dock .undock").click(function() {
        $(this).parent().parent().addClass("free").removeClass("docked")
                    .animate({ left: "-180px" }, 200).height(getMenuHeight()).css("top", "0px");

        docked = docked - 1;
        var dockH = getMenuHeight() / docked;
        var dockT = 0;

        var a1 = $(window).height();
        var b1 = $("#dock li.menuItems").offset().top;
        $("#dock li.menuItems").height(a1 - b1);
        
        $("#dock li ul.docked").each(function() {
            $(this).height(dockH).css("top", dockT + "px");
            dockT += dockH;
        });
        $(this).parent().find(".dock").show();
        $(this).hide();

        if (docked > 0)
            $("#content").css("margin-left", "250px");
        else
            $("#content").css("margin-left", "60px");
    });

    $("#dock li").hover(function() {
        $(this).find("ul").animate({ left: "40px" }, 200);
    }, function() {
        $(this).find("ul.free").animate({ left: "-180px" }, 200);
    });
}); 