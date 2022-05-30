<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
	<% 
		request.setCharacterEncoding("utf-8"); 
	
		int page_num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("c_name");
		String text = request.getParameter("comment");
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/kmove";
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
		
		PreparedStatement pstmt = null;
		
		Calendar dateIn = Calendar.getInstance();
		
		String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
		indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":" ;
		indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
		indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
		
		String strSQL = "INSERT INTO kmd(num,name,text,date)";
		strSQL =strSQL + "VALUES(?,?,?,?)";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, page_num);
		pstmt.setString(2,name);
		pstmt.setString(3,text);
		pstmt.setString(4,indate);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("write_output.jsp?num="+page_num);
	%>
	
	