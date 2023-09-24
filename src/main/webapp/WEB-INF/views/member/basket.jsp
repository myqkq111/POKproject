<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>POK::마이페이지</title>
	
		<!-- 파비콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
			   
	    <link rel="stylesheet" href="resources/css/member/basket.css"/>
	    <link rel="stylesheet" href="resources/css/layout/btn.css"/>
	    
	    <!-- 다음 주소 api -->
	    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	    <script type="text/javascript" src="resources/js/join.js"></script>
	    
	    <!-- 결제 api -->
	    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>	
	    
	    <!-- 아이콘 -->
	    <script src="https://kit.fontawesome.com/0778ba227c.js" crossorigin="anonymous"></script>
	    	
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	    <script src="resources/js/httpRequest.js"></script>	
		<script type="text/javascript">
		
			function b_delete(f){		 
				var basket_idx = f.basket_idx.value.trim();
				 
				if(!confirm("물품을 장바구니에서 제거 하시겠습니까?")){
					 return;
				}
				 
				alert("삭제완료");
				 		 
				f.method="POST";
				f.action="basket_delete.do";
				f.submit();		 
			}
	
	
	
			// 구매수량 올렸을 때 동작
			function cal() {
				var num = $('.num'); // 구매수량
				var price = $('.price'); // 개별 합산 가격
				var b_price = $('.b_price'); // 처음 가격
				var che = $('.che'); // 맨앞 체크박스 input 태그
				var sumValue = 0; // 모든가격 더 할 변수 설정
				var sumInput = document.getElementById("sum"); // 모든 가격을 합친 값을 나타내는 input 태그
				var last_money = document.getElementById("last_money");
				var product_sum = document.getElementById("product_sum");
				var delivery = document.getElementById("delivery");
				  
			  	for (var i = 0; i < price.length; i++) {
					  var mul = parse(num[i].value) * parse(b_price[i].value);
				    
				      price[i].value = mul.toLocaleString();
				      che[i].value = mul;
		
				      // 체크 상태일때만 값을 더해준다
				      if (che[i].checked) {
				      		sumValue += mul;
				      }
				}			  
				
				// 최종적으로 더한 값을 input 태그에 띄워준다
				sumInput.value = format(sumValue);
				  
				if(sumValue >= 50000){
			    	delivery.value = '0원';
			     	last_money.value = sumInput.value+"원";
			    }else{
			    	delivery.value = '3,000원';
			    	if(sumValue == 0){
			    		last_money.value = sumInput.value+"원";
			    	}else{
			    		last_money.value = parseInt(sumValue) + 3000;
			    		last_money.value = format(parse(last_money.value))+"원";
			    	}
				}			  
				//last_money.value = sumInput.value+"원";
				product_sum.value = sumInput.value+"원";
			}
				
			// idx 담을 빈 배열
			var idxes = []; 
		
			// 체크박스 유무
			function che(event) {
				var sumInput = document.getElementById("sum");
			    var value = parse(event.target.value);
			    var last_money = document.getElementById("last_money");
			  
			    // 물품 idx 가져와보기
			    var che = $('.che');
			    var hidden_p_idx = $('.hidden_p_idx');
			    var p_idx = document.getElementById("p_idx");		  
			  
			 	// 체크 되었을때
			    if(event.target.checked)  {
				  sumInput.value = parse(sumInput.value) + value; 		  
				  last_money.value = sumInput.value;
	
				  for (var i = 0; i < hidden_p_idx.length; i++) {									  
					  // 체크가 되어있고 , 배열안에 값이 존재하지 않는다면
					  if (che[i].checked && !idxes.includes(hidden_p_idx[i].value)) {
							   idxes.push(hidden_p_idx[i].value);
					  }		   
				  }			  
				  p_idx.value = idxes;     
				 // 체크상태가 아닐경우 
			    }else {
			        sumInput.value = parse(sumInput.value) - value;

		    	    for (var i = 0; i < hidden_p_idx.length; i++) {
						// 체크상태가 아니고 , 배열에 포함되어있으면 필터작업을 통해 새로운 배열을 만든다 
					    if (!che[i].checked && idxes.includes(hidden_p_idx[i].value)) {
							idxes = idxes.filter((e) => e !== hidden_p_idx[i].value);
					    }
					}  	 
					p_idx.value = idxes;	
			    }
			 
			    //결제 정보에 가격 띄우기
			    var product_sum = document.getElementById("product_sum");
			    var delivery = document.getElementById("delivery");
			    var last_money = document.getElementById("last_money");
			    var sum = document.getElementById("sum").value;
			  
			    product_sum.value = sum;
		
		        if(sum >= 50000){
		     		delivery.value = '0원';
		     	    last_money.value = sum;
		        }else{
		    	    delivery.value = '3,000원';
		    	    if(sum == 0){
		    		    last_money.value = sum;
		    	    }else{
		    		    last_money.value = parseInt(sum) + 3000;
		    	    }  
		        }
		      	      		     
			    // 숫자형식 보기 좋게 포맷
			    sumInput.value = format(parse(sumInput.value));
			    product_sum.value = format(parse(product_sum.value))+'원';
			    last_money.value = format(parse(last_money.value))+'원';
			}

			// 숫자 형식을 바꾸려고 하니까 , 가 없는것과 있는 것끼리 계산이 안된다
			// 그래서 모든 값에서 , 를 제거한뒤 계산한다
			// 또 체크박스 기본값이 String 이라 없으면 null 값이라 계산 안됨
			// 체크박스 value가 null(빈값일 경우) 0 으로 바꿔주고 
			// 아닐 경우 , 를 제거해준다 /g 는 모든 값들 중이다 이게 없으면 처음 , 만 제거 된다. 
			function parse(value) {
				return value === "" ? 0 : parseFloat(value.replace(/,/g, ''));
			}
	
			// 최정적으로 숫자포맷을 알아보기 쉽게 , 를 붙히는 메서드
			function format(number) {
				return number.toLocaleString('ko-KR');
			}
	
			//////////////////// 결제 양식
			function radiocheck1(){					
				document.getElementById('delivery_name').value = null;
				document.getElementById('delivery_tell').value	= null;
				document.getElementById('sample4_postcode').value = null;
				document.getElementById('sample4_roadAddress').value = null;
				document.getElementById('sample4_jibunAddress').value = null;		
			}
			
			function radiocheck2(){
				var name = document.getElementById('name').value.trim();
				var tell = document.getElementById('tell').value.trim();
				var mailaddr = document.getElementById('postcode').value.trim();
				var roadaddr = document.getElementById('roadAddress').value.trim();
				var detailaddr = document.getElementById('jibunAddress').value.trim();
				
				document.getElementById('delivery_name').value = name;
				document.getElementById('delivery_tell').value	= tell;
				document.getElementById('sample4_postcode').value = mailaddr;
				document.getElementById('sample4_roadAddress').value = roadaddr;
				document.getElementById('sample4_jibunAddress').value = detailaddr;		
			}
	
			function pay(){
				var buyer_name = document.getElementById('delivery_name').value;
				var buyer_tell = document.getElementById('delivery_tell').value;
				var buyer_mailaddr = document.getElementById('sample4_postcode').value;
				var buyer_roadaddr = document.getElementById('sample4_roadAddress').value;
				var buyer_detailaddr = document.getElementById('sample4_jibunAddress').value;	
				var buyer_request = document.getElementById('buyer_request').value;
				var p_idx = document.getElementById("p_idx").value;
				var mememail = document.getElementById("mememail").value;
				
			    // 갯수 가져오기
			    var che = $('.che');
			    var num = $('.num');
			    var hidden_p_count = document.getElementById("p_count");
				
			    // 갯수 담을 배열
				var p_count = [];
	
				for (var i = 0; i < che.length; i++) {
					// 체크 상태일때만 값을 더해준다
				    if (che[i].checked) {
				    	p_count.push(num[i].value);	
				    }			 
				}
				
				// 최종적으로 더한 값을 input 태그에 띄워준다
				hidden_p_count.value= p_count;
	  
			  	var p_count = document.getElementById("p_count").value;  	
			  	
			  	//장바구니 idx 가져오기
			  	var bas_idx = $('.bas_idx');
			  	var hidden_basket_idx = document.getElementById('basket_idx');
			  	var b_idx = [];
			  	 
		  		for (var i = 0; i < che.length; i++) {				
					 // 체크 상태일때만 값을 더해준다
				    if (che[i].checked) {
				    	b_idx.push(bas_idx[i].value);	
				    }
			    }
				
	  		    // 최종적으로 더한 값을 input 태그에 띄워준다
			    hidden_basket_idx.value = b_idx;
			  		 
				var basket_idx = hidden_basket_idx.value;
					  
				var reportcheck1 = document.getElementById('reportcheck1');
				var reportcheck2 = document.getElementById('reportcheck2');
				var allcheck = document.getElementById('allcheck');	  
				
				if(!(allcheck.checked && reportcheck2.checked && reportcheck1.checked)){
					alert('약관에 동의해주세요.')
					return;
				}
					 		
				if(buyer_name == ""){
					alert("받으실분 성함을 입력해주세요.")
					return;
				}
				
				if(buyer_tell == ""){
					alert("휴대폰 번호를 입력해주세요.")
					return;
				} 
				
				if(buyer_mailaddr == ""){
					alert("주소를 입력해주세요.")
					return;
				}
				
				if(buyer_roadaddr == ""){
					alert("주소를 입력해주세요.")
					return;
				}
				
				if(p_idx.trim() === ""){
					alert("구매할 물품을 선택해주세요")
					return;
				}
				
				if(!confirm('결제하시겠습니까?')){
					return;
				} 

				var sum = document.getElementById("sum").value;
				var amount = 0;
				
				sum = parseInt(sum.replace(/,/g, "")); //총합의 ,(콤마) 때고 문자열을 숫자열로 바꾼다
		
			    if(sum >= 50000){
			    	amount = sum;
			    }else{		   		    	
			    	amount = sum + 3000;	    	 		    	  
			    }			 	
				
				var IMP = window.IMP; // 생략가능
			  	IMP.init('imp66777782'); // <-- 본인 가맹점 식별코드 삽입
			  	  
			    IMP.request_pay({
			    pg: "html5_inicis",
			    pay_method: "card",
			    merchant_uid : 'merchant_'+new Date().getTime(),
			    name : '포켓몰 상품 구매',
			    amount : amount,
			    buyer_email : mememail,
			    buyer_name : buyer_name,
			    buyer_tel : '010-7531-0153',
			    buyer_addr : buyer_roadaddr,
			    buyer_postcode : buyer_mailaddr
			    }, function(rsp) {
			           if ( rsp.success ) {
			       	   	    //결제가 잘되면
			           	  	location.href="buylist_insert.do?product_idx="+p_idx+"&buyer_name="+buyer_name+"&buyer_tell="+buyer_tell+
					  		"&buyer_mailaddr="+buyer_mailaddr+"&buyer_roadaddr="+buyer_roadaddr+"&buyer_detailaddr="+buyer_detailaddr+
							"&buyer_request="+buyer_request+"&buy_count="+p_count+"&basket_idx="+basket_idx;		        	
			           } else {
			           		var msg = '결제에 실패하였습니다.';
			            	msg += '에러내용 : ' + rsp.error_msg;			            
			            	alert(msg);
			           }
			        }
			    );      		    		  	  		  	  		  	  		  	  		  	  
			 } 

			 function buybuy(){
				 var p_idx = document.getElementById("p_idx").value;
				 var buy_form = document.getElementById("buy_form");
				 
				 if(p_idx.trim() === ""){
						alert("구매할 물품을 선택해주세요")
						return;
					}
				 
				 buy_form.classList.remove("hidden_form");		 
			 }	
			 
			 // 배송비 느낌표!	 
			 window.onload = function(){	
			 		var info_img = document.getElementById("info_img");
					var hidden_info = document.getElementById("hidden_info");
					var hiddendiv = document.getElementById("hiddendiv");
	
					info_img.addEventListener('mouseover', (event) => {
						hidden_info.style.display = "block";
					});
	
					hiddendiv.addEventListener('mouseout', (event) => {
						hidden_info.style.display = "none";
					});					
				}	
		</script>
	</head>
	<body>

		<jsp:include page="../layout/header.jsp"/>
	
		<table width="1050" align="center" border="0">
			<tr>
				<td colspan="10" align="center"> 
					<font size="4px"><b >장바구니 ( ${id.id} )</b></font>
					<hr style="border: solid 1px #123858;"/>
				</td>
			</tr>
		</table>
		
		<div style="border-top: 0px solid #000000; padding:15px 0;" align="center" >	
			<table style=" border-spacing: 0px;">
			    <tr align="center" height="40" class="list" >
			    	<th width="90px" bgcolor="#EAEAEA">구매여부</th>
			    	<th width="80px"  bgcolor="#EAEAEA">번 호 </th>
			        <th width="90px"  bgcolor="#EAEAEA">상 품</th>
			        <th width="200px"  bgcolor="#EAEAEA"><font size="2px">(상품번호)</font> 상품명</th>
			        <th width="120px"  bgcolor="#EAEAEA">담은날짜</th>
			        <th width="60px"  bgcolor="#EAEAEA">재 고</th>
			        <th width="110px"  bgcolor="#EAEAEA">금 액</th>
			        <th width="80px"  bgcolor="#EAEAEA">수 량</th>
			        <th width="110px"  bgcolor="#EAEAEA">합 산</th>
			        <th width="80px" bgcolor="#EAEAEA"></th>
			    </tr>
			    
			    <c:if test="${empty b_list }">
		      		<table width="550" align="center" style="margin-bottom: 0px; margin-top: 60px;">
						<tr>
							<td align="center">
								<img src="resources/logo/search.png">
							</td>
						</tr>
						<tr>
							<td align="center" style="color:#717171;">
								<font size="5px"><b>장바구니에 담겨있는 상품이 없습니다.</b></font>
							</td>
						</tr>	 
					</table>    	
		      	</c:if>			
			
				<c:forEach var="b" items="${b_list}">
				    <tr align="center" height="50">
				    	<td style="border-bottom: 1px solid #BDBDBD">
				    			<input type="checkbox" class="che" name="basket_check" data-toggle="checkbox"  readonly value="${b.price}" onclick="che(event)">  		
				    	</td>
				    	<td style="border-bottom: 1px solid #BDBDBD">${b.basket_idx}</td>
				    	<td style="border-bottom: 1px solid #BDBDBD"><a class="gf" href="detail_view.do?product_idx=${b.product_idx }"><img style= " width:80px;" src="resources/productImage/${b.image }"></a></td>
				        <td style="border-bottom: 1px solid #BDBDBD">
				        	<input type="hidden" class="hidden_p_idx" value="${b.product_idx }">
				        	<font size="2px">( ${b.product_idx } )</font> <b>${b.name } </b>
				        </td>
				        <td style="border-bottom: 1px solid #BDBDBD">${fn:split(b.regdt,' ')[0]}</td>
				        <td style="border-bottom: 1px solid #BDBDBD">${b.inven}</td>
				        <td style="border-bottom: 1px solid #BDBDBD"><b><f:formatNumber value="${b.price }" type="number"/><font size="2px">원</font></b></td>
				        <td style="border-bottom: 1px solid #BDBDBD">
				        	<input type="number" class="num" min="1" max="${b.inven}" style=" text-align:center; " value="1" style="width: 50px;" onclick="cal()">
				        </td>
				        <td style="border-bottom: 1px solid #BDBDBD">
					        <input type="hidden"  class="b_price" value="${b.price }" > 
					        <input class="price" value="<f:formatNumber value='${b.price }' type='number'/>" style="border:0 solid black; text-align: center;" size="5px" onfocus="this.blur()" readonly> 
				        </td>
				        <td style="border-bottom: 1px solid #BDBDBD">
							<form>
								<input type=hidden name="basket_idx" class="bas_idx" value="${b.basket_idx}"/>
								<input type="button" class="btn" value="삭제" class="btn" onclick="b_delete(this.form)">
							</form>
						</td>
				    </tr>
				    <tr>
						<td colspan="10" height="10px"> </td>
					</tr>
				</c:forEach>
			
				<tr>
					<td colspan="10"> </td>
				</tr>
				
				<c:if test="${not empty b_list }">
					<tr height="30px">
		               <td colspan="10" align="right"><div><b> 총 상품금액 :</b> <input type="text" id="sum" size="8px" style="border:0 solid black; font-size:20px; font-weight:bold;color:#d54040; text-align: center;" readonly/> </div></td>
					</tr>	
					<tr height="80px">
						<td colspan="10" align="right">
							<button onclick="buybuy()" class="btn_bas">결제</button>			
						</td>
					</tr>
				</c:if>				
			</table>
			
			<input type="hidden" id="basket_idx">
			<input type="hidden" id="p_idx">
			<input type="hidden" id="p_count">	
			<br>
			<br>
		</div>
	
		<section id="buy_form" class="hidden_form">
		
		<div style="border-top:1px solid #747474; margin:auto; width: 1050px; height: 80px;"></div>
		
		<!-- 이용동의 -->
		<jsp:include page="report.jsp"/>
		
		<div style=" padding:15px 0;" align="center" >
			<table width="800">
			 <tr>
			 	<td align="left">
			 		<h3>주문자 정보</h3>
			 	</td>
			 </tr>
			</table>
			
			<table width="800" style=" border-spacing: 0px;">
				<tr class="nametr">		
					<td class="nametd" width="135px" height="50px" style="border-top: 1px solid #000000;">
						주문하시는 분
					</td>
					<td class="inptd" colspan="4" style="border-top: 1px solid #000000;">
						<input class="inp" size="20" value="${id.name }" id="name" readonly>
					</td>							
				</tr>
				
				<tr class="nametr">
					<td class="nametd"  width="135px" height="50px">휴대폰 번호</td>
					<td class="inptd" colspan="4">
						<input class="inp" size="20" value="${id.tell }" id="tell" readonly>
					</td>			
				</tr>
				
				<tr class="nametr">
					<td class="nametd"  width="135px" height="50px">이메일</td>
					<td class="inptd" colspan="4">
						<input class="inp" size="20" id="mememail" value="${id.email }" readonly>
					</td>			
				</tr>
				
				<tr class="nametr">
					<td class="nametd">거주지</td>
					<td colspan="4" style="border-bottom: 1px solid #BDBDBD;"> <p>
						　<input class="inp" type="text"  size="20" name="mailaddr" id="postcode" value="${id.mailaddr}" readonly><p>
						　<input class="inp" type="text"  size="50" name="roadaddr" id="roadAddress" value="${id.roadaddr}" readonly> <p>
						　<input class="inp" type="text"  size="50" name="detailaddr" id="jibunAddress" value="${id.detailaddr }" readonly>
						<span id="guide" style="color:#999"></span>
					</td>		
				</tr>
			</table>
		</div>
			
		<div style=" padding:15px 0;" align="center">
			<table width="800">
				<tr>
				 	<td align="left">
				 		<h3>배송정보</h3>
				 	</td>
				 </tr>
			</table>
			
			<table width="800" style=" border-spacing: 0px;">
				<tr class="nametr">	
					<td class="nametd" width="135px" height="50px" style="border-top: 1px solid #000000;">
						배송지 확인
					</td>
					<td class="inptd" colspan="4" style="border-top: 1px solid #000000;">
						<input type="radio" name="choice" value="self" class="inp" size="20" onclick="radiocheck1()" checked>
						<label style=" vertical-align:5px">직접 입력</label>
						<input type="radio" name="choice" value="auto" class="inp" size="20" onclick="radiocheck2()">
						<label style=" vertical-align:5px">주문자정보와 동일</label>
					</td>			
				</tr>
				<tr class="nametr">	
					<td class="nameli"  width="135px" height="50px">
						<li>받으실분</li>
					</td>
					<td class="inptd" colspan="4">
						<input class="inp" size="20" id="delivery_name">
					</td>			
				</tr>
				<tr class="nametr">	
					<td class="nameli"  width="135px" height="50px">
						<li>휴대폰 번호</li>
					</td>
					<td class="inptd" colspan="4">
						<input class="inp" size="20" id="delivery_tell">
					</td>			
				</tr>
				<tr class="nametr">	
					<td class="nameli"><li>받으실 곳</li></td>
					<td colspan="4" style="border-bottom: 1px solid #BDBDBD;"> <p>
						　<input type="text"  class="inp" size="20" name="mailaddr" id="sample4_postcode" placeholder="우편번호">
						  <input type="button"  class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <p>
						　<input type="text"  class="inp" size="50" name="roadaddr" id="sample4_roadAddress" placeholder="도로명주소"> <p>
						　<input type="text"  class="inp" size="50" name="detailaddr" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999"></span>
					</td>		
				</tr>		
				<tr class="nametr">	
					<td class="nametd"  width="135px" height="50px">요청사항</td>
					<td class="inptd" colspan="4">
						<textarea id="buyer_request" rows="10" cols="60" style="resize:none; margin-top: 4px;"></textarea>
					</td>			
				</tr>
			</table>
		</div>               
		               
		<div style=" padding:15px 0;" align="center">
			<table width="800">
				<tr>
				 	<td align="left">
				 		<h3>결제정보</h3>
				 	</td>
				</tr>
			</table>
		
			<table width="800" style=" border-spacing: 0px;">
				<tr class="nametr">
					<td class="nametd" width="135px" height="50px" style="border-top: 1px solid #000000;">
						상품 합계 금액
					</td>
					<td class="inptd" colspan="4" style="border-top: 1px solid #000000;">
						<input id="product_sum" style="border:0 solid black;">
					</td>			
				</tr>		
				<tr class="nametr">
					<td class="nametd"  width="135px" height="50px">
						배송비
						<span id="info_img"><i class="fa-sharp fa-solid fa-circle-info" ></i></span>
						<div id="hidden_info" style="display:none;">
						<div id="hiddendiv"align="center">
							<div><strong>금액별배송비</strong></div>	
							<div><b style="color: #666;">0 ~ 50,000원 미만</b><br>3,000원</div>
							<div><b style="color: #666;">50,000원 이상~</b><br>0원</div>	
						</div>              
						</div>               
					</td>
					<td class="inptd" colspan="4">
						<input id="delivery" size="6px" style="border:0 solid black;" readonly/>
					</td>	
				</tr>	
				<tr class="nametr">
					<td class="nametd"  width="135px" height="50px">
						최종 결제 금액
					</td>
					<td class="inptd" colspan="4">
						<input id="last_money" style="border:0 solid black;" readonly/>
					</td>			
				</tr>	
				<tr height="40px">
				</tr>
				<tr>
					<td colspan="5" align="center" height="70px">
						<input type="checkbox" id="allcheck" class="checksize">
						<font size="2px" style="vertical-align: 5px;">
						<b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</font>
						<br>
						<input type="button" value="결제하기" class="btn_bas" onclick="pay()">
					</td>
				</tr>		
			</table>
		</div>               	               
		</section>            
                    
		<jsp:include page="../layout/footer.jsp"/>
		
	</body>
</html>