<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<link rel="stylesheet" href="resources/css/product/detail_view.css">
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			function cal(){
				var num = document.getElementById('num').value;
				var mul = num * ${vo.price};
				var price = $('.price');
				
				for(var i=0; i<price.length; i++){
					price[i].value = mul;
				}
			}
			
			function clickx(){
				var div = document.getElementById("hiddendiv");		
				
				if(div.style.display === 'none')  {
				    div.style.display = 'block';
				}else {
				    div.style.display = 'none';
				}
			}		
			
			function basket_send(f){	
				var member_idx = f.member_idx.value.trim();
				var product_idx = f.product_idx.value.trim();		
				
				if(member_idx == ""){
					alert("로그인 후 이용 가능합니다.")
					window.scrollTo({ top: 0, behavior: "smooth" });
					return;
				}
				
				if(product_idx == ""){
					alert("상품이 존재하지 않습니다.")
					return;
				}				
				
				 if(!confirm("장바구니에 등록하시겠습니까?")){			
					retrun;
				}
		
				f.method="POST";
				f.action="basket_insert.do";
				f.submit();		
			}
			
			function basket_send_buy(f){		
				var member_idx = f.member_idx.value.trim();
				var product_idx = f.product_idx.value.trim();	
				
				if(member_idx == ""){
					alert("로그인 후 이용 가능합니다.")
					window.scrollTo({ top: 0, behavior: "smooth" });
					return;
				}
				
				if(product_idx == ""){
					alert("상품이 존재하지 않습니다.")
					return;
				}
				
				f.method="POST";
				f.action="basket_buy.do";
				f.submit();			
			}		
		</script>
	</head>
	<body>
	
		<!-- 상단 -->
		<jsp:include page="../layout/header.jsp" />
	
		<div id="hiddendiv" >
			<table style=" border-spacing: 0px;">		
				<tr>
					<td align="left">
						<strong id="hiddenstrong">금액별배송비</strong>
					</td>
					<td align="right">
						<img id="hiddenid" src="resources/sun/x.png" onclick="clickx()">
					</td> 
				</tr>
				<tr>
					<th align="left">&nbsp;&nbsp; 0원 이상~50,000원 미만</th>
					<td class="hiddentd" align="left">3,000원</td>
				</tr>
				<tr>
					<th align="left">&nbsp;&nbsp; 50,000원 이상~</th>
					<td class="hiddentd" align="left">0원</td>
				</tr>
				<tr>
					<td align="left" colspan="2">
						<ul id="hiddenul">
							<li>배송비 계산 기준 : 판매가 + 옵션가 + 추가상품가 + 텍스트옵션가 - 상품할인가 - 상품쿠폰할인가
						</ul>
					</td>
				</tr>
			</table>	
		</div>
		
		<table class="table_view">
			<tr>
				<td colspan="2" align="right">
					<div id="backdiv">
						<img src="resources/sun/backimg.png" onclick="history.back()" title="뒤로가기">
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="10" class="view_img_wrap"><img class="view_img" 
					src="resources/productImage/${vo.image }"></td>
			</tr>
			<tr>	
				<td colspan="2">
					<span class="sub_title" name="good_num">[ 상품번호:${vo.product_idx } ]</span><br>
					<strong class="sub_name">${vo.name }</strong>
					<hr style="border: solid 1px #123858;"/>
				</td>
			</tr>
			<tr>
				<td>
					<pre><font color="#555555">판매가</font>      <font size="5px" color="#666666"><b><f:formatNumber value="${vo.price }" type="number"/></b></font>원</pre>
				</td> 
			</tr>		
			<tr>
				<td>
					<pre><font color="#555555">구매제한</font>     <font size="2px" color="#717171">최소 1개</font> <font size="3px" color="#717171"><b>(재고 ${vo.inven}개)</b></font></pre>
				</td> 
			</tr>		
			<tr>
				<td colspan="2">
					<pre><font color="#555555">배송비</font>       <font size="2px" color="#717171">3000원</font></pre>
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <a href="javascript:clickx();" class="baesong">조건별배송<img src="resources/sun/button.png" class="baesongimg"></a>
				</td>
			</tr>		
			<tr>
				<td colspan="2">
					<pre><font color="#555555">브랜드</font>       <font size="2px" color="#717171">포켓몬</font></pre>
				</td>
			</tr>		
			<tr>
				<td colspan="2">
					<pre><font color="#555555">제조사</font>       <font size="2px" color="#717171">The Pokemon Company(포켓몬코리아)</font></pre>
					<hr color="#EAEAEA" />
				</td>
			</tr>		
			<tr>
				<td colspan="2" height="60">
					<div style="display:flex; background-color:#F6F6F6; border-bottom:solid #EAEAEA 2px;">
						<div style="width: 200px; display:flex;">
							<strong class="sub_name"><font color="#111111">${vo.name }</font></strong>
						</div>
						<div style="margin:auto;">
							<input type="number" id="num" min="0" max="${vo.inven }" style="width:60px; height:23px; text-align:center; " value="1" style="width: 50px;" onclick="cal()">
						</div>
					</div>
				</td>
			</tr>		
			<tr>
				<td colspan="2" align="right">
					<b>총 상품금액</b>
					<b><input class="price" value="<f:formatNumber value="${vo.price }" type="number"/>" size="5px" onfocus="this.blur()" readonly>원</b>
					<hr width="220" align="right" color="#EAEAEA" />
				</td>
			</tr>		
			<tr>
				<td colspan="2">
					<form>
						<input type="hidden" id="member_idx" name="member_idx" value="${id.member_idx}">
						<input type="hidden" id="product_idx" name="product_idx" value="${vo.product_idx }">
						<button class="btn_bas" type="button" onclick="basket_send(this.form)">장바구니</button>
						<button class="btn_pur" type="button" onclick="basket_send_buy(this.form)">구매하기</button>
					</form>
				</td>
			</tr>	
			<tr>
				<td height="20px" class="bottomborder"></td>
			</tr>	
		</table>
		
		<table align="center" style="margin-top: 100px;" cellpadding="0" cellspacing="0">
	 		<tr id="content" height="45px">
	 			<td width="15px" style="border-bottom: 3px solid #004075;"></td>
	 			<td width="160px" class="click" align="center"><a href="#content">상품상세정보</a></td>
	 			<td width="160px" class="right" align="center"><a href="#baesong">배송안내</a></td>
	 			<td width="160px" class="right" align="center"><a href="#exchange">교환 및 반품안내</a></td>
	 			<td width="540px" style="border-bottom: 3px solid #004075;"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="5" style="border-top: 3px solid #004075;"></td>
	 		</tr>
	 	</table>
	 	
	 	<table align="center" width="1000" height="100">
	 		<tr height="45px">
	 			<td align="left">
	 				<b>상품상세정보</b>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td align="center"><img style="margin-top: 100px;" src="resources/contentImage/${vo.content_img }"></td>
	 		</tr>
	 		<tr>
	 			<td align="center"><pre>${vo.content }</pre></td>
	 		</tr>
	 	</table>
	 	
	 	<table align="center" style="margin-top: 100px;" cellpadding="0" cellspacing="0">
	 		<tr id="baesong" height="45px">
	 			<td width="15px" style="border-bottom: 3px solid #004075;"></td>
	 			<td width="160px" class="left" align="center"><a href="#content">상품상세정보</a></td>
	 			<td width="160px" class="click" align="center"><a href="#baesong">배송안내</a></td>
	 			<td width="160px" class="right" align="center"><a href="#exchange">교환 및 반품안내</a></td>
	 			<td width="540px" style="border-bottom: 3px solid #004075;"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="5" style="border-top: 3px solid #004075;"></td>
	 		</tr>
	 	</table>
	 	
	 	<table align="center" width="1000" height="100">
	 		<tr height="45px">
	 			<td align="left">
	 				<b>배송안내</b>
	 			</td>
	 		</tr>
	 		<tr height="45px">
	 			<td align="left">
	 				<font color="#717171">
		 				- 배송비 : 기본배송료는 3,000원 입니다.(도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다) 50,000원 이상 구매시 무료배송입니다.<br>
		 				- 상품의 평균 배송일은 입금 확인 후, 1~5일입니다. 택배사의 사정에 따라 다소 늦어질수 있습니다.<br>
		 				&nbsp;&nbsp;[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]<br>
		 				- 배송 지연이 생길 경우, 포켓몬 스토어 온라인 배너로 배송 지연 공지를 드리고 있사오니, 이 점 참고 부탁 드립니다.
	 				</font>
	 			</td>
	 		</tr>
	 	</table>
	 	
	 	<table align="center" style="margin-top: 100px;" cellpadding="0" cellspacing="0">
	 		<tr id="exchange" height="45px">
	 			<td width="15px" style="border-bottom: 3px solid #004075;"></td>
	 			<td width="160px" class="left" align="center"><a href="#content">상품상세정보</a></td>
	 			<td width="160px" class="left" align="center"><a href="#baesong">배송안내</a></td>
	 			<td width="160px" class="click" align="center"><a href="#exchange">교환 및 반품안내</a></td>
	 			<td width="540px" style="border-bottom: 3px solid #004075;"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="5" style="border-top: 3px solid #004075;"></td>
	 		</tr>
	 	</table>
	 	
	 	<table align="center" width="1000">
	 		<tr height="45px">
	 			<td align="left">
	 				<b>교환 및 반품안내</b>
	 			</td>
	 		</tr>
	 		<tr height="45px">
	 			<td align="left">
	 				<font color="#717171">
		 				- 상품 교환/반품에 대한 문의는 1:1 문의 게시판 또는 문의 게시판에 주문 번호와 함께 남겨주세요.<br>
		 				- 교환/반품 신청은 상품 수령일로부터 7일 이내만 가능합니다.<br>
		 				- 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및 반품이 불가능합니다.<br>
		 				- 고객 변심에 의한 교환/반품은 고객께서 배송비를 부담하셔야 합니다.(제품의 하자, 배송 오류는 제외)<br>
		 				- 일부 상품은 신모델 출시, 부품 가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.<br>
		 				- 신발의 경우, 실외에서 착화하였거나 사용 흔적이 있는 경우에는 교환/반품 기간내라도 교환 및 반품이 불가능 합니다.<br>
		 				- 저단가 상품, 일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순 변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오.	 					 				
	 				</font>
	 			</td>
	 		</tr> 		
	 		<tr height="45px">
	 			<td align="left">
	 				<b>환불안내</b>
	 			</td>
	 		</tr>
	 		<tr height="45px">
	 			<td align="left">
	 				<font color="#717171">
	 					- 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.<br>
	 					- 교환 및 반품 페이지를 함꼐 참고 부탁 드립니다. 						 					 				
	 				</font>
	 			</td>
	 		</tr>
	 	</table>
	 	
		<!-- 하단 -->
		<jsp:include page="../layout/footer.jsp"/>
		
	</body>
</html>