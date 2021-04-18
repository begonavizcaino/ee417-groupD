/**
 *  message post
 *  @author jiahuan
 *  @date 21/04/18
 */

function loadMessages() {
    $.ajax({
        type: "GET",
        url: "/ee417-groupD/Post",
        dataType: "json",
        data: {
            lastId: 1,
            count: 3,
            category: -1,
        },
        success: (res) => {
            console.log(res)
        },
        error: (err) => {
            console.error(err)
        }
    })
}

function init() {
    loadMessages()   
}

$(function() {
    init()
})
