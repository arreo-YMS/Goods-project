<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<script language="Javascript">

function strDate(fzip, fadd) {
	opener.document.Member_Input.zip.value = fzip;
	opener.document.Member_Input.address1.value = fadd;
	opener.document.Member_Input.address2.focus();
	window.close();
}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
</head>
<body>
<form>
<center>
<table border='1'>
<%
String fdong = request.getParameter("fdong");
Class.forName("com.mysql.jdbc.Driver");

try {
	String url = "jdbc:mysql://localhost:3306/jsp" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "0000");
	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT * FROM tblZipCode WHERE 읍면동 like '%"+ 
	fdong + "% '";
	ResultSet rs = stmt.executeQuery(strSQL);

	if(!rs.next()) {
%>
	<TR>
		<TD align='center'><FONT size='2'>찾는 주소가 없습니다.</FONT></TD>
	</TR>
<%
	} else {
%>
	<TR>
		<TD align='center' colspan="3">우편번호 검색 완료</TD>
	</TR>
	<TR>
		<TD align='center'>우편번호</TD>
		<TD align='center'>주 소</TD>
		<TD align='center'>선 택</TD>
	</TR>
<%
	}
	
	while(rs.next()) {
		
		String code = rs.getString("우편번호");
		String sido = rs.getString("시도");
		String gungu = rs.getString("시군구");
		String dong = rs.getString("읍면동");
		String bungi = rs.getString("번지");
		
		String address = sido + " " + gungu + " " + dong + " " + bungi;
		address = address.replaceAll("null", "");
%>
	<TR>
		<TD align='center'><font size='2'><%= code%></font></TD>
		<TD><font size=2>&nbsp;<%= address %></font></TD>
		<TD align="center"><INPUT type='button' value='선택' onClick
			="strData('<%=code %>)','<%=sido %>&nbsp;<%=
				gungu%>&nbsp;
	<%=dong %>')"></TD>
	</TR>
<%
	}
	
	rs.close();
	stmt.close();
	conn.close();

}catch(Exception ex) { }
%>
</table>
</form><p>
<TABLE>
	<TR>
		<TD><a href="zipcode2.jsp">[다시 검색하기]</a></TD>
		<TD><a href=javascript:close()>[닫 기]</a></TD>
	</TR>
</TABLE>
</center>
</body>
</html>