$(function(){
    function triNext() {
        return setInterval(() => {
            $(".owl-next").trigger("click")
        }, 3000)
    }

    let handler = triNext()

    $(".owl-prev").mouseenter(() => {
        if (handler) {
            clearInterval(handler)
            handler = null
        }
    })
    $(".owl-next").mouseenter(() => {
        if (handler) {
            clearInterval(handler)
            handler = null
        }
    })

    $(".owl-prev").mouseleave(() => {
        if (!handler) {
            handler = triNext()
        }
    })
    $(".owl-next").mouseleave(() => {
        if (!handler) {
            handler = triNext()
        }
    })


    // hide banner when enter signup page
    const param = getQueryVariable("mode")
    if (param == "signup") {
        $(".main-banner").hide()
    } else {
        $(".main-banner").show()
    }
})

getQueryVariable = function(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

