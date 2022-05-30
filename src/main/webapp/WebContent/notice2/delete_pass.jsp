<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<HTML>
<HEAD>
<title>게시판 삭제</title>
<meta http-equiv='Content-Type' content='text/html' charset=utf-8">
<style type='text/css'>
<!--
   a:link       {font-family:"";color:black;text-decoration:none;}
   a:visited    {font-family:"";color:black;text-decoration:none;}
   a:hover    {font-family:"";color:black;text-decoration:none;}
-->
</style>
</HEAD>
<BODY>
<%
	String num = request.getParameter("num");
%>

<center><font size='3'><b>비밀번호 확인</b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size = '1' noshade></TD>
   </TR>
</TABLE>

<form action='delete_input.jsp' method='post'>
<input type='hidden' name = 'num' value ='<%=num%>'>
<TABLE border='0' width='300' align='center'>
   <TR>
      <TD align='center'><font size='2'><b>비밀번호</b></font></TD>
      <TD>
         <input type='password' name='pass' size=20 maxlength=20>
         <input type='submit' value='확인' style=background-color:cccccc; font-weight:border'>
      </TD>
   </TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <tr>
      <td><hr size='1' noshade></td>
   </tr>
</TABLE>
<a href='listboard.jsp'>[목록보기]</a>
</form>
</center>
</BODY>
</HTML>
</body>
</html>