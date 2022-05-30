<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
    <link rel="stylesheet" href="css/Main.css">
</head>
<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="#">
                    <h1><center>- IDALL -</center></h1>
                </a>
            </div>
            <div class="fixbar">
                <nav> 
                    <ul>
                        <br>
                        <li><a href="loginchang.html" class="leftmenu"><h1>Goods</h1></a></li><br>
                        <li><a href="map.html" class="leftmenu"><h1>MAP</h1></a></li><br>
                        <li><a href="loginchang.html" class="leftmenu"><h1>company</h1></a></li><BR>
                        
                    </ul>
                </nav>
            


            </div>
            <center >
                <div class="topmenu">
                    <ul>
                        <li class="topmenu_li" style="margin-left: 30px;"><a href="">BEST</a></li>
                        <li class="topmenu_li"><a href="">고객센터</a></li>
                        <li class="topmenu_li"><a href="">배송조회</a></li>
                        <li class="topmenu_li"><a href="loginchang.html">로그인</a></li>
                    </ul>
                </div>
            </center>
        </header>

<title>スケジュール</title>
<SCRIPT LANGUAGE="JavaScript">
function toggle(e) {               
   if(e.style.visibility=="hidden") {   
      e.style.top = event.y;
      e.style.left = event.x;
      e.style.visibility="visible";
     }
     else
     {
       e.style.visibility="hidden";
     }
}
</SCRIPT>
</head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null) {
   year = Integer.parseInt(strYear);
   month = Integer.parseInt(strMonth);
}

cal.set(year, month, 1);
int startDay = cal.getMinimum(Calendar.DATE);
int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int start = cal.get(Calendar.DAY_OF_WEEK);


int newLine = 0 ;
int j = 0 ;
%>

<center><font size='5'><b>スケジュール</b></font></center>
<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
   <TR>
      <hr size='1' noshade></TD>
   </TR>
</TABLE>
<br>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
      <td>
      <a href="main.jsp?year=<%=year-1%>&month=<%=month %>">◀</a>
      <STRONG><%=year %>年 </STRONG>
      <a href="main.jsp?year=<%=year+1%>&month=<%=month %>">▶</a>      
      </td>
      <TD><DIV align='center'>
      <a href="main.jsp?year=<%=year%>&month=<%=month -1%>">◀</a>
      <STRONG><%=month + 1%>月</STRONG>
      <a href="main.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a>      
      </DIV>
      </TD>
      <TD>
      <DIV align="right">
      <a href=main.jsp></a><STRONG><%=year + "-" + (month + 1) + "-" +date%></STRONG>
      </DIV>
      </TD>
   </tr>
</TABLE>
<BR>

<TABLE width="100%" border="1" cellspacing="0" cellpadding="0">
   <TR>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center"><font color="red">日</font></DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center">月</DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center">火</DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center">水</DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center">木</DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center">金</DIV></TD>
      <TD width='14%' height='34' align='center' bgcolor='cccccc'>
      <DIV align="center"><font color="blue">土</DIV></TD>
   </TR>
<%
for(int index = 1; index < start ; index++) 
{
      out.print("<TD>&nbsp;</TD>");
      newLine++;
}
      
for(int index = 1; index <= endDay; index++) 
{      
      String color = (newLine == 0)?"RED":"BLACK";
      
%>
      <TD width='14%' height='70' align='left' valign='top'>
         <font size='2'><b><a href='write1.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>'>
         <font color = <%=color %>><%=index%></font></a></b></font>
<%


   Class.forName("com.mysql.jdbc.Driver");
         
   String url = "jdbc:mysql://localhost:3306/mydb" ;
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "11111111");

   Statement stmt=conn.createStatement();

   String strSQL = "SELECT * FROM calendar WHERE year = '" + year + "' and month='" + (month + 1) + "' and day='" + index + "'";
   ResultSet rs = stmt.executeQuery(strSQL);

while(rs.next()) {
%>

<a href=content.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>&no=<%=rs.getInt("no")%>
onMouseOver='toggle(document.all.<%="HideShow" + j%>);'
onMouseOut='toggle(document.all.<%="HideShow" + j%>);'>▶

<%
   String strTitle = rs.getString("title");
   out.print(strTitle);
%>

</a><br>
<DIV id='<%="HideShow" + j%>' style="visibility:hidden; position:absolute; left:369px; top:227px; width:157px; height:74px; z-index:1">
		<TABLE height='100' width='200' border='1' cellspacing='1' bgcolor='cccccc'>
   <TR>
      <TD colspan='2' bgcolor='cccccc' align='center' height='25'>
      <font size='2'><b>詳細情報</b></font></TD>
   </TR>
   <TR>
      <TD width='20%' height='25' bgcolor='cccccc' align='center'><font size='2'><b>題目</b></font></TD>
      <TD bgcolor='cccccc'><font size='2'><b><%=strTitle %></b></font></TD>
   </TR>
   <TR>
      <TD width='20%' height='25' bgcolor='cccccc' align='center'><font size='2'><b>時間</b></font></TD>
      <TD bgcolor='cccccc'><font size='2'><b><%=rs.getString("s_time")%>~<%=rs.getString("e_time")%></b></font></TD>
   </TR>
   <TR>
      <TD width='20%' height='25' bgcolor='cccccc' align='center'><font size='2'><b>場所</b></font></TD>
      <TD bgcolor='cccccc'><font size='2'><b><%=rs.getString("position")%></b></font></TD>
   </TR>
   <TR>
      <TD width='20%' height='25' bgcolor='cccccc' align='center'><font size='2'><b>内容</b></font></TD>
      <TD bgcolor='cccccc'><font size='2'><b><%=rs.getString("content")%></b></font></TD>
   </TR>
	</TABLE>
</DIV>
</TD>
<%
j = j + 1 ;
}
%>

<%
newLine++;

if(newLine==7){
   out.print("</TR>");
if(index <= endDay){
   out.print("<TR>");
	}

newLine=0;
}
}


while(newLine > 0 && newLine < 7)
{
   out.print("<TD>&nbsp;</TD>");
   newLine++;
}

%>

</TABLE>
</body>
</html>