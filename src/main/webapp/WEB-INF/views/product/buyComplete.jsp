<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/css/product/buycomplete.css">
	</head>
	<body>
	
		<jsp:include page="../layout/header.jsp"/>
	
		<div style="margin-top:50px; padding:15px 0;" align="center">
			<table>		
				<tr>
					<td colspan="2" align="center">
						<img src="resources/logo/complete.jpg" id="buyimg">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2" style="color:#717171;">
						<font size="5px"><b>결제가</b><br>
						<b>완료되었습니다</b></font>
					</td>
				</tr>
				<tr height="10px">
				</tr>
				<tr>
					<td align="center" colspan="2" style="color:#717171;">
						<font size="3px"><b>포켓몰을 이용해주셔서 감사합니다</b></font>
					</td>
				</tr>
				<tr height="30px">
				</tr>
				<tr>
					<td align="center">
						<button type="button" class="btn_bas" onclick="location.href='main'">홈으로</button>
					</td>
					<td align="center">
						<button type="button" class="btn_pur" onclick="location.href='buylist.do'">구매내역</button>
					</td>
				</tr>
			</table>
		</div>
	
		<jsp:include page="../layout/footer.jsp"/>
		
	</body>
</html>