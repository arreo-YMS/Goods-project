<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%

String num = request.getParameter("num");
String pass = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/kmove";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");

PreparedStatement pstmt = null;
ResultSet rs=null;

String strSQL="SELECT pass FROM kmb WHERE num=?";

pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1,Integer.parseInt(num));

rs=pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if(pass.equals(goodpass)){
	strSQL="DELETE From kmb WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1,Integer.parseInt(num));
	pstmt.executeUpdate();
	strSQL="DELETE FROM kmd WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1,Integer.parseInt(num));
	pstmt.executeUpdate();
	String strSQL1="SET @num = 0;";
	pstmt = conn.prepareStatement(strSQL1);
	pstmt.executeUpdate();
	String strSQL2="UPDATE kmb SET kmb.num= @num:=@num+1";
	pstmt = conn.prepareStatement(strSQL2);
	pstmt.executeUpdate();
	strSQL="ALTER table kmb auto_increment = 1"; // 삭제 해도 값이 늘어나지 않음 ㅇㅇ 
	pstmt = conn.prepareStatement(strSQL);
	pstmt.executeUpdate();
	
	response.sendRedirect("listboard.jsp");
}else{
	response.sendRedirect("delete_pass.jsp?num="+num);}

rs.close();
pstmt.close();
conn.close();
%>