
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

	<% request.setCharacterEncoding("utf-8"); 
	
	String sum = request.getParameter("amount");
	String name = "트와이스앨범";


	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/kmove";
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String strSQL = "update kms set count=? where name = ?";
	
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(sum));
	pstmt.setString(2, name);
	pstmt.executeUpdate();

	response.sendRedirect("aaaa.jsp");

%>
