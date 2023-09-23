<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

 <link rel="stylesheet" href="resources/css/layout/btn.css"/>   
 <style>
 </style>
 
 
 <script type="text/javascript">
 
 
	 
 function update(f){
	 
	
	 var id = f.id.value.trim();
	 var member_type = f.member_type.value.trim();
	 var ori_type = f.ori_type.value.trim();
	
	 
 alert(ori_type)
	 
	 if(ori_type =="USER"){
		 alert('관리자만 가능합니다')
		 return;
	 }
	  
	 if(!confirm(id + '의 타입을'+ member_type + '으로 변경하시겠습니까?')) {
			return;
		}
	 
	 
 	f.method="POST";
	f.action="member_admin.do";
	f.submit();
	 
	 
 }
 
 
 
 
 function admin_delete(f){
	
	 
	 var id = f.id.value.trim();
	 
	 if(!confirm(id +" 를 회원 탈퇴 하시겠습니까?")){
		 
		 return;
	 }
	 
	 alert("탈퇴");
	 
	 
	f.method="POST";
	f.action="member_admin_delete.do";
	f.submit();
	 
 }
 
 
 
 
 
 

 </script>
  
</head>
<body>


	<table class="_list" >
	
			
			<tr>
				<th>권한</th>
		        <th style="width:90px;">아이디</th>
		        <th>이 름</th>
		        <th>생 일</th>
		        <th>성별</th>
		        <th>이메일</th>
		        <th>전화번호</th>
		        <th>우편번호</th>
		        <th>주 소</th>
		        <th></th>
		    </tr>
			
			
	
		
 			<c:forEach var="m" items="${m_list}">
		    <tr>
		    	<td>${m.member_type}</td>
		    	<td>${m.id}</td>
		    	<td>${m.name}</td>
		    	<td>${m.birth}</td>
		    	<td>${m.fm}</td>
		    	<td>${m.email}</td>
		    	<td>${m.tell}</td>
		    	<td>${m.mailaddr}</td>
		    	<td>${m.roadaddr} 
		    		<br>/ ${m.detailaddr}</td>
				<td>
				<form>
				<input type=hidden name="id" value="${m.id}"/>
				<input type=hidden name="ori_type" value="${login_type}"/>
		    	<select name="member_type">
							<option value="">::타입변경::</option>
							<option value="USER">USER</option>
							<option value="ADMIN">ADMIN</option>
				</select>
				
				
					<input type="button" value="정보수정" class="btn" onclick="update(this.form)">
					<input type="button" value="회원탈퇴" class="btn" onclick="admin_delete(this.form)">
				</form>
				</td>
		    	
		    	
				
			</tr>
			
		    </c:forEach>
	
		   
		</table>
    
   

</body>
</html>