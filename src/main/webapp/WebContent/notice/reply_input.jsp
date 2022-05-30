<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.* " %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1111");
	PreparedStatement pstmt = null; 
	PreparedStatement pstmt1 = null; 
	PreparedStatement pstmt2 = null; 
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	ResultSet rs = null;
	
	String strSQL ="select max(num) from bbs";
	pstmt = conn.prepareStatement(strSQL);
	rs = pstmt.executeQuery();
	rs.next();
	
	int max = rs.getInt("max(num)");

	for(int i =max; i!=num; i--){
		strSQL = "UPDATE BBS SET num = num + 1 WHERE num = "+i;
		pstmt1 = conn.prepareStatement(strSQL);
		pstmt1.executeUpdate();
	}
	pstmt1.close();
	
	Calendar dateln = Calendar.getInstance(); 
	String indate = Integer.toString(dateln.get(Calendar.YEAR)) +"-";
	indate = indate + Integer.toString(dateln.get(Calendar.MONTH)+1)+"-";
	indate = indate + Integer.toString(dateln.get(Calendar.DATE)) + " "; 
	indate = indate + Integer.toString(dateln.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateln.get(Calendar.SECOND));
	
	strSQL = "INSERT INTO BBS(num,name,pass,email,title,contents,writedate,readcout)";
	strSQL =strSQL + "VALUES(?,?,?,?,?,?,?,?)";
	pstmt2 = conn.prepareStatement(strSQL);
	
	pstmt2.setInt(1,(num+1));
	pstmt2.setString(2,name);
	pstmt2.setString(3,pass);
	pstmt2.setString(4,email);
	pstmt2.setString(5,title);
	pstmt2.setString(6,contents);
	pstmt2.setString(7,indate);
	pstmt2.setInt(8,0);
	pstmt2.executeUpdate();
	pstmt2.close();
	
	strSQL = "set @count=0";
	pstmt3 = conn.prepareStatement(strSQL);
	pstmt3.close();
	
	strSQL = "UPDATE bbs SET num =@count:=@count+1";
	pstmt4 = conn.prepareStatement(strSQL);
	pstmt4.close();
	
	
	response.sendRedirect("listboard.jsp");
%>
