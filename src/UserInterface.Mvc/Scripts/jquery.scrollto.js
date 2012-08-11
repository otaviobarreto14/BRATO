///
///
///
jQuery.fn.scrollTo = function (timeout) {
    var delay = timeout == null || timeout == undefined ? 1000 : timeout;
    var offset = $(this).offset().top - 50;
    if (offset < 0) { offset = 0; }
    $('html,body').animate({ scrollTop: offset }, delay);
};