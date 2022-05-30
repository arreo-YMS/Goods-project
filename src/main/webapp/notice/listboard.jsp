<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/Notice.css">
<title>게시판</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'></style>
</head>
<body>   
 <div id="container">
        <header>
            <div id="logo">
                <a href="../Main/Main.jsp">
                    <h1><center>- IDALL -</center></h1>
                </a>
            </div>
            <div class="fixbar">
                <nav> 
                    <ul>
                        <br>
                        <li><a href="../member/loginchang.jsp" class="leftmenu"><h1>Goods</h1></a></li><br>
                        <li><a href="../Map/Map.jsp" class="leftmenu"><h1>MAP</h1></a></li><br>
                        <li><a href="../member/loginchang.jsp" class="leftmenu"><h1>company</h1></a></li><BR>
                        
                    </ul>
                </nav>
            


            </div>
            <center >
                <div class="topmenu">
                    <ul>
                        <li class="topmenu_li" style="margin-left: 30px;"><a href="../search/search.jsp">SEARCH</a></li>
                        <li class="topmenu_li"><a href="../notice/listboard.jsp">Notice</a></li>
                        <li class="topmenu_li"><a href="../member/loginchang.jsp">로그인</a></li>
                    </ul>
                </div>
            </center>
        </header>
<%
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
   pageNum = "1";
}

int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1)* listSize + 1; //오름차순 정렬 
int endRow = currentPage * listSize;



int lastRow = 0;
int i = 0;
int num[] = {0};

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/kmove";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kmove", "root", "11111111");

Statement stmt = conn.createStatement();

String strSQL = "SELECT * FROM kmb";
ResultSet rs = stmt.executeQuery(strSQL);

while(rs.next()){
   num[i] = rs.getInt("num");
}
lastRow = num[0];

%>

 <center><font size='5'><b> 자유게시판 </b></font><br>
  <table border='0' width='800' cellpadding='0' cellspacing='0'>
         <tr>
            <td><hr size='1' noshade>
            </td>
         </tr>  
   </table>
   <table border='0' cellspacing=2 cellpadding=2 width='800' height='90'>
      <tr bgcolor='pink' width="100">
         <td><font size=3 ><center><b>번호</b></center></font></td>
         <td ><font size=3><center><b>글 제목</b></center></font></td>
         <td><font size=3><center><b>작성자</b></center></font></td>
         <td><font size=3><center><b>작성일</b></center></font></td>
         <td><font size=3><center><b>조회</b></center></font></td>
      </tr>
<%
      if(lastRow > 0){
         strSQL ="SELECT * FROM kmb WHERE NUM BETWEEN " + startRow +" AND " + endRow;
         rs= stmt.executeQuery(strSQL);
      
      for(i = 0; i < listSize; i++){
         if(rs.next()){
         int listnum = rs.getInt("num");
         String name = rs.getString("name");
         String title = rs.getString("title");
         String writedate = rs.getString("writedate");
         int readcount = rs.getInt("readcount");
%>
      <tr bgclolor='ededed'>
         <td align=center ><font size=2 color='black'><%=listnum %></font></td>
         <td align=center>
            <a href="write_output.jsp?num=<%=listnum %>">
            <font size=3 color="black"><%=title %></font></a>
         </td>
         <td align=center>
            <font size=3 color="black"><%=name %></font></a>
         </td>
         <td align=center><font size=3><%=writedate %></font>
         </td>
         <td align=center><font size=3><%=readcount %></font>
         </td>
      </tr>
      
<%
         }
      }
%>
</table>

<talbe border='0' width='600' cellpadding='0' cellspacing='0'>
   <tr>
      <td><hr size='1' noshade>
      </td>
   </tr>
</talbe>
<table border=0 width=600>
   <tr>
      <td align=left>
      </td>
      
      <td align=right>
      <button value="등록" onclick="location.href='write.jsp'">등록</button>
      </td>
</table>

<%
rs.close();
stmt.close();
conn.close();
      }
if(lastRow > 0){
   int setPage = 1;
   int lastPage = 0;
   if(lastRow % listSize ==0)
      lastPage = lastRow / listSize;
   else
      lastPage = lastRow / listSize + 1 ;
   if(currentPage > 1){
      %>
         <a href='listboard.jsp?pageNum=<%=currentPage-1 %>'>[이전]</a>
      <%
   }
   while(setPage <= lastPage){
      %>
         <a href='listboard.jsp?pageNum=<%=setPage %>'>[<%=setPage %>]</a>
      <%
         setPage = setPage +1;
      }
      if(lastPage > currentPage){
      %>
         <a href='listboard.jsp?pageNum=<%=currentPage+1 %>'>[다음]</a>
      <%
         }
      }
      %>

</body>
</html>