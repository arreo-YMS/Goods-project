<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
   String price = request.getParameter("sum");
String list = request.getParameter("list");
String num = request.getParameter("amount");
//out.print(list+" + ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<style>
@font-face {
  font-family: 'SDSamliphopangche_Outline';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
a{text-decoration: none;}
li{list-style: none;}

#container{
   width: 1800px; margin: 0 auto;
}
header{width:100%; margin: 0 auto; height: 300px; background-color: white;}

#logo{width: 100%; height:100px; background-color: pink;}
#logo h1{font-size: 80px; line-height: 100px; color: white; font-family: SDSamliphopangche_Outline;}
.topmenu{
  width: 700px;
  margin-top: 70px;
  font-family: 'SDSamliphopangche_Outline';
  background-color: #FFDDDD;
  height: 50px;
  float: center;
   padding-left:130px;
}
.topmenu > ul > li{
color: black;
margin-right: 50px;
padding-top: 20px;
}
.topmenu_li{float: left; margin-left: 60px;}
.twicezine{
width:1500px;
height:600px;
}
.product_price{
width:1500px;
height:800px;
}
table.group {
border-collapse: separate;
border-spacing: 0;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 1px solid #ccc;
margin : 20px 10px;
margin-left: auto;
margin-right: auto;
margin-top: 100px;
      
    }
table.group th {
      width: 150px;
      padding: 10px;
      font-weight: bold;
      vertical-align: center;
      border-right: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
      border-top: 1px solid #fff;
      border-left: 1px solid #fff;
      background: #EEE;
      color:BLACK;
      height:100px;
     
      
  }
  table.group td {
      width: 350px;
      padding: 10px;
      vertical-align: center;
      border-right: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
  }
</style>
</head>
<body>
<div id="container">
   <header>
     <div id="logo">
       <a href="../goods/member_page.jsp">
       <h1><center>- IDALL -</center></h1>
       </a>
     </div>
          
       <center><div class="topmenu">
         <ul>
           <li class="topmenu_li" style="margin-left: 30px;"><a href="../search.html">SEARCH</a></li>
           <li class="topmenu_li"><a href="../notice/listboard.jsp">NOTICE</a></li>
           <li class="topmenu_li"><a href="../Main.html">로그아웃</a></li>
         </ul>
       </div></center>
          
     </header>
     <div id="twicezine">
        <center><img src="../resources/images/트와이스앨범2.jpeg" alt="펌금" width="600px"></center>
      
   </div>
         
   <div id="product_price">
         
      <form method="post" action="sell.jsp">
      <table class="group" align="center" border=1>
      <tr>
      <td> 상품 이름 </td>
      		<input type="hidden" name="num" value=<%=num %>>
      <td><input type="text" name ="album" size="10" value='<%=list %>'></td>
      </tr>
      <tr>
      <td> 이름  </td>
      <td><input type="text" name ="name" size="10"></td>
      </tr>
      <tr> 
      <td> 전화번호 </td>
      <td> <input type="text" name ="phone" size="20" placeholder="'-'없이 입력해주세요"></td>
      </tr>
      <tr>
      <td> 주소 </td>
      <td><input type="text" name='postcode' id="postcode" placeholder="우편번호">
      <input type="button" onclick="execDaumPostcode()" value="주소찾기"style="width: 50pt;  height: 20pt;  background-color: #EEE; border-color: white;"><br>
            <input type="text" size="40" id="roadAddress" name='roadAddress' placeholder="도로명주소" ><br><input type="text" size="40" id="jibunAddress" name='jibunAddress' placeholder="지번주소"></td>
       </tr>      
       <tr>
       <td> 상품가격 </td>
       <td><input type="text" name="price" value="<%=price%>원" size="10" readonly></td>
       </tr>
       <tr>
       <td><button type="reset" value="" onclick="history.back()">취소하기</td>
       <td ><button type="submit" onclick="sell.jsp">구매하기</td>
       </tr>
   </table>
   </form>
   </div>

<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
        }
    }).open();
}


</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</div>
</body>
</html>