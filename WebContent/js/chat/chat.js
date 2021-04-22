/**
 *  chat module
 *  @author jiahuan
 *  @date 21/04/23
 */

let my_username = ""

let cur_conv_id

const conv_id_list = []

const message_data = {}

var ws

function initWebSocket() {
    var loc = window.location, new_uri;
    if (loc.protocol === "https:") {
        new_uri = "wss:";
    } else {
        new_uri = "ws:";
    }
    new_uri += "//" + loc.host;
    new_uri += loc.pathname + "/../Chat";
    ws = new WebSocket(new_uri);
    ws.addEventListener('open', function (event) {
        ws.send('startup');
        /*setTimeout(() => {
            ws.send('message;1;This  message has been sent by the socket');
        }, 1000);*/
    });

    // Listen for messages
    ws.addEventListener('message', function (event) {
        console.log('Message from server ', event.data);
        const res = event.data.split(";")
        // res = message;1;ad min;Hello
        if (!res) {
            return
        }

        if (res[0] == "received") {
            // first response
            my_username = res[1]
        } else {
            if (conv_id_list.indexOf(res[1] != -1)) {
                conv_id_list.push(res[1])
                if (!cur_conv_id) {
                    cur_conv_id = res[1]
                }
            }

            if (!message_data[res[1] + ""]) {
                message_data[res[1] + ""] = []
            }
            message_data[res[1] + ""].push(event.data) 
            console.log(message_data)

            if (res[1] == cur_conv_id) {
                let str = ""
                if (res[2] == my_username) {
                    // message from myself
                    str = 
                    `<div class="message-row your-message">
                        <div class="message-content">
                            <p>${res[2]}</p>
                            <div class="message-text">${res[3]}</div>
                            <div class="message-time">Apr 5</div>
                        </div>
                    </div>`
                } else {
                    // message from others
                    str = 
                    ` <div class="message-row other-message">
                        <div class="message-content">
                            <p>${res[2]}</p>
                            <div class="message-text">${res[3]}</div>
                            <div class="message-time">Apr 5</div>
                        </div>
                    </div>`
                }
                $("#chat-message-list").prepend(str)
            }
        }
    });
}

function addSendMsgListener() {
    $(document).keyup(function(event){
        if(event.keyCode == 13){
            ws.send("message;" + cur_conv_id + ";" + $("#chat-input").val());
            $("#chat-input").val("")
        }
    });
}

function addConvListListener() {
    $(".conversation").first().css("background", "orange")
    $(".conversation").click(function() {
        $(".conversation").css("background", "")
        $(this).css("background", "orange")
        $('.chat-message-list').animate({scrollTop: '0px'}, 800);
    })
}

function init() {
    initWebSocket()

    addSendMsgListener()
    addConvListListener()
}

$(function() {
    init()
})
