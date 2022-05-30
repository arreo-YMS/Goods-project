<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1"> 
		<tr> 
			<td> id </td>
			<td> pw </td>
		</tr>

<%
String driver= "oracle.jdbc.driver.OracleDriver";
String sql = "select * from TEST";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(
   "jdbc:oracle:thin:@localhost:1521:XE","scott","tiger");
PreparedStatement pstmt = null;
pstmt = conn.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
while(rs.next()) {
	   
    String id = rs.getString("ID");
    String pw = rs.getString("PW");
    %>
	<tr> 
		<td><%=id %></td>
		<td><%=pw %></td>
	</tr>
	<%
	}
	%>
	</table>

</body>
</html>