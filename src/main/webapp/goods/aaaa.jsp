<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
	
	<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 재고 입력 </title>
</head>
<body onload="init();">
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

<font size='2'>트와이스 앨범 수량 :</font><input type="text" size="10" value=' <%=count %> 개' readonly></font>
<form name="form" method="post" action="aaab.jsp">
입고 : <input type="text" name="amount" value="1" size="3" style="height:30px;"> 
<input type="button" value="+" onclick="add();"><input type="button" value="-" onclick="del();">
<button type="submit" onclick="location.href='aaab.jsp';">입력</button>
</form>

<button type="summit" onclick="history.back()">뒤로가기</button>
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