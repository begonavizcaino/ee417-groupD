/**
 *  message post
 *  @author jiahuan
 *  @date 21/04/18
 */

const COUNT_PER_PAGE = 3

const LOAD_INTERVAL_TIME = 100

const MAX_REQUEST_TIMES = 20

const MAX_PREVIEW_CONTENT_LENGTH = 350

let lastId = null

let message_map = new Map()

// current children nodes of post-content 
let cur_message_str = ""

let isClickViewAll = false

function showMessage(data) {
    const str = `<div class="col-lg-12">
    <div class="blog-post">
        <div class="blog-thumb">
            <img src="${data.img}" alt="">
        </div>
        <div class="down-content">
            <span>Academic</span>
            <a href="post.jsp?postid=${data.id}"><h4>${data.title}</h4></a>
            <ul class="post-info">
                <li><a href="">${data.user.name}</a></li>
                <li><a href="">${data.date}</a></li>
                <li><a href="post.jsp?postid=${data.id}">${data.comments} Comments</a></li>
            </ul>
            <p>${data.content}
            </p>
            <div class="post-options">
                <div class="row">
                    <div class="col-6">
                        <ul class="post-tags">
                            <li><i class="fa fa-tags"></i></li>
                            <li>${data.category}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>`
    $(".post-contents").append(str)
}

function loadMessages(count, ctg, sucCallback, failCallback) {
    $.ajax({
        type: "GET",
        url: "/ee417-groupD/Post",
        dataType: "json",
        data: {
            last_id: lastId,
            count: count,
            category: ctg || -1,
        },
        success: (res) => {
            console.log(res)
            if (res) {
                lastId = res.lastId
                for (let i = 0; i < res.posts.length; i++) {
                    const data = {
                        id: res.posts[i].id,
                        img: res.posts[i].attachedContent[0] ? "data:image/jpeg;base64," + res.posts[i].attachedContent[0] : "",
                        title: res.posts[i].title,
                        content: res.posts[i].message.length > MAX_PREVIEW_CONTENT_LENGTH ?
                                    res.posts[i].message.substring(0, MAX_PREVIEW_CONTENT_LENGTH) + "..." : res.posts[i].message,
                        comments: res.posts[i].comments,
                        date: res.posts[i].date,
                        user: res.posts[i].user,
                        category: res.posts[i].category.title// use the id to make a link to the category's page?
                    }
                    showMessage(data)
                    message_map.set(data.title, data)
                }
            }
            if (sucCallback) {
                sucCallback(res.posts)
            }
        },
        error: (err) => {
            console.error(err)
            if (failCallback) {
                failCallback()
            }
        }
    })
}

function loadAllMessages(ctg) {
    let cur_request_times = 0

    function recursiveLoading() {
        loadMessages(COUNT_PER_PAGE, ctg, (posts) => {
            // prevent server-side err
            cur_request_times++
            if (cur_request_times >= MAX_REQUEST_TIMES) {
                return
            }
            if (posts.length > 0) {
                setTimeout(() => {
                    recursiveLoading()
                }, LOAD_INTERVAL_TIME)
            }
        })
    }

    // load single page data every specific time
    recursiveLoading()
}

function addViewAllBtnListener() {
    $("#view_all_btn").click(function() {
        isClickViewAll = true
        $(".main-button").hide()

        loadAllMessages(-1)
    })
}

function addSearchListener() {
    $("#search_by_title").bind("input propertychange", function() {
        // console.log($("#search_by_title").val())
        if (!cur_message_str) {
            cur_message_str = $(".post-contents").html()
        }
        const val = $("#search_by_title").val()
        const searchRes = _fuzzyQuery([...message_map.keys()], val)
        console.log(searchRes)
        
        $(".post-contents").empty()
        if (searchRes.length == 0) {
            $(".post-contents").html(cur_message_str)
            cur_message_str = ""
            if (!isClickViewAll) {
                $(".main-button").show()
            }
        } else {
            $(".main-button").hide()
            for (let i = 0; i < searchRes.length; i++) {
                showMessage(message_map.get(searchRes[i]))
            }
        }
    });
}

function _fuzzyQuery(list, keyword) {
    if (keyword == "") {
        return []
    }
    const reg = new RegExp(keyword)
    const arr = []
    for (let i = 0; i < list.length; i++) {
        if (reg.test(list[i])) {
            arr.push(list[i])
        }
    }
    return arr
}

function _getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

function init() {
    const category = _getQueryVariable("category")
    if (category) {
        $(".main-button").css('visibility','hidden')
        loadAllMessages(category)
    } else {
        loadMessages(COUNT_PER_PAGE, -1)   
    }
    addViewAllBtnListener()
    addSearchListener()
}

$(function() {
    init()
})
