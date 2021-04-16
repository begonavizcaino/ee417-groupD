<!DOCTYPE html>
<html>
<head>
	<meta charset="uts-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" >
	<meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/chatStyle.css'>	<link rel="stylesheet" type="text/css" href="css/menubar.css">
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
	<script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    <title>ISB Chat</title>
    
</head>
<body>

	<%@ include file="menubar.jsp" %>
    
    <div id="chat-container">
        <div id="search-container">
            <input type="text" placeholder="Search"/>
        </div>
        <!--We can make as many conversation we want be it as to be done dynamicaly-->
        <!--Here is just the form of what it could be like-->
        <div id="conversation-list">
            <div class="conversation active">
                <!--A photo could be placed here-->
                <img src="images/trashLogo.png" alt="testimg"/>
                <div class="title-text">
                    Conversation1
                </div>
                <!--The creation date could be here-->
                <div class="created-date">
                    Apr 5
                </div>
                <div class="conversation-message">
                    This is a message
                </div>
            </div>
            <div class="conversation">
                <!--A photo could be placed here-->
                <img src="images/attachmentLogo.png" alt="testimg"/>
                <div class="title-text">
                    Conversation2
                </div>
                <!--The creation date could be here-->
                <div class="created-date">
                    2 days ago
                </div>
                <div class="conversation-message">
                    This is another message
                </div>
            </div>
        </div>
        <div id="new-message-container">
            <a href="#">+</a>
        </div>
        <div id="chat-title">
            <span>Conversation1_TEST</span>
            <img src="images/trashLogo.png" alt="Delete Conversation" width="36px" height="36px">
        </div>
        <div id="chat-message-list">
            
            <div class="message-row other-message">
                <div class="message-content">
                    <img src="images/trashLogo.png" alt="testimg" width="24px" height="24px"/>
                    <div class="message-text">Tchao I tried something but it des not have a really 
                        sense I am juste writing some bullshit in order to see if it goes well 
                        when I have a big message </div>
                    <div class="message-time">Apr 5</div>
                </div>
            </div>
            <div class="message-row your-message">
                <div class="message-content">
                    <div class="message-text">Ok then</div>
                    <div class="message-time">Apr 5</div>
                </div>
            </div>
        </div>
        <div id="chat-form">
            <img src="images/attachmentLogo.png" alt="Add Attachment" width="32px" height="32px">
            <input type="text" placeholder="Type a message"/>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
</body>