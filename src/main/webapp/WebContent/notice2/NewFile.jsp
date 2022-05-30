<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
   String num = request.getParameter("num");
   String pass = request.getParameter("pass");
   out.print(num);
   
   /*오라클 */ /* 
   Class.forName("oracle.jdbc.driver.OracleDriver");
   String url = "jdbc:oracle:thin:@localhost:1521:XE";
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","scott","nsu");
   */
   

%>