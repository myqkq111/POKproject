<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 글수정</title>
		
		<style  type="text/css">
        body { font-family: '08서울남산체'; }
        a { 
            text-decoration:none;
            color: black;
            cursor: pointer;
        }
    	</style>
    	
    	<link rel="stylesheet" href="resources/css/layout/btn.css"/>
		<link rel="stylesheet" href="resources/css/board/list.css"/>
		
    	<script type="text/javascript">
    		function send(f) {
    			
    			if(!confirm("수정하시겠습니까?")) {
					return;
				}
				
				var pwd = ${vo.pwd}; //원본 비밀번호
				var c_pwd = document.getElementById("c_pwd").value;
				
				if(pwd != c_pwd) {
					alert("비밀번호 불일치");
					return;
				}
    			
				f.action = "modify.do";
				f.method="post";
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
		        <td colspan="4" align="right">홈 > 게시판 > 글수정　</td>
		    </tr>
		</table>
		
		<div style="text-align:center;">
			<b class="listTitle">글 수정</b><b class="listTitle2"></b>
		</div>
		<br>
		
		<form>
			<input type="hidden" name="idx" value="${vo.idx}">
			<table border="0" align="center">
				<tr>
					<td colspan="4"> <hr style="border: solid 1px #123858;"/> </td>
				</tr>
				
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">글번호</th>
					<td align="center" width="350" bgcolor="#e2e7eb">${vo.idx}</td>
				</tr>
				
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">작성자</th>
					<td align="center" width="350" bgcolor="#e2e7eb">${vo.name}</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">제목</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<input type="text" style="height:18px;" size="35" maxlength="50" name="subject" value="${subject}">
					</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">내용</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<textarea name="content" rows="15" cols="49">${vo.content}</textarea>
					</td>
				</tr>
				<tr height="30">
					<th width="90" align="center" bgcolor="#506f8a" class="list">비밀번호</th>
					<td align="left" width="350" bgcolor="#e2e7eb">
						<input type="password" style="height:18px;" size="10" maxlength="12" id="c_pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" class="btn" value="글수정" onclick="send(this.form)">
						<input type="button" class="btn" value="목록보기" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>