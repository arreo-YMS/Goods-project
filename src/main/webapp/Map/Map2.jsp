<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDALL</title>

<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
<style>
a{text-decoration: none;}
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
  font-family: 'SDSamliphopangche_Outline';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
#container {
   width: 100%;
   margin: 0 auto;
}
header{width: 90%; margin: 0 auto; height: 500px; background-color: white;}

#logo{width: 100%; height:100px; background-color: pink; }
#logo h1{font-size: 80px; line-height: 100px; color: white; font-family: SDSamliphopangche_Outline;}




#map_title{
   width: 100%;
   height: 200px;
   font-family: 'NEXON Lv1 Gothic OTF';
   font-size: xx-large;
   color: #0040FF;
   background-color: #F2F2F2;
}
#silde{
   width: 100%
   height:600px;
   

}



#map_content {
   width: 100%;
   height: 300px;
   
}
#map_content1 {
   
   width:50%;
   height:300px;
   float: left;
   
}

#map_content2 {
   float: right;
   width:50%;
   height:300px;
}

.address{
  margin-left: 330px;
  


}



.w {
   width: 300px;
   border: solid 1px #2faeff;
   float: center;
   
   
   
}
.w2{
    width:300px;
   border: solid 1px #2faeff;
   float:left;

}


.w1 {
   bottom: 10;
   border: solid 1px #2faeff;
}

</style>
</head>
<body>
 <div id="container">
    <header>
     <div id="logo" style="background-color: #B2EBF4;">
      <a href="../member/member_page.jsp">
        <h1><center>- IDALL -</center></h1></a>
     </div>
    <div id="map_title">
      <h1>COMPANY</h1> 
      <h2 style="color: gray; opacity: 0.5;">CONTACT US</h2>
   </div>
   </header>
      
   <div id="slide">
      <center><div id="map" style="width:1000px; height:600px; margin-bottom:100px;"></div></center>
      <br><br>
   </div>
   <div id="map_content" style="font-size: 1em; display:inline;">
      
      <hr>
      <div id="map_content1">
         <br><br>
         <p class="address">Address</p>
         <hr class="w">
         <br>
         <p class="address">충청남도 천안시 서북구 성환읍 대학로 91 인문사회학관 5층</p>
         <p class="address">忠清南道天安市西北区成歓邑大学路91 人文社会学館5階</p>
         <p class="address"> 우편번호 31020 </p>
      </div>
      <div id="map_content2">
      <br><br>
         <p>Tell</p>
         <hr class="w2">
         
      <br>
         <p>041-3682-8928</p>
      
      </div>
   </div>
</div>
        
   
   
   


   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8d4588e233115ed0b324e97d4c11b37"></script>
   <script>
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
         center: new kakao.maps.LatLng(36.9092490, 127.1452133),
         level: 3 
      };

      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   </script>


</body>
</html>