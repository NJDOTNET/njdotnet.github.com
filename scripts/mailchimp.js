function sendSubscribe(email) {

    $("#subscribe-result-formaterror").css("display", "none");
    $("#subscribe-result-submitsuccess").css("display", "none");
    $("#subscribe-result-submitfail").css("display", "none");

    $("#subscribe-result-space").css("display", "");

    var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email)) {
        $("#subscribe-result-space").css("display", "none");
        $("#subscribe-result-formaterror").css("display", "");
        return;
    }

    $("#subscribe-email").attr("disabled", "true");
    $("#subscribe-submit-icon").css("display", "none");
    $("#subscribe-wait-icon").css("display", "");


    $.getJSON(
        "scripts/SimpleJsonProxy.ashx?u=" + $.URLEncode("http://api.mailchimp.com/1.2/?method=listSubscribe&apikey=0fd53182a10ca701f8645b1c76b78503-us1&id=4f6467275d&email_address=" + email + "&merge_vars=&output=json"),
        function (result) {
            if (result) {
                $("#subscribe-email").removeAttr("disabled");
                $("#subscribe-success-icon").css("display", "");
                $("#subscribe-wait-icon").css("display", "none");
                $("#subscribe-result-space").css("display", "none");
                $("#subscribe-result-submitsuccess").css("display", "");
                $("#subscribe-email").val("");              
            } else {
                $("#subscribe-email").removeAttr("disabled");
                $("#subscribe-submit-icon").css("display", "");
                $("#subscribe-wait-icon").css("display", "none");
                $("#subscribe-result-space").css("display", "none");
                $("#subscribe-result-submitfail").css("display", "");
            }
        });
}

