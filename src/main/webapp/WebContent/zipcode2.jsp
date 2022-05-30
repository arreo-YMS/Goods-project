<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script language="Javascript">

function zipsubmit() {
	if (document.zipform.fdong.value == "") {
		alert("'동' 이름이 비어있습니다.");
		document.zipform.fdong.focus();
		return;
	}
}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<FORM name = "zipform" method="post" action="zipcode3.jsp">
<BR><BR>
		<table border="1" align='center'>
			<tr>
				<td width="430" height='20' align='center'>
					<font size='2'>찾는 주소의 <b>'동'</b>이름을 입력하세요</font>
				</td>
			</tr>
			<TR>
				<TD width='430' height='50' align='center'>
					<FONT size='2'>주 소 ('동' 이름) : 
					<input type='text' name='fdong' value="" size="12">
					<input type='button' value="검색" onclick="zipsubmit()">
					<br></FONT>
				</TD>
			</TR>				
		</table>
</FORM>
</body>
</html>