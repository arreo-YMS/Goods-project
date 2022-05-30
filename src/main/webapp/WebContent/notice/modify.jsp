<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.* , java.util.* " %>
<%   request.setCharacterEncoding("UTF-8"); %>

<HTML>
<HEAD>
<TITLE>게시판</TITLE>

<Script language="JavaScript">
function Check() {
   if(Modify.name.value.length < 1) {
      alert("작성자를 입력하세요.");
      Modify.name.focus();
         return false;
   }
   if(Modify.pass.value.length < 1) {
      alert("비밀번호를 입력하세요.");
      Modify.pass.focus();
         return false;
   }
   if (Modify.title.value.length < 1) {
      alert("글 제목을 입력하세요.");
      Modify.title.focus();
         return false;
   }
   if (Modify.contents.value.length < 1) {
      alert("글 내용을 입력하세요.");
      Modify.contents.focus();
         return false;
   }
   Modify.submit();
}
   function list() {
      location.herf="listboard.jsp";
   }
</Script>
</HEAD>
<BODY>
<%
String num = request.getParameter("num");

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/kmove" ;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
   String strSQL = "SELECT * FROM kmb WHERE NUM = ?";
   pstmt = conn.prepareStatement(strSQL);
   pstmt.setInt(1 , Integer.parseInt(num));
   
   rs = pstmt.executeQuery();
   rs.next();
   
   String name = rs.getString("name");
   String title= rs.getString("title");
   String contents= rs.getString("contents").trim();
   String writedate = rs.getString("writedate");
   int readcout = rs.getInt("readcount");
%>

<center><font size='3'><b>게시판 글 수정</b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade></TD>
   </TR>
</TABLE>

<form name='Modify' Action='modify_output.jsp' method='post' OnSubmit='return Check()'>
<TABLE border='0' width='600'>
	<TR>
      <TD width='100' bgcolor='cccccc'><font size='2'><center><b>번호</b></center></font></TD>
      <TD><p><input type='text' size='12' name='num' value="<%=num %>"></p></TD>
   </TR>
   <TR>
      <TD width='100' bgcolor='cccccc'><font size='2'><center><b>작성자</b></center></font></TD>
      <TD><p><input type='text' size='12' name='name' value="<%=name %>"> * 필수  </p></TD>
   </TR>
   <TR>
      <TD width='100' bgcolor='cccccc'><font size='2'><center><b>비밀번호</b></center></font></TD>
      <TD><p><input type='password' size='12' name='pass'>* 필수 </p></TD>
   </TR>
   <TR>
      <TD colspan='2'><hr size='1' noshade></TD>
   </TR>
   <TR>
      <TD width='100' bgcolor='cccccc'><font size='2'><center><b>글 제목</b></center></font></TD>
      <TD><font size='2'><input type='text' size='70'maxlength='50' name='title' value="<%=title%>"></font></TD>
   </TR>
   <TR>
      <TD bgcolor='cccccc'><font size='2'><center><b>글 내용</b></center></font></TD>
      <TD><font size='2'><textarea rows="15" cols="70" wrap='virtual' name='contents'><%=contents%></textarea></font></TD>
   </TR>
   <TR>
      <TD colsapn='2'><hr size='1' noshade></TD>   
   </TR>
   <TR>
      <TD align='center' colspan='2' width='100%'>
      <TABLE>
         <TR>
            <TD width='200' align='center'><input type = 'Reset' Value = '다시작성'></TD>
            <TD width='200' align='center'><input type = 'Submit' Value = '수정완료'></TD>
            <TD width='200' align='center'><input type = 'Button' Value = '목록' name='page' onclick='listboard.jsp'></TD>
         </TR>
      </TABLE>
      </TD>
   </TR>
</TABLE>
</form>


<%
} catch(SQLException e) {
   out.print("SQL에러" + e.toString());
   }
   catch(Exception ex) {
      out.print("JSP에러"+ex.toString());
      }
      finally{
         if(rs!=null){ rs.close();}
         pstmt.close();
         conn.close();
         }
         %>
</BODY>