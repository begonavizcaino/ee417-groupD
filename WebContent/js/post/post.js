/**
 *  message post
 *  @author jiahuan
 *  @date 21/04/18
 */

const COUNT_PER_PAGE = 3

const LOAD_INTERVAL_TIME = 100

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
                <li>Admin</li>
                <li>April 18th, 2021</li>
                <li>${data.comments} Comments</li>
            </ul>
            <p>${data.content}
            </p>
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
                        img: res.posts[i].attachedContent[0],
                        title: res.posts[i].title,
                        content: res.posts[i].message,
                        comments: res.posts[i].comments
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

function addViewAllBtnListener() {
    $(".main-button").show()
    $("#view_all_btn").click(function() {
        isClickViewAll = true
        $(".main-button").hide()

        // load single page data every specific time
        const handler = setInterval(() => {
            loadMessages(COUNT_PER_PAGE, -1, (posts) => {
                if (!posts || posts.length <= 0) {
                    clearInterval(handler)
                }
            })
        }, LOAD_INTERVAL_TIME);
    })
}

function showSidebarConetent(data) {
    const str = `
    <li><a href="post.jsp?postid=${data.id}">
        <h5>${data.title}</h5>
        <span>April 18, 2021</span>
    </a></li>
    `
    $(".siderbar-content-ul").append(str)
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

function init() {
    loadMessages(COUNT_PER_PAGE, -1/*, (posts) => {
        // show siderbar with latest data of count_per_page
        for (let i = 0; i < posts.length; i++) {
            showSidebarConetent(posts[i])
        }// moved this part to server side to be consistent on all pages
    }*/)   
    addViewAllBtnListener()
    addSearchListener()
}

$(function() {
    init()
})
