<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 글작성</title>
		<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		
		<style  type="text/css">
        body { font-family: '08서울남산체'; }
        a { 
            text-decoration:none;
            color: black;
            cursor: pointer;
        }
    	</style>
		<script language="javaScript" src="js/script.js"></script>
		
		<link rel="stylesheet" href="resources/css/layout/btn.css"/>
		<link rel="stylesheet" href="resources/css/board/list.css"/>
		
		<script src="resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
			function send(f) {
				
				
				f.action = "delform.do";
				f.method="post";
				f.submit();
			}
			
			function reply() {
				location.href="reply_form.do?idx=${vo.idx}&page=${param.page}";
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
		        <td colspan="4" align="right">홈 > 게시판 > 글내용　</td>
		    </tr>
		</table>
		
		<div style="text-align:center;">
			<b class="listTitle">글 내용</b><b class="listTitle2"></b>
		</div>
		<br>
		
		<form>
			<input type="hidden" name="idx" value="${vo.idx}">
			<input type="hidden" name="pwd" value="${vo.pwd}">
			<table border="0" align="center">
				<tr>
					<td colspan="4"> <hr style="border: solid 1px #123858;"/> </td>
				</tr>
				<tr height="30">
					<th align="center" width="90" bgcolor="#506f8a" class="list">글번호</th>
					<td align="center" width="140" align="center" bgcolor="#9ab2c7" class="list2">${vo.idx}</td>
					
					<th align="center" width="90" bgcolor="#506f8a" class="list">조회수</th>
					<td align="center" width="140" align="center" bgcolor="#e2e7eb">${vo.readhit}</td>
				</tr>
				<tr height="30">
					<th align="center" width="90" bgcolor="#506f8a" class="list">작성자</th>
					<td align="center" width="140" align="center" bgcolor="#e2e7eb">${vo.name}</td>
				
					<th align="center" width="90" bgcolor="#506f8a" class="list">작성일</th>
					<td align="center" width="140" align="center" bgcolor="#e2e7eb">${vo.regdate}</td>
				</tr>
				<tr height="30">
					<th align="center" width="90" bgcolor="#506f8a" class="list">제목</th>
					<td align="center" width="370" align="center" colspan="3" bgcolor="#e2e7eb">${vo.subject}</td>
				</tr>
				<tr height="30">
					<th align="center" width="90" bgcolor="#506f8a" class="list">내용</th>
					<td align="left" width="370" height="300" colspan="3" bgcolor="#e2e7eb"><pre>${vo.content}</pre></td>
				</tr>
				<tr>
   					<td colspan="4"><hr/></td>
   				</tr>
   				<tr height="30">
   					<td colspan="4" align="right" >
   						<input type="button" class="btn" value="글수정" onclick="location.href='modify_form.do?idx=${vo.idx}'">
   						<input type="button" class="btn" value="글삭제" onclick="send(this.form)">
   						<!-- 답글달기 depth가 1보다 크면 답글을 못달게 만들기-->
						<c:if test="${vo.depth lt 1}">
   						<input type="button" class="btn" value="답글쓰기" onclick="reply()">
   						</c:if>
   						<input type="button" class="btn" value="글목록" onclick="location.href='board_list.do'">
   					</td>
   				</tr>
			</table>
		</form>
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>