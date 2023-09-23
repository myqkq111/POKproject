<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
    <link rel="stylesheet" href="resources/css/member/join.css"/>
    <link rel="stylesheet" href="resources/css/layout/btn.css"/>
    

<script type="text/javascript">

function send(f){
	
	var ori_id = f.ori_id.value.trim();
	var ori_pw = f.ori_pw.value.trim();
	
	var id = f.member_id.value.trim();
	var pw = f.member_password.value.trim();
	
	
	
	if(ori_id!=id || ori_pw!=pw){
		alert("회원정보가 맞지 않습니다")
		return;
	}
	
	
	if(!confirm("정말 탈퇴 하시겠습니까?")){
		return;
	}
	
	alert("회원탈퇴 되었습니다.");
	
	
	
	f.method="POST";
	f.action="m_delete.do";
	f.submit();
	
	
	
	
}

</script> 
   
</head>
<body>
    
    <jsp:include page="../layout/header.jsp"/>
    
    <table border="0" width="1000" align="center">
		<tr>
            <td colspan="4" height="20"></td>
        </tr>
        <tr>
            <td colspan="4" align="right">홈 > 회원탈퇴　</td>
        </tr>
    </table>
        
<form>
<table border="0" align="center" width="350">
	<tr>
		<td class="hrTop"> </td>
	</tr>
	<tr height="45px" align="center" bgcolor="#506f8a">
		<td class="jointitle"> <b >회원 탈퇴</b> </td>
	</tr>
	<tr>
		<td class="hrBottom"> </td>
	</tr>
	
	<tr>
		<td align="center"><p>
			<input type="hidden" name="ori_id" value="${id.id}">
			<input type="hidden" name="ori_pw" value="${id.pw}">
			<input type="text" style="height:18px;" name="member_id" value="${id.id}" readonly/> <p>
			<input type="password" style="height:18px;" name="member_password" placeholder="비밀번호"> <p>
		</td>
	</tr>
	
	<tr>
		<td> <hr style="border: solid 1px #123858;"> </td>
	</tr>
	<tr>
		<td align="center">
		<input type="button" class="btn" style="padding:0px 8px 3px 8px;" value="탈 퇴" onclick="send(this.form)">　
		<input type="button" class="btn" style="padding:0px 8px 3px 8px;" value="취 소" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
     
      <jsp:include page="../layout/footer.jsp"/>     
	
</body>
</html>