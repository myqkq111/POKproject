<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>POK::물품카테고리</title>
		
		<!-- 파비콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		
		<link rel="stylesheet" href="resources/css/product/cate_page.css">
	</head>
	<body>
	
		<!-- 상단 -->
		<jsp:include page="../layout/header.jsp"/>
	
		<table border="0" width="1000" align="center">
			<tr>
				<td colspan="4" align="right">홈 > ${cate }</td>
			</tr>	
			<tr>
        		<td colspan="4" height="100" align="center"><b class="title">${cate }</b><hr style="border: solid 1px #123858;"></td>
      	    </tr>      	
      	    <c:if test="${not empty list }">    
      	    	<tr>
      	    		<td colspan="4" align="right">
      	    			<b>상품 ${res}개</b>
      	    		</td>
      	    	</tr>     	    	    
		      	    <tr align="right">		      	    	
	      	    		<td colspan="4">	
	      	    		<hr> 	     
	      	    			<c:if test="${standard eq '신상품순' }">
	      	    				<input type="radio" id="array_new" name="array" value="신상품순" checked onclick="location.href='cate_array.do?cate=${cate}&standard=신상품순&res=${res }'">
	      	    			</c:if>
	      	    			<c:if test="${standard ne '신상품순' }">
	      	    				<input type="radio" id="array_new" name="array" value="신상품순" onclick="location.href='cate_array.do?cate=${cate}&standard=신상품순&res=${res }'">
	      	    			</c:if>		      	    
	          				<label for="array_new" class="arr"><span class="img"></span>신상품순</label> 
	          				
	          				<c:if test="${standard eq '판매인기순' }">
	      	    				<input type="radio" id="array_best" name="array" value="판매인기순" checked onclick="location.href='cate_array.do?cate=${cate}&standard=판매인기순&res=${res }'">
	      	    			</c:if>
	      	    			<c:if test="${standard ne '판매인기순' }">
	      	    				<input type="radio" id="array_best" name="array" value="판매인기순" onclick="location.href='cate_array.do?cate=${cate}&standard=판매인기순&res=${res }'">
	      	    			</c:if>			      	    		
	          				<label for="array_best" class="arr"><span class="img"></span>판매인기순</label> 
	          				
	          				<c:if test="${standard eq '낮은가격순' }">
	          					<input type="radio" id="array_low" name="array" value="낮은가격순" checked onclick="location.href='cate_array.do?cate=${cate}&standard=낮은가격순&res=${res }'">
	          				</c:if>
	          				<c:if test="${standard ne '낮은가격순' }">
	          					<input type="radio" id="array_low" name="array" value="낮은가격순" onclick="location.href='cate_array.do?cate=${cate}&standard=낮은가격순&res=${res }'">
	          				</c:if>		      	    
	          				<label for="array_low" class="arr"><span class="img"></span>낮은가격순</label>
	          				 
	          				<c:if test="${standard eq '높은가격순' }">
	          					<input type="radio" id="array_high" name="array" value="높은가격순" checked onclick="location.href='cate_array.do?cate=${cate}&standard=높은가격순&res=${res }'">
	          				</c:if>
	          				<c:if test="${standard ne '높은가격순' }">
	          					<input type="radio" id="array_high" name="array" value="높은가격순" onclick="location.href='cate_array.do?cate=${cate}&standard=높은가격순&res=${res }'">
	          				</c:if>	 		      	    	
	          				<label for="array_high" class="arr"><span class="img"></span>높은가격순</label>	   
	          			<hr>    
	      	    	</td>
	      	    </tr>	      	 
	      	</c:if>
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
						<font size="5px"><b>등록된 상품이 없습니다.</b></font><br>
					</td>
				</tr>	 
			</table>   
		</c:if>			
		
		<c:if test="${not empty list }">
			<div class="container">
				<c:forEach var="list" items="${list }">
				 	<c:if test="${list.inven >= 1 }">
					  	<div class="child-container" style="position:relative;">			 	
					 		<a href="detail_view.do?product_idx=${list.product_idx }" >
								<img class="gf" src="resources/productImage/${list.image }"style="position:absolute;" >
								<img class="gf" src="resources/pic/click/ball_click.png"><br><br>
								<div class="gf2"><strong>${list.name }</strong></div>
						     	<div class="gf3"><strong><f:formatNumber value="${list.price }" type="number"/></strong>원</div>				
						    	<div class="gf4" style="position:relative;" >조회수 : ${list.hit} </div>
						     	<div style="position:absolute; left: 18%; ">
						     		<c:if test="${list.hit >= 5 }">
							 	 		<img src="resources/pic/hot-item.png" style="width:40px;"><p class="typing-txt">Hot🔥</p> 
							 		</c:if>
						 		</div>
						    </a>					      
						    <br><br>  
						</div> 
					</c:if>	
					<c:if test="${list.inven < 1 }">
						<div class="child-container" style="position: relative;">
							<img class="gf5" src="resources/productImage/${list.image }">
							<div style="position: absolute; top:-22px; left:25px;">
								<img class="gf1" src="resources/logo/soldout-.png">	
							 </div><br><br>
							 <div class="gf2"><strong>${list.name }</strong></div><br>
						     <div class="gf3"><strong><f:formatNumber value="${list.price }" type="number"/></strong>원</div>				
						     <div class="gf4">조회수 : ${list.hit} </div>	
						</div>	
					</c:if>	
				</c:forEach>
			</div>
		</c:if>				
		
		<!-- 하단 -->
		<jsp:include page="../layout/footer.jsp"/>	
		
	</body>
</html>