<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 삭제</title>
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
		<script src="resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
			function del() {
				if(!confirm("삭제하시겠습니까?")) {
					return;
				}
				
				var pwd = ${vo.pwd}; //원본 비밀번호
				var c_pwd = document.getElementById("c_pwd").value;
				
				if(pwd != c_pwd) {
					alert("비밀번호 불일치");
					return;
				}
				
				var url = "del.do";
				var param = "idx=${vo.idx}"
				
				sendRequest(url,param,delCheck,"post")
			}
			
			function delCheck() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					
					var json = (new Function('return'+data))();
					
					if(json[0].result == 'yes') {
						alert("삭제성공");
						location.href="board_list.do?page=${param.page}";
					} else {
						alsert("삭제실패");
					}
				}
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
		        <td colspan="4" align="right">홈 > 게시판 > 글삭제　</td>
		    </tr>
		</table>
		
		<div style="text-align:center;">
			<b class="listTitle">게시판 글 삭제</b><b class="listTitle2"></b>
		</div>
		<br>
		
		<table border="0" align="center" width="360">
			<tr>
				<td colspan="4"> <hr style="border: solid 1px #123858;"/> </td>
			</tr>
			<tr height="30">
				<td align="center" bgcolor="#506f8a" class="list">
				<b>비밀번호를 입력해 주세요.</b>
			</td>
			</tr>
			<tr height="80">
				<td align="center" bgcolor="#e2e7eb">비밀번호 : 
					<input type="password" style="height:18px;" id="c_pwd" size="10" maxlength="12">
					<input type="hidden" name="idx" value="${vo.idx}">
				</td>
			</tr>
			<tr>
			<td><hr/></td>
			</tr>
			<tr height="30">
				<td align="center">
					<input type="button" class="btn" value="글삭제" onclick="del()">
					<input type="button" class="btn" value="글목록" onclick="location.href='board_list.do'">
				</td>
			</tr>
		</table>
		
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>