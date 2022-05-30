<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	String s_time=request.getParameter("s_hour")+":"+request.getParameter("s_minute");
	String e_time=request.getParameter("s_hour1")+":"+request.getParameter("s_minute1");
	String title=request.getParameter("title");
	String position=request.getParameter("position");
	String content=request.getParameter("content");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb" ;
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "11111111");

	Statement stmt=conn.createStatement();
	int no_plus = 0;
	String strSQL2 = "SELECT no FROM calendar order by no DESC";
	ResultSet rs1 = stmt.executeQuery(strSQL2);
	
	
	if(rs1.next()){
		strSQL2 = "SELECT Max(no) FROM calendar";
		rs1 = stmt.executeQuery(strSQL2);
		rs1.next();
		no_plus = rs1.getInt(1) + 1;
		}
	
	String strSQL="INSERT INTO calendar(no,year,month,day,title,s_time,e_time,position,content) VALUES('";
			strSQL=strSQL+no_plus+"','";
			strSQL=strSQL+year+"','";
			strSQL=strSQL+month+"','";
			strSQL=strSQL+day+"','";
			strSQL=strSQL+title+"','";
			strSQL=strSQL+s_time+"','";
			strSQL=strSQL+e_time+"','";
			strSQL=strSQL+position+"','";
			strSQL=strSQL+content+"')";

			stmt.executeUpdate(strSQL);

	stmt.close();
	conn.close();

	int imonth=Integer.parseInt(month);

	response.sendRedirect("cal.jsp?year="+year+"&month="+(imonth-1));
%>