<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="../resources/css/search.css">
</head>
<style>
a{text-decoration: none;}

</style>
<body>
   <div class="searchbox">
      <div class="header">
        <a href="../member/member_page.jsp">
        <h1>Search</h1></a>
        <input onkeyup="filter()" type="text" id="value" placeholder="검색 고고!!">
      </div>

      <div class="container">

        <div class="item">
          <span class="icon">A</span>
          <a href="https://apple.com"><span class="name">Apple</span></a>
        </div>

        <div class="item">
          <span class="icon">이</span>
          <a href="./이주빈티켓팅.html"><span class="name">이주빈</span></a>
        </div>

        <div class="item">
          <span class="icon">아</span>
          <span class="name">아이린</span>
        </div>

        <div class="item">
          <span class="icon">강</span>
          <span class="name">강혜원</span>
        </div>

        <div class="item">
          <span class="icon">아</span>
          <span class="name">아이유</span>
        </div>

        <div class="item">
          <span class="icon">트</span>
          <a href="./twice.jsp"><span class="name">트와이스</span></a>
        </div>

        <div class="item">
          <span class="icon">P</span>
          <span class="name">Pear</span>
        </div>

        <div class="item">
          <span class="icon">C</span>
          <span class="name">Cherry</span>
        </div>
        
        <div class="item">
        	<span class="icon">T</span>
        	<a href="./twice.jsp"><span class="name">Twice</span></a>
        </div>
        
        
      </div>
    </div>
    
    <script type="text/javascript">
      function filter(){

        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "block";
          }else{
            item[i].style.display = "none";
          }
        }
      }
</script>


</body>
</html>