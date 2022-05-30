<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password"); 
	String name = request.getParameter("name");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String phone = request.getParameter("phone");
	String postcode = request.getParameter("postcode");
	String roadAddress = request.getParameter("roadAddress");
	String jibunAddress = request.getParameter("jibunAddress");
	String mail = request.getParameter("mail");

	String check_ok = "yes";  
	if (id == "")                 
		check_ok = "no";    
	if (password == "")             
		check_ok = "no";     
	if (name == "")             
		check_ok = "no";      
	if (jumin1 == "")
		check_ok = "no";
	if (jumin2 == "")
		check_ok="no";
	if (phone == "")
		check_ok = "no";
	
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/kmove";
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT id FROM km where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	if (!rs.next())           
		check_ok="yes";   
	else                    
		check_ok="no";    
	
	if (check_ok == "yes"){
		strSQL = "INSERT INTO km(id,pass,name,jumin1,jumin2,phone,postcode,roadAddress,jibunAddress,mail)";
		strSQL = strSQL +  "VALUES('" + id + "', '" + password + "', '" + 
	            name + "', '" + jumin1 + "',";
		strSQL = strSQL +  "'" + jumin2 + "', ";	            
	        strSQL = strSQL + "'" + phone + "', '" + postcode + "', '" +roadAddress +"', '" +jibunAddress +"', '" + mail +"')";
		
		stmt.executeUpdate(strSQL);
	}
	response.sendRedirect("../member/loginchang.jsp"); 
%>