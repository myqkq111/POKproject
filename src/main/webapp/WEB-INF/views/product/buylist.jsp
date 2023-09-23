<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.btn_bas {
				background-color: white;
				color: #004075;
				border: 1px solid #004075;
				height: 30px;
				width: 70px;
				text-decoration: none;
				font-size: 15px;
				border-radius: 4px;
				font-weight: bold;
				cursor: pointer;
				margin-right: 20px;
			}
			/* input[type=button] {
				height: 30px;
				width: 70px;
				text-decoration: none;
				font-size: 15px;
				border-radius: 4px;
				font-weight: bold;
				cursor: pointer;
				margin-right: 20px;
			} */
			.sub_name{
				font-size: 18px;
	    		letter-spacing: -1px;
				margin:15px;
			}
			#listimage{
				width:110px;
				height:130px;
				cursor:pointer;
			}
			
			.baesong{
					border: 2px solid #EAEAEA;
					padding: 6px;
				    height: 20px;
   					font-size: 13px !important;
   					background-color: #F6F6F6;
   					margin-left:70px;
			} 	
			.baesong:hover{
							background-color:#EAEAEA;
						}
			.baesongimg{
						width:5px; 
						height:5px;
						margin-left:5px;
						margin-bottom:2px;
						
			}	
			#hiddendiv{
				background-color: #FFFFFF;
				border:solid 1px #000000;
				height: 225px;
				width: 300px;
				display:flex; 
				position:absolute;
				top: 65%;
				left: 33%;
				display:none;	
				padding-right:10px;	
				padding-left:10px;		
			}
			
			th{
				    padding: 0 5px 0 3px;
	  				border-bottom: 1px solid #e8e8e8;
				    color: #444;
				    font-size: 13px;
				    text-align: left;
			}
			.hiddentd{
				    padding: 8px 0 8px 12px;
				    color: #666;
				    font-size: 12px;
				    border-bottom: 1px solid #e8e8e8;
			}
			
			#hiddenstrong{
					width: 100px;
					display: block;
				    height: 27px;
				    padding: 10px 0 0 10px;
				    color: #222;
			}			
			#hiddenid{
				cursor:pointer;
			}
			
			.hiddentd2{
				    padding: 8px 0 8px 12px;
				    color: #666;
				    font-size: 12px;
		
			}
		
		</style>
		<script type="text/javascript">
			function list_delete(f){
				
				if(!confirm('주문을 취소하시겠습니까?')){
					return;
				}
				
				f.method="POST";
				f.action="buylist_delete.do";
				f.submit();				
				
			}		
			
			function clickx(){
				var div = document.getElementById("hiddendiv");				
				if(div.style.display === 'none')  {
				    div.style.display = 'block';
				}else {
				    div.style.display = 'none';
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page="../layout/header.jsp"/>
		
		<div id="hiddendiv">
			<table style=" border-spacing: 0px;">		
				<tr>
					<td align="left">
						<strong id="hiddenstrong">등급혜택안내</strong>
					</td>
					<td align="right">
						<img id="hiddenid" src="resources/sun/x.png" onclick="clickx()">
					</td> 
				</tr>
				<tr>
					<th align="left">&nbsp;&nbsp; 회원등급</th>
					<td class="hiddentd" align="left">몬스터볼등급</td>
				</tr>
				<tr>
					<th align="left">&nbsp;&nbsp; 추가할인</th>
					<td class="hiddentd" align="left">0월이상 구매시 상품 판매금액의 0.0% 추가 할인</td>
				</tr>
				<tr>
					<th align="left">&nbsp;&nbsp; 중복 할인</th>
					<td class="hiddentd" align="left">0원이상 구매시 상품 판매금액의 0.0% 추가 할인</td>
				</tr>
				<tr>
					<th align="left" style="border-bottom: 0px solid #e8e8e8;">&nbsp;&nbsp; 추가 적립</th>
					<td class="hiddentd2" align="left">0원이상 구매시 구매금액당 0.0% 추가 적립</td>
				</tr>
				
				
			</table>	
		</div>
		
		<table width="1000" align="center">	
			<tr>
        		<td colspan="2" height="100" align="center">
        		<font size="4px"><b class="title">구매내역</b></font>
        		<hr style="border: solid 1px #123858;"></td>
      	    </tr>
      	</table> 
      	
      	<table width="800" align="center" style="border: 1px solid #D5D5D5; margin-bottom: 40px;">	
			<tr>
        		<td height="180px" width="310px">
        			<font size="2px" style="margin-left:65px;">${id.id}님의</font><br>
        			<b style="margin-left:65px;">회원등급은 몬스터볼등급 입니다.</b><br><br>
        			 <a href="javascript:clickx();" class="baesong">등급혜택보기<img src="resources/sun/button.png" class="baesongimg"></a>
        		</td>
        		<td align="right">
        			<img style="margin-right:15px;" src="resources/pic/inpg/icon2.png"><br>
        			<b style="margin-right:20px;">쿠폰</b><br>
        			<label style="margin-right:23px;">0장</label>        			
        		</td>
        		<td align="center" width="200px">
        			<img src="resources/pic/inpg/icon3.png"><br>
        			<b>마일리지</b><br>
        			0원  
        		</td>
      	    </tr>     
      	</table> 
      	
      	<c:if test="${empty list }">
      		<table width="550" align="center" style="margin-bottom: 0px;">
				<tr>
					<td align="center">
						<img src="resources/logo/search.png">
					</td>
				</tr>
				<tr>
					<td align="center" style="color:#717171;">
						<font size="5px"><b>구매한 상품이 없습니다.</b></font>
					</td>
				</tr>	 
			</table>    	
      	</c:if>
      	
      	
      	<c:forEach var="list" items="${list }">   	
      		<table width="550" align="center" style="margin-bottom: 0px;">
      			<tr height="40" border="1">
      				<td>
      					<b>${fn:split(list.buyregdt,' ')[0]}</b>
      				</td>
					<td colspan="3" align="right" style="color:#717171;">
						<font size="2px" style="margin:15px;"><b>상품별 주문번호 ${list.buylist_idx }</b></font>
					</td>
				</tr>
			</table>
	      	<table width="550" align="center" style="margin-bottom: 15px; border-top:  1px solid #000000;">
				<tr>
					<td rowspan="3" width="50">
						<img id="listimage" src="resources/productImage/${list.image }" onclick="location.href='detail_view.do?product_idx=${list.product_idx}'">
					</td>
				</tr>
				<tr height="70px">				
					<td>					
						<b class="sub_name">${list.name }</b>
					</td>
					<td align="center" style="color:#004075;">
						<font size="2px"><b style="margin-right: 20px;">상품준비중</b></font>
					</td>
				</tr>
				
		
				<tr>
				
					<td>					
						<font size="2px" color="#717171" style="margin:15px;"><b>수량:${list.buy_count }개</b></font><br>
						<b style="margin:15px;"><f:formatNumber value="${list.price * list.buy_count}" type="number"/><font size="2px">원</font></b>
					</td>
					<td align="right" width="10">	
						<form>			
							<input type="hidden" value="${list.buylist_idx }" name="buylist_idx">
							<input type="button" value="취소" class="btn_bas" onclick="list_delete(this.form)">
						</form>
					</td>
				</tr>
				<tr height="10">
					<td colspan="3" style="background-color: #EAEAEA;">
					</td>
				</tr>
			</table>			
		</c:forEach>
		
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>