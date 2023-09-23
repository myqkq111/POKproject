<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>POK몰</title>
		
	<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  

 	<!-- 로그인 레이아웃 -->
    <link rel="stylesheet" href="resources/css/layout/header.css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="resources/js/log.js"></script>
    
    <script src="resources/js/httpRequest.js"></script>
   
    <script>
    
    function login(f){
		
		var id = f.id.value.trim();
		var pw = f.pw.value.trim();
		
		//유효성 체크
		if(id == ''){
			alert("아이디를 입력해주세요")
			return;
		}
		
		if(pw == ''){
			alert("비밀번호를 입력해주세요")
			return;
		}
		
		var url ="login.do";
		var param ="id="+id+"&pw="+pw;
		
		sendRequest(url,param,myCheck,"POST");
		
	};
	
	

	function myCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].result == 'no_id'){
				alert('아이디가 존재하지 않습니다.');
			} else if(json[0].result == 'no_pw'){
				alert('비밀번호가 일치하지 않습니다.');
			} else {
				alert('로그인 성공');
				location.href="javascript:history.go()";
			}
		}
	}
	
	
	
		function searchs(f){
			f.method = "POST";
			f.action = "search.do";
			f.submit();
			
		}
		
		function enterkey(f){
			if (window.event.keyCode == 13) {
				f.method = "GET";
				f.action = "search.do";
				f.submit();
		    }
		}
		
		
		function logout(){
			
			var url ="logout.do";
			var param = "";
			
			sendRequest(url,param,myC,"POST");
			
		};
				
		function myC(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				location.href="javascript:history.go()";
				
				
			}
		}
	
	</script>
    

<style>
html{scroll-behavior:smooth;}


body{
padding: 0 9.5%;

}

#loginback{
background-image: url("resources/pic/login.jpg");
background-repeat: no-repeat;
valign:middle;
width: 306px;
height: 300px;
border-radius:50%;
}


.menu a{
    color:#ffffff;
    letter-spacing:1px;
    line-height:45px;
    display:block;
    background-color: #004a88;
    font-family: '08���ﳲ��ü';
}



.icon{
	position:absolute;
	height:23px;
	top:0;
	left:5px;
    animation: motion 0.3s 
               linear 0s   
               infinite alternate; 
  }
  

  @keyframes motion {
	0% {padding-top: 0px;} 
	100% {padding-top: 8px;} 
  }
</style>    

	</head>
	
	<body>
	
<!-- 로그인 레이어 -->

<div id="pop" style="display:none;">
    <div id="loginback">
        <div class="loginForm">
        <form method="post" name="lgoin" onsubmit="return false;">
           <div class="box">
            <input type="text" class="iText" name="login_id" id="id" placeholder="아이디">
            <br>
            <input type="password" name="login_pw" class="iText2" id="pw" placeholder="비밀번호">
            <br>
          </div>
          
          <button type="submit" class="loginBtn" onclick="login(this.form)">로그인</button>
        </form>
      </div>
    </div>
    <div><br>
      <div id="close"><img src="resources/pic/click/login_close.png"></div>
     </div>
</div>

 

  	


<table border="0" width="1000" align="center">
			
		
			
        <tr align="right" style="position:relative;">
        
         <td colspan="3" >
        
	       		<c:choose>
						<c:when test="${empty id }">							
							<a href="#" id="pop_bt" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　로그인　</a>
	               			|<a href="member_insert_form.do" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　회원가입　</a>
	                		|<a href="javascript:alert('로그인을 해주세요');" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　게시판　</a>|
						</c:when>
						
						<c:when test="${not empty id && id.member_type eq 'USER' }">
							<b>${id.name} (${id.id})</b>
							<a href="#" onclick="logout()" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　로그아웃　</a>
               				|<a href="mypage.do" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　마이페이지　</a>
                			|<a href="board_list.do" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　게시판　</a>| 
						</c:when>
						
					
						<c:when test="${not empty id && id.member_type eq 'ADMIN'  }">
							
							<img  class="icon"  align="left" src="resources/images/admin.png" />
							<b>${id.name} (${id.id})</b>
			            	<a href="#" onclick="logout()" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　로그아웃　</a>
			                |<a href="admin.do" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　관리자페이지　</a>
			                |<a href="board_list.do" id="b" onmouseover="this.style.color='#aaaaaa'" onmouseout="this.style.color='#000000'">　게시판　</a>|
			               
						</c:when>
						
				</c:choose>
         
           </td>	            
            
            <td>
            	<form id="searchbox">
                	<input name="search" type="text" onkeydown="enterkey(this.form)" size="15" >
                	<input id="button-submit" type="button" value="검 색" onclick="searchs(this.form)">
                </form>											
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <a href="main"> <img src="resources/logo/logo.jpg" /> </a>
            </td>
        </tr>
        
        
        
             <tr align="center">
            <td width="250" class="menu">
                <a href="cate_page.do?cate=인형" onMouseOver="this.innerHTML='인형'" onMouseOut="this.innerHTML='DOLL'" class="a1">DOLL</a>
            </td>
            <td width="250" class="menu">
                <a href="cate_page.do?cate=문구" onMouseOver="this.innerHTML='문구'" onMouseOut="this.innerHTML='STATIONERY'">STATIONERY</a>
            </td>
            <td width="250" class="menu">
                <a href="cate_page.do?cate=잡화" onMouseOver="this.innerHTML='잡화'" onMouseOut="this.innerHTML='FANCY'">FANCY</a>
            </td>
            <td width="250" class="menu">
                <a href="cate_page.do?cate=출판" onMouseOver="this.innerHTML='출판'" onMouseOut="this.innerHTML='PUBLISHING'" class="a2">PUBLISHING</a>
            </td>
        </tr>
        <tr>
            <td colspan="4" height="20"></td>
        </tr>
       
</table>

 
	</body>
</html>