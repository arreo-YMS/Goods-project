<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>日程管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type='text/css'>
	<!--
		a:link	{font-family:"";color:black;text-decoration:none;}
		a:visited	{font-family:"";color:black;text-decoration:none;}
		a:hover	{font-family:"";color:black;text-decoration:none;}
	-->
	</style>
</head>

<body>
<%
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
%>

<p><center><font size='5'><b>日程登録</b></font></p>

<table border='0' width='800' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1' noshade>
		</td>
	</tr>
</table>
<br>

<form name='calendar1' method='post' action='write_ok.jsp?&year=<%=year %>&month=<%=month %>&day=<%=day %>'>

<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr>
		<td align='center' width='100' height='30' bgcolor='cccccc'>
		<input type='hidden' name='cp_type' value='input'>
		<font size='2'><b>タイトル</b></font></td>
		<td bgcolor='ededed'>
		<input type='text' name='title' maxlengtg='20' size='38'>
		</td>
	</tr>

	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<font size='2'><b>場所</b></font></td>
		<td bgcolor='ededed'>
		<input type='text' name='position' maxlength='40' size='38'>
		</td>
	</tr>

	<tr>
		<td bgcolor='cccccc' width='100' height='30'><p align='center'>
		<font size='2'><b>日付</b></font>
		</td>
		<td bgcolor='ededed'>
		<font size='2'><b><%=year %>年 <%=month %>月 <%=day %>日</b></font>
		</td>
	</tr>

	<tr>
		<td height='35' bgcolor='cccccc'><p align="center">
		<font size='2'><b>時間</b></font>
		</td>
		<td bgcolor='ededed'>
		<select name='s_hour'>
			<option value='0'>0時</option>
			<option value='1'>1時</option>
			<option value='2'>2時</option>
			<option value='3'>3時</option>
			<option value='4'>4時</option>
			<option value='5'>5時</option>
			<option value='6'>6時</option>
			<option value='7'>7時</option>
			<option value='8'>8時</option>
			<option value='9'>9時</option>
			<option value='10'>10時</option>
			<option value='11'>11時</option>
			<option value='12'>12時</option>
			<option value='13'>13時</option>
			<option value='14'>14時</option>
			<option value='15'>15時</option>
			<option value='16'>16時</option>
			<option value='17'>17時</option>
			<option value='18'>18時</option>
			<option value='19'>19時</option>
			<option value='20'>20時</option>
			<option value='21'>21時</option>
			<option value='22'>22時</option>
			<option value='23'>23時</option></select>

		<select name='s_minute'>
			<option selected value='00'>00</option>
			<option value='05'>05</option>
			<option value='10'>10</option>
			<option value='15'>15</option>
			<option value='20'>20</option>
			<option value='25'>25</option>
			<option value='30'>30</option>
			<option value='35'>35</option>
			<option value='40'>40</option>
			<option value='45'>45</option>
			<option value='50'>50</option>
			<option value='55'>55</option></select>▶

		<select name='s_hour1'>
			<option value='0'>0時</option>
			<option value='1'>1時</option>
			<option value='2'>2時</option>
			<option value='3'>3時</option>
			<option value='4'>4時</option>
			<option value='5'>5時</option>
			<option value='6'>6時</option>
			<option value='7'>7時</option>
			<option value='8'>8時</option>
			<option value='9'>9時</option>
			<option value='10'>10時</option>
			<option value='11'>11時</option>
			<option value='12'>12時</option>
			<option value='13'>13時</option>
			<option value='14'>14時</option>
			<option value='15'>15時</option>
			<option value='16'>16時</option>
			<option value='17'>17時</option>
			<option value='18'>18時</option>
			<option value='19'>19時</option>
			<option value='20'>20時</option>
			<option value='21'>21時</option>
			<option value='22'>22時</option>
			<option value='23'>23時</option></select>

		<select name='s_minute1'>
			<option selected value='00'>00</option>
			<option value='05'>05</option>
			<option value='10'>10</option>
			<option value='15'>15</option>
			<option value='20'>20</option>
			<option value='25'>25</option>
			<option value='30'>30</option>
			<option value='35'>35</option>
			<option value='40'>40</option>
			<option value='45'>45</option>
			<option value='50'>50</option>
			<option value='55'>55</option></select>
		</td>
	</tr>

	<tr>
		<td height='118' bgcolor='cccccc'><p align='center'>
		<font size='2'><b>内容</b></font>
		</td>
		<td height='118' bgcolor='ededed'>
		<textarea name='content' rows='5' cols='70'></textarea>
		</td>
	</tr>
</table>
<br>
<table border='0' cellpadding='0' cellspacing='0' width='800'>
	<tr>
		<td height='40' colspan='2'><p align='center'>
		<input type = 'submit' value='日程登録'>
		<input type='reset' value='キャンセル'>
		</td>
	</tr>
</table>
</form>

<script language="JavaScript">
<!--
	function send(form)
	{
	}
-->
</script>
</body>
</html>