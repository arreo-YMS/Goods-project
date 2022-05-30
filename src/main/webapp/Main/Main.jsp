<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IDALL</title>
    <link rel="stylesheet" href="../resources/css/Main.css">
    <style>
    @font-face {
  font-family: 'SDSamliphopangche_Outline';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
.box {
  flex: 1;
  overflow: hidden;
  transition: .5s;
  margin: 0 2%;
  box-shadow: 0 20px 30px rgba(0,0,0,.1);
  line-height: 0;
}

.box > img {
  width: 30%;
  height: calc(100% - 10vh);
  object-fit: cover; 
  transition: .5s;
}

.box > span {
  font-size: 3.8vh;
  display: block;
  text-align: center;
  height: 10vh;
  line-height: 2.6;
  font-family: 'SDSamliphopangche_Outline';
  color: pink;
}

.box:hover { flex: 1 1 50%; }
.box:hover > img {
  width: 50%;
  height: 5%;
}
</style>
</head>
<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="Main.jsp">
                    <h1><center>- IDALL -</center></h1>
                </a>
            </div>
            <div class="fixbar">
                <nav> 
                    <ul>
                        <br>
                        <li><a href="../goods/loginchang.jsp" class="leftmenu"><h1>GOODS</h1></a></li><br>
                        <li><a href="../Map/Map.jsp" class="leftmenu"><h1>MAP</h1></a></li><br>
                        <li><a href="../member/loginchang.jsp" class="leftmenu"><h1>company</h1></a></li><BR>
                        
                    </ul>
                </nav>
            


            </div>
            <center >
                <div class="topmenu">
                    <ul>
                        <li class="topmenu_li" style="margin-left: 30px;"><a href="../search/search.jsp">SEARCH</a></li>
                        <li class="topmenu_li"><a href="../notice/listboard.jsp">NOTICE</a></li>
                        <li class="topmenu_li"><a href="../member/loginchang.jsp">로그인</a></li>
                    </ul>
                </div>
            </center>
        </header>

        <div id="slideShow">
            <div id="slides">
                <img src="../resources/images/itzy.jpg" alt="">
                <img src="../resources/images/itzy2.jpg" alt="">
                <img src="../resources/images/트와이스.jpg" alt="">
                <img src="../resources/images/트와이스2.jpg" alt="">
                <button id="prev">&lang;</button>
                <button id="next">&rang;</button>
            </div>
         </div>
        
         <center><h1 id="ARTIST">HOT ARTIST</h1></center><br>
         <center><hr width="600" id="LINE"></center>
         
         <div id="p-color">
		<div id="contents">
		                <div class="box">
		        <img onclick="jagascript:location.href='../search/twice.jsp';" style="cursor:pointer;" src="../resources/images/나연.png">
		        <span>TWICE</span>
		      </div>
		      <div class="box">
		        <img src="../resources/images/지수.jpg">
		        <span>ITZY</span>
		      </div>
		      <div class="box">
		        <img src="../resources/images/강혜원.jpg">
		        <span>IZONE</span>
		      </div>
		      <div class="box">
		        <img src="../resources/images/아이유.jpg">
		        <span>IU</span>
		      </div>
		     </div>

            
<!-- 
        <footer style="text-align: center;">
            <br>
            <hr>
            <br>
             <font class="bottom" size=1> 회사소개&nbsp;&nbsp; 인재채용&nbsp;&nbsp; 제휴제안&nbsp;&nbsp; 이용약관&nbsp;&nbsp; 개인정보처리방침</font> <br><br>
             <font size=1>2021 COPYRIGHT @ 常勝CORP. ALL RIGHT RESERVED</font>
                     
        </footer>
 -->
    </div>
    <script src="../resources/JS/Main.js"></script>
</body>
</html>
            