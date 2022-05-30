<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<% 
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mydb" ;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "11111111");

Statement stmt = conn.createStatement();

String strSQL = "DELETE FROM calendar WHERE no = " +
		 request.getParameter("no");
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("cal.jsp");
%>