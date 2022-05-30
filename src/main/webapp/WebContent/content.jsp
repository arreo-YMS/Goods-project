<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
	<title>일정관리</title>
	<script language="JavaScript">
	<!--
		function send(form)
		{
			form.submit();
		}
		function send1(no)
		{
			ans=confirm("本当に削除しますか?");
			if(ans==true)
			{
				location.href="del.jsp?no="+no
			}
			else
			{
				return false;
			}
		}
	-->
	</script>
</head>

<body>
<%
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	String no=request.getParameter("no");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb" ;
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "11111111");

	Statement stmt=conn.createStatement();

	String strSQL="SELECT * FROM calendar WHERE no="+no;
	ResultSet rs=stmt.executeQuery(strSQL);

	rs.next();
%>

<center><font size='5'>
<p><b><%=year %>年 <%=month %>月 <%=day %>日 日程内容</b></font></p>

<table border='0' width='800' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1' noshade>
		</td>
	</tr>
</table>
<br>

<form name='calendar1' method='post' action='edit.jsp?&year=<%=year %>&month=<%=month %>&day=<%=day %>&no=<%=no %>'>
<table border='1' width='800' cellpadding='0' cellspacing='0'>
	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<input type='hidden' name='cp_type' value='input'>
		<font size='2'><b>タイトル</b></font>
		</td>
		<td bgcolor='ededed'>
		<font size='2'><b><%=rs.getString("title")%>
		</td>
	</tr>

	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<font size='2'><b>日付</b></font>
		</td>
		<td bgcolor='ededed'>
		<font size='2'>
		<b><%=year %>年 <%=month %>月 <%=day %>日</b></font>
		</td>
	</tr>

	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<font size='2'><b>時間</b></font>
		</td>
		<td bgcolor='ededed'>
		<font size='2'><b><%=rs.getString("s_time")%>▶<%=rs.getString("e_time")%>
		</td>
	</tr>

	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<font size='2'><b>場所</b></font>
		</td>
		<td bgcolor='ededed'>
		<font size='2'><b><%=rs.getString("position")%>
		</td>
	</tr>

	<tr>
		<td height='118' bgcolor='cccccc'><p align='center'>
		<font size='2'><b>内容</b></font>
		</td>
		<td height='118' bgcolor='ededed'><p>
		<font size='2'><b><%=rs.getString("content")%>
		</td>
	</tr>
</table>
<br>

<table border='0' cellpadding='0' cellspacing='0' width='800'>
	<tr>
		<td height='40' colspan='2'><p align='center'>
		<input type='button' value='日程修正 ' onclick='send(this.form)'>
		<input type='button' value='日程削除' onclick="send1('<%=no %>')">
		<input type='reset' value='戻す' onclick="javascript:history.back()">
		</td>
	</tr>
</table>
</form>
<%
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>