<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%
 	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String postcode = request.getParameter("postcode");
	String roadAddress = request.getParameter("roadAddress");
	String jibunAddress = request.getParameter("jibunAddress");
	String price = request.getParameter("price");
	String product = request.getParameter("album");
	String count = request.getParameter("num");
	String album = "트와이스앨범";
	
	String driverName = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/kmove";

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
		Statement stmt = conn.createStatement();


		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
	
		Calendar dateIn = Calendar.getInstance();
	
		String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
		indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + "-";
		indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":" ;
		indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
		indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	String strSQL = "INSERT INTO kmg(name,phone,postcode,roadAddress,jibunAddress,product,price,writedate)";
	strSQL = strSQL + "VALUES(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(strSQL);
	
		pstmt.setString(1,name);
		pstmt.setString(2,phone);
		pstmt.setString(3,postcode);
		pstmt.setString(4,roadAddress);
		pstmt.setString(5,jibunAddress);
		pstmt.setString(6,product);
		pstmt.setString(7,price);
		pstmt.setString(8,indate);
		pstmt.executeUpdate();
	
		
	String strSQL1 = "UPDATE kms SET count=count-? WHERE name = ?";
		pstmt1 = conn.prepareStatement(strSQL1);
		pstmt1.setInt(1, Integer.parseInt(count));
		pstmt1.setString(2, album);
		pstmt1.executeUpdate();

	
	response.sendRedirect("buy.jsp");
	
 %>
