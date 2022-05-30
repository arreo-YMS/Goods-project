<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> ログイン </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover	{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<BODY>
<center><font size='3'><b>ログイン</b></font>   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
<TABLE cellSpacing='0' cellPadding='30' align='center' border='0' >
	
<%
String id = request.getParameter("id");       // 회원 인증을 위해 사용자가 로
String pass = request.getParameter("pw");    //그인 페이지에 입력한 id값과 
						                      // 각각 id 변수와 pass 변수에 저장한다. 
String sessionID = "yes";


try{

	if (id == "" || pass == "") {
%>
 <jsp:setProperty property="id" name="Mypage" />
<TR>
	<TD align='center'>
	<font size=2>IDとパスワードを入力してください。.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="./member/loginchang.jsp">[ログイン]</a>
	</TD>
</TR>
<%
	} else {

		Class.forName("com.mysql.jdbc.Driver");
	
		String url = "jdbc:mysql://localhost:3306/kmove" ;
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");
		Statement stmt = conn.createStatement();
		
		String strSQL = "SELECT * FROM km where id='" + id + "'";
		ResultSet rs = stmt.executeQuery(strSQL);
		
		rs.next();
		
		String logid = rs.getString("id");
		String logpass = rs.getString("pass");

		if (id.equals(logid)){
			if(pass.equals(logpass)){
				session.setAttribute("user",sessionID);
				response.sendRedirect("../member/member_page.jsp");
				
			}else{
%>
<TR>
	<TD align='center'>
	<font size=2>パスワードが一致しません。.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="./member/loginchang.jsp">[ログイン]</a>
	</TD>
</TR>
<%
			}
		}else { 
%>
<TR>
	<TD align="center">
	<font size='2'>会員IDではありません。.</font>
	</TD>
</TR>
<TR>
	<TD align="center">
	<a href="../member/loginchang.jsp">[ログイン]</a>
	</TD>
</TR>

<%		
	}
}
} catch(Exception e){
%>
<TR>
	<TD align="center">
	<font size='2'>会員IDではありません。.</font>
	</TD>
</TR>
<TR>
	<TD align="center">
	<a href="../member/loginchang.jsp">[ログイン]</a>
	</TD>
</TR>

<%
}
%>

</TABLE>
</BODY>
</HTML>
