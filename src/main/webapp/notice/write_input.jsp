<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%

String name = request.getParameter("name");
String pass= request.getParameter("pass");
String title= request.getParameter("title");
String contents= request.getParameter("contents");
int num = 1;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/kmove" ;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
/*
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:XE";
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","scott","nsu");*/
	PreparedStatement pstmt = null;
	
	Calendar dateIn = Calendar.getInstance();
	
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":" ;
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	String strSQL = "INSERT INTO kmb(name,pass,title,contents,writedate,readcount)";
	strSQL =strSQL + "VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(strSQL);
	
	pstmt.setString(1,name);
	pstmt.setString(2,pass);
	pstmt.setString(3,title);
	pstmt.setString(4,contents);
	pstmt.setString(5,indate);
	pstmt.setInt(6,0);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("listboard.jsp");
%>