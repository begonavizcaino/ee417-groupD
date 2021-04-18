/**
 *  message post
 *  @author jiahuan
 *  @date 21/04/18
 */
let lastId = null

function showMessage(data) {
    const str = `<div class="col-lg-12">
    <div class="blog-post">
        <div class="blog-thumb">
            <img src="${data.img}" alt="">
        </div>
        <div class="down-content">
            <span>Academic</span>
            <a href="post.jsp?postid=2"><h4>${data.title}</h4></a>
            <ul class="post-info">
                <li><a href="#">Admin</a></li>
                <li><a href="#">April 18th, 2021</a></li>
                <li><a href="#">${data.comments} Comments</a></li>
            </ul>
            <p>${data.content}
            </p>
            <div class="post-options">
                <div class="row">
                    <div class="col-6">
                        <ul class="post-tags">
                            <li><i class="fa fa-tags"></i></li>
                            <li><a href="#">Academic</a>,</li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul class="post-share">
                            <li><i class="fa fa-share-alt"></i></li>
                            <li><a href="#">Facebook</a>,</li>
                            <li><a href="#"> Twitter</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>`
    $(".post-contents").append(str)
}

function loadMessages() {
    $.ajax({
        type: "GET",
        url: "/ee417-groupD/Post",
        dataType: "json",
        data: {
            lastId: lastId,
            count: 3,
            category: -1,
        },
        success: (res) => {
            // console.log(res)
            if (res) {
                lastId = res.lastId
                for (let i = 0; i < res.posts.length; i++) {
                    const data = {
                        img: "data:image/jpeg;base64," + res.posts[i].attachedContent[0],
                        title: res.posts[i].title,
                        content: res.posts[i].message,
                        comments: res.posts[i].comments
                    }
                    showMessage(data)
                }
            }
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
