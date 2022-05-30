<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시판 </title>
<script language="JavaScript">
function check() {
	if (Modify.name.value.length < 1){
		alert("작성자를 입력하세요");
		Modify.name.focus();
		return false;
	}
	
	if (Modify.pass.value.length < 1) {
		alert("비밀번호를 입력하세요.");
		Modify.pass.focus();
		return false;
	}
	
	if (Modify.email.value.indexOf("@")+"" == "-1" || 
			Modify.email.value.indexOf("," + "" == "-1"))
			Modify.email.value == "" )
			{
				alert("E-mail을 입력하세요.");
				Modify.email.focus();
				return false;
			}
			
	if (Modify.title.value.length < 1 ) {
		alert("글제목을 입력하세요.");
		Modify.title.focus();
		return false;
	}
	
	if (Modify.contents.value.length < 1) {
		alert("글내용을 입력하세요.");
		Modify.contents.focus(); 
		return false;
	}
	
	Modify.submit();
}

function list() {
	location.href="listboard.jsp";
}

</script>
</head>
<body>
<%
	String num = request.getParameter("num");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "11111111");
	PreparedStatement pstmt = null; 
	ResultSet rs = null;

	try {
		String strSQL = "SELECT * FROM kmb WHERE num = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));

		rs = pstmt.executeQuery();
		rs.next();

		String title = rs.getString("title");

%>
<center><font size='3'><b> 답변하기 </b></font>           

<table border='0' width='600' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1' noshade></td>
	</tr>
</table>

<form Name='Modify' Action='reply_input.jsp' method='POST' Onsubmit='return Check()'>

<input type='hidden' name='num' value='<%=num %>'>
<table border='0' width='600'>
	<tr>
		<td width='100' bgcolor='cccccc'>
			<font size='2'><Center><b>작성자</b></Center></font>
		</td>
		<td><p><input type='text' size='12' name='name' value=""> * 필 수 </p></td>
	</tr>
	<tr>
		<td width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</td>
		<td><p><input type='password' size='12' name='pass'> * 필 수 </p></td>
	</tr>
	<tr>
		<td colspan='2'><hr size='1' noshade></td>
	</tr>
	<tr>
		<td width='100' bgcolor='cccccc'>
			<font size='2'><center><b>글 제목</b></center></font>
		</td>
		<td>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value='[답변]<%=title %>'></font>
		</td>
	</tr>
	<tr>
		<td bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
		</td>
		<td>
			<font size='2'>
			<textarea cols='70' rows='15' wrap='virtual' name='contents'></textarea></font>
		</td>
	</tr>
	
	<tr> 
		<td colspan='2'><hr size='1' noshade></td>
	</tr>
	
	
	<tr>
		<td align='center' colspan='2' width='100%'>
		<table>
			<tr>
				<td width='200' align='center'>
					<input type='Reset' value='다시작성'>
				</td>
				<td width='200' align='center'>
					<input type='Submit' value='완료'>
				</td>
				<td width='200' align='center'>
					<input type = 'Button' value= '목록'
						Name='Page' onClick='list()';>
				</td>
			</tr>			
		</table>
		</td>
	</tr>
</table>

<%
} catch(SQLException e ) {
	out.print("SQL에러 "+ e.toString());
} catch(Exception ex) {
	out.print("JSP에러 " + ex.toString());
} finally {
	rs.close();
	pstmt.close();
	conn.close();
}
%>
</body>
</html>