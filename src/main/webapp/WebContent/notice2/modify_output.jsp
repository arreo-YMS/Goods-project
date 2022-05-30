<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/kmove" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
	
	PreparedStatement pstmt = null;
	
	Calendar dateln=Calendar.getInstance();

	String indate=Integer.toString(dateln.get(Calendar.YEAR))+"-";
	indate=indate+Integer.toString(dateln.get(Calendar.MONTH)+1)+"-";

	indate=indate+Integer.toString(dateln.get(Calendar.HOUR_OF_DAY))+";";
	indate=indate+Integer.toString(dateln.get(Calendar.MINUTE))+";";
	indate=indate+Integer.toString(dateln.get(Calendar.SECOND));
	
	pstmt = conn.prepareStatement("UPDATE kmb SET name= ? , pass= ? , title= ? , contents= ?, writedate= ? WHERE num= ?");
	pstmt.setString(1,name);
	pstmt.setString(2,pass);
	pstmt.setString(3,title);
	pstmt.setString(4,contents);
	pstmt.setString(5,indate);
	pstmt.setInt(6,num);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("listboard.jsp");
	

%>