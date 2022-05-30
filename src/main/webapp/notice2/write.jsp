<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="../resources/css/Main.css">
<SCRIPT language="JavaScript">
   function Check()
   {
      if(Write.name.value.length < 1)
      {
         alert("작성자를 입력하세요.");
         Write.name.focus();
         return false;
      }

      if(Write.pass.value.length < 1)
      {
         alert("비밀번호를 입력하세요.");
         Write.pass.focus();
         return false;
      }
      if(Write.title.value.length < 1)
      {
         alert("글 제목을 입력하세요.");
         Write.write_title.focus();
         return false();
      }
      if(Write.contents.value.length < 1)
      {
         alert("글 내용을 입력하세요.");
         Write.content.focus();
         return false;
      }
      Write.submit();
   }

</SCRIPT>
</head>
<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="listboard.jsp">
                    <h1><center>- IDALL -</center></h1>
                </a>
            </div>
        </header>
       
<center><font size="50">자유 게시판</font></center>

<br><br><br>
<form name='Write' action="write_input.jsp" method='post' onsubmit='return Check()'>
<center><table border='0' width='650' cellpadding='2' cellspacing='2'>
   <tr>
      <td width='300' bgcolor='cccccc'>
         <font size='2'><center><b>작성자</b></center></font>
      </td>
      <td>
         <p><input type='text' size='12' name='name' > * 필수</p>
      </td>
   </tr>
   <tr>
      <td width='100' bgcolor='cccccc'>
         <font size='2'><center><b>비밀 번호</b></center></font>
      </td>
      <td>
         <p><input type='password' size='12' name='pass'> * 필수
                  (게시물 수정 삭제시 필요합니다.)</p>
      </td>
   </tr>
   <tr>
      <td colspan='2'>
         <hr size='1' noshade>
      </td>
   </tr>
   <tr>
      <td width='100' bgcolor='cccccc'>
         <font size='2'><center><b>글 제목</b></center></font>
      </td>
      <td>
         <font size='2'><input type='text' size='70' maxlength='50'
                           name='title'></font>
      </td>
   </tr>
   
   <tr>
      <td bgcolor='cccccc'>
         <font size='2'><center><b>글 내용</b></center></font>
      </td>
      <td>
         <font size='2'>
         <textarea rows="15" cols="70" wrap='virtual' name='contents'>
         </textarea>
         </font>
      </td>
   </tr>
   <tr>
      <td colspan='2'>
         <hr size='1' noshade>
      </td>
   </tr>
   <tr>
      <td align='center' colspan='2' width='100%'>
      <table>
         <tr>
            <td width='100' align='center'>
               <input style="width: 100px; height: 50px;" Type='reset' value ='다시 작성'>
            </td>
            <td width='200' align='center'>
               <input style="width: 100px; height: 50px;"type ='submit' value ='등록'>
            </td>
         </tr>
      </table>
      </td>
   </tr>
</table>
</center>
</form>   
            </div>
</body>
</html>