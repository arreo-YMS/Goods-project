<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
out.print(id);
//3. joinIdCheck(ID)메서드
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/kmove" ;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");



String strSQL ="SELECT id FROM km";
PreparedStatement pstmt = null;
pstmt = conn.prepareStatement(strSQL);
ResultSet rs=pstmt.executeQuery();
String goodid = "";
int a = 0;

while(rs.next()) {
   goodid = rs.getString("id");
   if (id.equals(goodid)){
         out.print("<script>alert('このIDは使用できません。');history.back();</script>");
         a++;
         break;
      }
}
   if(a ==0){
      //out.print("<script>alert('使用可能です。');history.back();</script>");
	   response.sendRedirect("member.jsp?okid="+id+"&check="+(a+1));
   }

%>