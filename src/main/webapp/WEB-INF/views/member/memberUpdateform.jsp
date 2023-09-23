<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POK::마이페이지</title>
<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		
    <style type="text/css">
    </style>

  	<link rel="stylesheet" href="resources/css/member/join.css"/>
    <link rel="stylesheet" href="resources/css/layout/btn.css"/>
    
    
  	<!-- 다음 주소 api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="resources/js/join.js"></script>

<script src="resources/js/httpRequest.js"></script>  
<script type="text/javascript">


function send(f){
	// 입력내용 체크
	
	var id = f.id.value.trim();
	var pw = f.pw.value.trim();
	var ori_pw = f.ori_pw.value.trim();
	
	var pwre = document.getElementById("txtRePass").value.trim();
	var oriPw = document.getElementById("oriPw").value.trim();
	
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
	
	if(ori_pw != oriPw ){
		alert('기존비밀번호가 맞지 않습니다')
		return;
	}
	
	alert("\n 수정완료 \n\n 다시 로그인 해주세요")
	
	f.method="POST";
	f.action="member_update.do";
	f.submit();
}
	
</script>






</head>
<body>
     <jsp:include page="../layout/header.jsp"/>
        
<form>
<table border="0" align="center" width="450" class="join_table">

	<tr height="45px" align="center" bgcolor="#506f8a" class="jointitle">
		<td> <b>정보 수정</b> </td>
	</tr>
	
	<tr>
		<td>
			　<input type="text"  name="id" id="join_id" value="${id.id}" readonly/>

		</td>
	</tr>
	
	<tr>	
		<td>
			 <input style="display:none;" id="oriPw" value="${id.pw}">
			　<input type="password" name="ori_pw" placeholder="기존비밀번호 입력">
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
			　<input type="text" name="email" value="${id.email }">
		</td>
	</tr>
	<tr>
		<td> <hr> </td>
	</tr>
	<tr>
		<td> 
			　<input type="text"   name="name"  value="${id.name }" readonly/>　<p>
			　<input type="text"  name="tell" value="${id.tell}"> <p>
			　<input type="date"  name="birth" value="${id.birth}">
		</td>
	</tr>
	<tr>
		<td> <hr> </td>
	</tr>
	<tr>
		<td> <p>
			　<input type="text"  name="mailaddr" id="sample4_postcode" value="${id.mailaddr}">
			  <input type="button"  class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <p>
			　<input type="text"  size="40" name="roadaddr" id="sample4_roadAddress" value="${id.roadaddr}"> <p>
			　<input type="text"  size="40" name="detailaddr" id="sample4_jibunAddress" value="${id.detailaddr}">
			<span id="guide" style="color:#999"></span>
		</td>
	</tr>
	<tr>
		<td> <hr style="border: solid 1px #123858;"> </td>
	</tr>
	<tr align="right">
		<td>
	 	<input type="button" value="수정" class="btn" onclick="send(this.form)">
		<input type="button" value="취소" class="btn" onclick="history.back()">
	    </td>
	</tr>
</table>


</form>

        
	  <jsp:include page="../layout/footer.jsp"/>
</body>
</html>