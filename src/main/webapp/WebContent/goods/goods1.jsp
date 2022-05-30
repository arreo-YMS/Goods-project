<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/kmove";
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
   
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String strSQL = "SELECT * FROM kms ";
   pstmt = conn.prepareStatement(strSQL);
   
   rs = pstmt.executeQuery();
   rs.next();
   
   int count = rs.getInt("count");

%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트와이스 앨범 </title>

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
header{width: 1800px; margin: 0 auto; height: 250px; background-color: white;}

#logo{width: 100%; height:100px; background-color: pink;}
#logo h1{font-size: 80px; line-height: 100px; color: white; font-family: SDSamliphopangche_Outline;}

#content{
width:100%;
height:600px;
margin-top :100px;
}
#content img {
float : right;
margin-right: 100px;
}
#content1{
width:50%;
height:600px;
float: left;
}
#content2{
width:50%;
height:550px;
float: right;
font-size : 32px;
padding-top: 50px;
}
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
margin-right: 60px;
padding-top: 20px;
}
.topmenu_li{float: left; margin-left: 60px;}

.picture{
width:100%;

}


</style>

</head>
<body onload="init();">
<div id="container">
     <header>
          <div id="logo">
               <a href="../member_page.jsp">
               <h1><center>- IDALL -</center></h1>
               </a>
          </div>
          
                <center><div class="topmenu">
                    <ul>
                        <li class="topmenu_li" style="margin-left: 30px;"><a href="../search.html">SEARCH</a></li>
                        <li class="topmenu_li"><a href="../notice/listboard.jsp">NOTICE</a></li>
                        <li class="topmenu_li"><a href="../logout.jsp">로그아웃</a></li>
                    </ul>
                </div></center>
          
     </header>
    <div id="content">
      
      <div id="content1">
         <img src="../images/트와이스앨범2.jpeg" alt="펌금" width="500px" height="500px">
      
      </div>
         
      <div id="content2">
         <form name="form" method="post" action="goodspage.jsp">
            <table>
            <tr>
               <td><input type ="hidden" name="list" value="트와이스 앨범">트와이스 앨범</td>
            </tr>
            </table>
            <hr style="width: 600px; float:left"> <br>
            <table>
            <tr>      
               <td style="padding-bottom:5px;"><input type="hidden" name='sell_price' value="23000">
                수량 : <input type="text" name="amount" value="1" size="3" style="height:30px;"> 
               <input type="button" value="+" onclick="add();"><input type="button" value="-" onclick="del();"></td>
            </tr>
            <tr>
               <input type="hidden" name="count" value='<%=count %>'>
               <% if(count <= 5) { %>
               
               <td><font size='6' color="red"> 재고량 :</font><%=count %>개<font size='6' color="red"> 남았습니다! </font>
            
               <% } %>
            </td>
            </table>
            <hr style="width: 600px; float:left"> <br>
            <table>
            <tr>
               <td><input type="text" name="sum" size="11" readonly style="height:30px;"> 원</td>
            </tr>
            </table>
            <hr style="width: 600px; float:left"> <br>
            <table>
            <tr>
               <td>배송비 무료</td>
            </tr>
         </table>
         <br>
         <% if (count == 0) { %> 
         <p> 구매 불가 </p>
         <% } else { %>         
         <button type="submit"style="width: 200pt;  height: 30pt;  
         background-color: #FFC4EB; color: white; border-color: white;" >구매</button>
         <% } %>

      </div>
   </div>
            <hr>
   <br>
   <div id="picture">
   <center><img src="../images/무료증정.jpeg" alt="사진"></center>
   
   </div>

</div>
<script language="JavaScript">
var sell_price;
var amount;


function init() {
   sell_price = document.form.sell_price.value;
   amount = document.form.amount.value;
   document.form.sum.value = sell_price;
   change();
}

function add() {
   hm = document.form.amount;
   sum = document.form.sum;
   hm.value++;
   sum.value = parseInt(hm.value) * sell_price;
}
function del () {
   hm = document.form.amount;
   sum = document.form.sum;
      if (hm.value > 1) {
         hm.value--; 
         sum.value = parseInt(hm.value) * sell_price;
      }
}

function change () {
   hm = document.form.amount; 
   sum = document.form.sum;
      if (hm.value < 0) {
         hm.value = 0;
      }
      sum.value=parseInt(hm.value) * sell_price;
}
</script>
</body>
</html>