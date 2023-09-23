<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		
		<meta charset="UTF-8">
		<title>POK::답글달기</title>
		<style  type="text/css">
        body { font-family: '08서울남산체'; }
        a { 
            text-decoration:none;
            color: black;
            cursor: pointer;
        }
    	</style>
    	
    	<script type="text/javascript">
			function send_check(){
				var f = document.f;
				
				f.submit();
			}
		</script>
    	
    	<link rel="stylesheet" href="resources/css/layout/btn.css"/>
		<link rel="stylesheet" href="resources/css/board/list.css"/>
		
	</head>
	<body>
		<jsp:include page="../layout/header.jsp"/>
		
		<table border="0" width="1000" align="center">
			<tr>
		    	<td colspan="4" height="20"></td>
		    </tr>
		    <tr>
		        <td colspan="4" align="right">홈 > 게시판 > 답글달기　</td>
		    </tr>
		</table>
		
		<div style="text-align:center;">
			<b class="listTitle">게시판 글 답변</b><b class="listTitle2"></b>
		</div>
		<br>
		
		<form name="f" method = "post" action="reply.do">
			<input type="hidden" name="idx" value="${param.idx}">
			<input type="hidden" name="page" value="${param.page}">
			<table border="0" align="center">
				<tr>
					<td colspan="4"> <hr style="border: solid 1px #123858;"/> </td>
				</tr>
				<tr height="30">
					<th width="90"  align="center" bgcolor="#506f8a" class="list">작성자</th>
					<td width="350" bgcolor="#e2e7eb">
						<input type="text"  style="height:18px;" size="10" maxlength="10" name="name">
					</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">제목</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<input type="text" style="height:18px;" size="35" maxlength="50" name="subject">
					</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">내용</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<textarea name="content" rows="15" cols="49"></textarea>
					</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">비밀번호</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<input type="password" style="height:18px;" size="10" maxlength="12" name="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn" value="답변쓰기" onclick="send_check();">
					<input type="reset" class="btn" value="다시작성">
					<input type="button" class="btn" value="목록보기" onclick="location.href='board_list.do'">
				</td>
			</tr>
			</table>
		</form>
		
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>