<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 

String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/kmove";

    Class.forName(driverName);
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
    Statement stmt = conn.createStatement();


PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM kmb WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
    response.sendRedirect("modify.jsp?num=" + num);
}else{
    response.sendRedirect("modify_pass.jsp?num=" + num);    
}

rs.close();
pstmt.close();
conn.close();
%>