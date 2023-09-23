<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POK::마이페이지</title>
<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		

    <style type="text/css">
        body { font-family: '08서울남산체'; }
        a { 
            text-decoration:none;
            color: black;
            cursor: pointer;
        }
        
        .memberDelbtn {
			background: #4f5356;
			border: 2px solid #4f5356;
			border-radius: 4px;
			
			color: #ffffff;
			font-weight: bolder;
		}
		.memberDelbtn:hover {
		    background: #292c2e;
		}
		
		.mypagetitle {
			color: #506f8a;
			font-weight: bold;
		}

		.mypageBorder {
			border: solid 1px #506f8a;
			border-radius: 12px;
			cursor:pointer;
			box-shadow : 5px 5px 10px 5px #506f8a;
			
		}
		.mypageBorder:hover{
			
			box-shadow: inset 3px 3px 5px 3px  #506f8a;
		}
		
		
		
    </style>
    
    <link rel="stylesheet" href="resources/css/layout/btn.css"/>
    
</head>
<body>
    
    <jsp:include page="../layout/header.jsp"/>
    
    <table border="0" width="1000" align="center">
        <tr>
            <td colspan="4" align="right">홈 > 마이페이지　</td>
        </tr>
        <tr>
            <td colspan="4" height="20"></td>
        </tr>
    </table>
        
<table border="0" align="center">	
	<tr align="center" height="180">
		<td class="mypageBorder" width="230" onClick="location.href='memberUpdateform.do'">
			<img height="100" src="resources/images/mypage/MPupdate.jpg"/>
			<p class="mypagetitle">정보수정</p>
		</td>
		<td width="100"></td>
		<td class="mypageBorder" width="230" onClick="location.href='memberDelete.do'">
			<img height="100" src="resources/images/mypage/MPdelete.jpg"/>
			<p class="mypagetitle">회원탈퇴</p>
		</td>
	</tr>
	<tr>
		<td colspan="3" height="60px"></td>
	</tr>
	<tr align="center" height="180">
		<td class="mypageBorder" width="230" onClick="location.href='basket.do'">
			<img height="100" src="resources/images/mypage/MPbasket.jpg"/>
			<p class="mypagetitle">장바구니</p>
		</td>
		<td width="100"></td>
		<td class="mypageBorder" width="230" onClick="location.href='buylist.do'">
			<img height="100" src="resources/images/mypage/MPorderlist.jpg"/>
			<p class="mypagetitle">구매내역</p>
		</td>
	</tr>
</table>

        <jsp:include page="../layout/footer.jsp"/>  
	
</body>
</html>