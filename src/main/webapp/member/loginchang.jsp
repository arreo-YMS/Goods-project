<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IDALL</title>
    <link rel="stylesheet" href="../resources/css/Main.css">
    <style>
        table.login {
          border-collapse: separate;
          border-spacing: 0;
          text-align: left;
          line-height: 1.5;
          border-top: 1px solid #ccc;
          border-left: 1px solid #ccc;
          margin-left: 580px;
        }
        table.login th {
          width: 150px;
          padding: 10px;
          font-weight: bold;
          vertical-align: top;
          border-right: 1px solid #ccc;
          border-bottom: 1px solid #ccc;
          border-top: 1px solid #fff;
          border-left: 1px solid #fff;
          background: #FFC4EB;
        }
        table.login td {
          width: 230px;
          padding: 10px;
          vertical-align: top;
          border-right: 1px solid #ccc;
          border-bottom: 1px solid #ccc;
        }
        
        
    </style>
</head>
        <body>
        <div id="container">
                <header style="height: 200px;">
                    <div id="logo">
                        <a href="../Main/Main.jsp">
                            <h1><center>- IDALL -</center></h1>
                        </a>
                    </div>
                    
                    
                </header>

            <form name="member_input" action="member_ok.jsp" method="post">
                <div id="login">
                <center><h2>MEMBER LOGIN</h2></center>
                <br>
                <hr>
                <br>
    
                <center><td><input name="id" placeholder="ID" type="id" size='40'style="height: 30pt;"></td></center>
                <br>
            
                
                <center><td><input name="pw" placeholder="PW" type="password" size='40'style="height: 30pt;" ></td></center>
            
            
            <br>
            
            <center><input type="submit"value="로그인" style="width: 200pt;  height: 30pt;  background-color: #FFC4EB; color: white; border-color: white; ">
            <br><br>
                <h4>IDALL MEMBER</h4>
            <font size='1'>회원가입 하시면 다양한 서비스를 이용하실 수 있습니다.</font></center>
            <br>
            <center><a href="member.jsp"><input type="button" value="회원가입" style="width: 120px; height: 30px; background-color: #FFC4EB; color: white; border-color: white;"></a></center>
            </form>
            </div>

          
            <footer style="text-align: center;">
                        <br><br><br><br><br><br><br><br><br>
                        <hr>
                        <br>
                     <font class="bottom" size=1> 회사소개&nbsp;&nbsp; 인재채용&nbsp;&nbsp; 제휴제안&nbsp;&nbsp; 이용약관&nbsp;&nbsp; 개인정보처리방침</font> <br><br>
                     <font size=1>2021 COPYRIGHT @ 常勝CORP. ALL RIGHT RESERVED</font>
                     
                
                
                
             </footer>
        
        
        
    </div>
            
    </body>
</html>
        
                
                
                