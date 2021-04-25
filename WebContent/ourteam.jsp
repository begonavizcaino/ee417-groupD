<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB</title>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/singlepost.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    <script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
</head>
<body >

	<%@ include file="menubar.jsp" %>

  <!-- ******************************************************************************************* -->
    <!-- Meet Our Team Start-->

    <div class="wrapper row3 coloured">
        <section class="hoc container clear team-block" > 
            <div class="sectiontitle center">
                    <h3 class="heading">Meet Our Team</h3>
            </div>
            <div class="one_quarter first team-member" >
                <div class="team-member__pic">
                    <img src="images/BegoVizcaino.JPG"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Bego Vizcaino
                        <span>Project Manager</span>
                    </p>
                    <p> I am a masters student from Spain, currently specializing in Image Processing at DCU.</p> 
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/CJ_pic_1.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Colum Jones
                        <span>Project Documentation</span>
                    </p>
                    <p> A Masters level student in Computing & Engineering at DCU.</p> 
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/Etienne.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Etienne Desrousseaux
                        <span>Database designer & Backend developer</span>
                    </p>
                    <p>I am an engineering student pursuing a degree in data science at ECE Paris. I am currently studying at DCU for an exchange semester. I also co-founded the startup Home-Viewer, of which I am acting CTO.
                    </p>
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/Jainam.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Jainam Sheth
                        <span>Frontend developer</span>
                    </p>
                    <p>Currently pursuing a masters degree at DCU with a major in Advanced Data Networks.</p>
                </div>
            </div>

        </section>
    </div>

    <!-- Repeat  -->

    <div class="wrapper row3 coloured">
        <section class="hoc container clear team-block" > 
            <div class="one_quarter first team-member" >
                <div class="team-member__pic">
                    <img src="images/Jiahuan.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Jiahuan Zou
                        <span>Javascript developer</span>
                    </p>
                    <p> Comes from China and majored in ECE at DCU now. Also a game developer.</p>
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/Ayman.JPG"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Ayman Hamad
                        <span>Frontend developer</span>
                    </p>
                    <p>Master level student in Computing & Engineering at DCU, currently working as Technical Solution Maer specialized in mobile broadband and wireless technologies  solutions.
                    </p>
                </div>
            </div>

        </section>
    </div>

      
    <!-- Meet Our Team End-->
  <!-- ******************************************************************************************* -->

	<%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="script/main.js" type="text/javascript"></script>


    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>