<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>POK::게시판</title>
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
		        <td colspan="4" align="right">홈 > 게시판　</td>
		    </tr>
		</table>
		
		<div style="text-align:center;">
			<b class="listTitle">글 목록</b><b class="listTitle2"></b>
		</div>
		
		<table align="center" width="700">
			<tr>
				<td colspan="6" align="center"> <hr style="border: solid 1px #123858;"/> </td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" class="btn" value="글쓰기" onclick="location.href='write.do'">
				</td>
			</tr>	
		</table>
		
		<table border="0" width="700" align="center">
			<tr height="30" bgcolor="#506f8a">
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
				<c:forEach var="vo" items="${list}">
					<tr height="30">
						<td align="center" width="50" bgcolor="#9ab2c7" class="list2">${vo.idx}</td>
						<td align="center" width="50" bgcolor="#e2e7eb">${vo.name}</td>
						<td align="left" width="250" bgcolor="#e2e7eb" style="padding-left:15px">
							<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
							<c:if test="${vo.depth ne 0}"><img src="resources/images/re.gif"></c:if>
							<!-- 삭제되지 않은 글이라면 클릭 가능 -->
							<c:if test="${vo.del_info ne -1}">
								<a href="view.do?idx=${vo.idx}&page=${param.page}">
									<font color="black">${vo.subject}</font>
								</a>
							</c:if><!-- 실수 -->
							<!-- 삭제된 글은 클릭하지 못하도록 처리 -->
							<c:if test="${vo.del_info eq -1}">
								<font color="gray">${vo.subject}</font>
							</c:if>
							<c:if test="${vo.del_info ne -1 &&vo.readhit >= 5}">
								<img src="resources/images/hot.gif" border="0" height="16">
							</c:if>
							
						<td align="center" width="150" bgcolor="#e2e7eb">${vo.regdate}</td>
						<td align="center" width="50" bgcolor="#e2e7eb">${vo.readhit}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">${pageMenu}</td>
				</tr>
		</table>
		
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>