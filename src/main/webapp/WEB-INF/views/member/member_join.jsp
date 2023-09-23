<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POK::회원가입</title>
<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		
    

   
    <link rel="stylesheet" href="resources/css/member/join.css"/>
    <link rel="stylesheet" href="resources/css/layout/btn.css"/>
    
    
  	<!-- 다음 주소 api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/join.js"></script>
    
   
   
<!-- 로그인  -->
<script src="resources/js/httpRequest.js"></script>    
<script type="text/javascript">

var b_idCheck = false;

// 중복체크 메서드
function check_id(){
	var id = document.getElementById("join_id").value.trim();
	
	if(id == ""){
		alert("아이디를 입력하세요");
		return;
	}
	
	var url = "check_id.do";
	var param = "id=" + encodeURIComponent(id);
	
	sendRequest(url,param,resultFn,"POST");
}


function resultFn(){
	
	if(xhr.readyState == 4 && xhr.status == 200){
		
		var data = xhr.responseText;
		var json = (new Function('return'+data))();
		var id = document.getElementById("join_id");
		
		if(json[0].res == 'no'){
			alert('이미 존재하는 아이디 입니다.');
			id.value ="";
			return;
			
		}  else if(json[0].res == 'yes') {
			alert('가입가능한 아이디 입니다.');
			b_idCheck=true;
		}
	}
			
}


function che(){
	b_idCheck=false;
}



function send(f){
	// 입력내용 체크
	
	var id = f.id.value.trim();
	var pw = f.pw.value.trim();
	var pwre = document.getElementById("txtRePass").value.trim();
	if(id == ''){
		alert('아이디를 입력해주세요')
		return;
	}
	if(pw == ''){
		alert('비밀번호를 입력해주세요')
		return;
	}
	
	if(pw != pwre){
		alert('비밀번호가 맞지 않습니다')
		return;
	}
	
	 if(!b_idCheck){
		 alert('아이디 중복체크를 해주세요')
		 return;
	 }
	
	 
	 alert("회원가입 완료되었습니다")
	
	
	f.method="POST";
	f.action="member_insert.do";
	f.submit();
}
	
</script>


    
    
    
    
</head>
<body>

 
<jsp:include page="../layout/header.jsp"/>



<form>
<table border="0" align="center" width="450" class="join_table">

	<tr height="45px" align="center" bgcolor="#506f8a" class="jointitle">
		<td> <b>회원 가입</b> </td>
	</tr>
	
	<tr>
		<td>
			　<input type="text"  name="id" id="join_id"placeholder="아이디" onchange="che()">
			<input type="button" class="btn" value="중복확인" onClick="check_id()">
		</td>
	</tr>
	<tr>	
		<td>
			　<input type="password" name="pw" id="txtPass" placeholder="비밀번호">
		</td>
	</tr>
	<tr>
		<td>
			　<input type="password"  id="txtRePass" placeholder="비밀번호 확인">
		</td>
	</tr>
	<tr>
		<td>
			　<input type="text" name="email" placeholder="이메일">
		</td>
	</tr>
	<tr>
		<td> <hr> </td>
	</tr>
	<tr>
		<td> 
			　<input type="text"  name="name" placeholder="이 름">　
			  <input type="radio" name="fm" value="M" checked="checked"> 남자
			  <input type="radio" name="fm" value="F"> 여자  <p>
			　<input type="text"  name="tell" placeholder="000-0000-0000">  <p>
			　<input type="date"  name="birth">
		</td>
	</tr>
	<tr>
		<td> <hr> </td>
	</tr>
	<tr>
		<td> <p>
			　<input type="text"  name="mailaddr" id="sample4_postcode" placeholder="우편번호">
			  <input type="button"  class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <p>
			　<input type="text"  size="40" name="roadaddr" id="sample4_roadAddress" placeholder="도로명주소"> <p>
			　<input type="text"  size="40" name="detailaddr" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999"></span>
		</td>
	</tr>
	<tr>
		<td> <hr style="border: solid 1px #123858;"> </td>
	</tr>
	<tr align="right">
		<td>
	 	<input type="button" value="가입" class="btn" onclick="send(this.form)">
		<input type="button" value="취소" class="btn" onclick="location.href='main'">
	    </td>
	</tr>
</table>


</form>




<jsp:include page="../layout/footer.jsp"/>

   
</body>
</html>