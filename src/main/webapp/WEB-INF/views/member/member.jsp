<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDALL</title>
<link rel="stylesheet" href="resources/css/Main.css">


 <style>
table.group {
border-collapse: separate;
border-spacing: 0;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 1px solid #ccc;
margin : 20px 10px;
margin-left: auto;
margin-right: auto;
margin-top: 100px;
      
    }
  table.group th {
      width: 150px;
      padding: 10px;
      font-weight: bold;
      vertical-align: center;
      border-right: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
      border-top: 1px solid #fff;
      border-left: 1px solid #fff;
      background: #EEE;
      color:BLACK;
      height:100px;
     
      
  }
  table.group td {
      width: 350px;
      padding: 10px;
      vertical-align: center;
      border-right: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
  }
  
    </style>
 
</head>
<body>
<% 
	int good = 0;
	String check=request.getParameter("check");
	String okid = "";
	if(check != null && check.equals("1")){
		good++;
		okid=request.getParameter("okid");
	}
	//out.print(okid+"<br> 2 "+check+"<br> 3 "+good);
%>
    <div id="container">
        <header style="height: 100px;">
            <div id="logo"style="background-color:#7ED2FF";>
                <a href="../myapp/">
                    <h1><center>- IDALL -</center></h1>
                </a>
            </div>           
        </header>
   <div id="slideshow">  
       <br><br> 
       <P ALIGN="center">
       <FONT SIZE="6"><B> MEMBER JOIN </B></FONT>
       </P>
       <br>
       <center><hr width=900px;></center>
 <%
 if(good == 1){
  out.print("<script>alert('使用可能です。');</script>");
 }
 %>
   <form name="member_input" action="../myapp/member/member_output.jsp" method="post" Onsubmit='return Check()'>
       <table class="group" align="center">
            <tr>
            <th scope="row">아이디</th>
            <%if(good == 0){ %>
            
            <td><input type="text" size='30' name='id'>
            <input type="button" name="btn" class='but' value="중복확인" onClick='Check_id()'style="width: 50pt;  height: 20pt;  background-color: #EEE; color:black; border-color: white;"></td>
            
            <%}else if(good == 1){ %>
            <td><input type="text" size='30' name='id' value="<%=okid %>">
            <input type="button" name="btn" class='but' value="중복확인" onClick='Check_id()'style="width: 50pt;  height: 20pt;  background-color: #FF0000; color:black; border-color: white;"></td>
            <%} %>
            </tr>
            <tr>
            <th scope="row">비밀번호</th>
            <td><input type="password" size='30' name='password'>
            </tr>   
            <tr>
            <th scope="row">이름</th>
            <td><input type="text" size='30' name='name'></td>
            </tr>
            <tr>
            <th scope="row">주민등록번호</th>
            <td><input type="text" size='10' maxlength='6' name='jumin1'> - 
            <input type="password" size='10'maxlength='7' name='jumin2'></td>
            </tr>
            <tr>
            <th scope="row">전화번호</th>
            <td><input type="text" size='30'maxlength='11' name='phone' placeholder="  '-'없이 작성해주세요;"></td>
            </tr>
            <tr>
            <th scope="row">주소</th>
            <td><input type="text" name='postcode' id="postcode" placeholder="우편번호"><input type="button" onclick="execDaumPostcode()" value="주소찾기"style="width: 50pt;  height: 20pt;  background-color: #EEE; border-color: white;">
            <input type="text" size="40" id="roadAddress" name='roadAddress' placeholder="도로명주소" ><br><input type="text" size="40" id="jibunAddress" name='jibunAddress' placeholder="지번주소"></td>
             </tr>
             <tr>
             <th scope="row">E-Mail</th>
             <td><input type="text" size='45' name ='mail'></td>
             </tr>
        </table>
            
          <br>
          <center><input type= "submit" value="회원가입" id='1' style="width: 150pt;  height: 30pt;  background-color: #7ED2FF; color: white; border-color: white;"></center>
         
    </div>      
    </form>
    </div>

    
    <footer style="text-align: center;">
      <br>
      <hr>
      <br>
       <font class="bottom" size=1> 회사소개&nbsp;&nbsp; 인재채용&nbsp;&nbsp; 제휴제안&nbsp;&nbsp; 이용약관&nbsp;&nbsp; 개인정보처리방침</font> <br><br>
       <font size=1>2011 COPYRIGHT @ 常勝CORP. ALL RIGHT RESERVED</font>
    </footer>
   <script type = "text/javascript">   
    function Check_id()
    {
     location.href= "../myapp/member/checkid.jsp?id="+member_input.id.value.trim();
    }


</script>  
<script language="JavaScript">

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

            
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
        }
    }).open();
}


function Check_focus()
{
var strfocus1 = memeber_input.juminnum1.value.length;
if(strfocus1 == 6)
   memeber_input.juminnum2.focus(); 
}
function Check() {
	var good = <%=good %>;
      if(member_input.id.value.length < 1) {
            alert("아이디를 입력하세요.");
            member_input.id.focus();
               return false;
      }
      if(good == 0) {
          alert("중복확인을 해주세요");
          //member_input.btn.focus();
             return false;
    }
      else if(member_input.btn.value == "idcheck()") {
          
          member_input.btn.focus();
             return true;
    }
      
      
      if(member_input.password.value.length < 1) {
            alert("비밀번호를 입력하세요.");
            member_input.password.focus();
               return false;
         }
      if(member_input.name.value.length < 1) {
         alert("이름을 입력하세요.");
         member_input.name.focus();
            return false;
      }
      if (member_input.jumin2.value.length < 1) {
         alert("주민등록번호를 입력하세요");
         member_input.jumin2.focus();
            return false;
      }
      if (member_input.jumin1.value.length == !6) {
         alert("주민등록번호 앞자리는 6자리 입니다.");
         member_input.jumin1.focus();
           return false;
      }
      
      for (var i=0;i<member_input.jumin1.value.length;i++){
          if (member_input.jumin1.value.charAt(i) < "0" || member_input.jumin1.value.charAt(i) > "9"){
               alert("주민등록번호는 숫자만 가능합니다.");

               alert("주민등록번호를 입력하세요.");
               }
         if (member_input.jumin2.value.length != 7 ){
               alert("주민등록번호 뒷자리는 7자리 입니다.");
            }

          for (var i=0;i<member_input.jumin2.value.length;i++){
               if (member_input.jumin2.value.charAt(i) < "0" || member_input.jumin2.value.charAt(i) > "9"){
               alert("주민등록번호는 숫자만 가능합니다.");
               member_input.jumin2.focus();
               return false;
               }
            }     
      }
      
      if(member_input.phone.value.length < 1) {
            alert("전화번호를 입력하세요");
            member_input.phone.focus();
               return false;
         }
      if(member_input.mail.value.indexOf("@")+""=="-1"||Modify.mail.value.indexOf(".")+""=="-1"||Modify.mail.value==""){
            alert("MAIL을 입력하세요.");
            member_input.mail.focus();
               return false;
         }
      
   }


        
</script>

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>