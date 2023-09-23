<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1"> 
    	
    	<!-- 파비콘 -->
	<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
    
		<title>POK몰</title>
		<link rel="stylesheet" href="resources/css/main/simpleBanner.css">
		<link rel="stylesheet" href="resources/css/main/main.css">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="resources/js/httpRequest.js"></script>
    	<script type="text/javascript" src="resources/js/simpleBanner.js"></script>
		<style>			 
			
			#but{
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
			
			.gf1 {
				width: 200px;
				height:200px;
				   font-size: 15px;
				   
				}
			.gf5{
				width: 150px;
				height:150px;
			   font-size: 15px;
			   opacity: 0.3;
			}
			
			.item-container{
				margin:0 auto;
				padding:0 10%;
				
			}
			
			
			
p.typing-txt{
  color:red;
  font-weight:bold;
  position:relative;
  display: inline-block;
  height: 20px; 
  overflow: hidden;
  animation: typingAni 1.5s steps(30, end) 1;
  animation-iteration-count: infinite;
}

@keyframes typingAni {
 /*  0%{width:0%}
  100%{width: 65px}; */
  
   50% {
    opacity: 0;
  }
}
	
		</style>	
		<script type="text/javascript">
	

			  var click = 0;
	
			 
			 function load(){
				 
				 	click++;
				 
					var url = "mainPage_product_plus.do";
					var param = "click="+click;
					sendRequest(url, param, callback, "POST");
				}
							
				 function callback(){
					if(xhr.readyState == 4 && xhr.status == 200){
						var data = xhr.responseText;
						var json = (new Function('return' + data))();

						for (var i = 0; i < (json.length-1); i++) {
		                    image = json[i].image;
		                    name = json[i].name;
		                    price = json[i].price;
		                    hit = json[i].hit;
		                    inven = json[i].inven;
		                    product_idx = json[i].product_idx;	
		                   	
		                    if(inven != 0){
		                    $("#plus").append("<div class=\"child-container\" >"
		                    					+"<a href=\"detail_view.do?product_idx="+product_idx+"\"><img class=\"gf\" src=\"resources/productImage/"+image+"\" style=\"position:absolute;\">"
		                    					+"<img class=\"gf\" src=\"resources/pic/click/ball_click.png\"><br><br>"
		                    					+"<div class=\"gf2\"><strong>"+name+"</strong></div>"
		                    					+"<div class=\"gf3\"><strong>"+price.toLocaleString()+"</strong>원</div>"
		                    					+"<div class=\"gf4\">조회수 : " +hit+ "</div>"
		                    				    +"</a>"
		                    				    +"</div>");
		                    }else{
		                     $("#plus").append("<div class=\"child-container\" style=\"position: relative;\">"
												+"<img class=\"gf5\" src=\"resources/productImage/"+image+"\">"
												+"<div style=\"position: absolute; top:-22px; left:32px;\">"
												+"<img class=\"gf1\" src=\"resources/logo/soldout-.png\">"
												+"</div>"
												+"<div class=\"gf2\"><br><strong>"+name+"</strong></div>"
												+"<div class=\"gf3\"><br><strong>"+price.toLocaleString()+"</strong>원</div>"				
											    +"<div class=\"gf4\">조회수 : " +hit+ "</div>"
												+"</div>");		
		                     }		                    
						} 					
						if(json.length != 20 ){
							var but = document.getElementById("but");
								but.style.display = 'none';
						}
					 }								 	
				 }	 		 							 
		</script>	
	</head>
	<body>
			
		<!-- 상단 -->
		<jsp:include page="../layout/header.jsp"/>
			
		<table border="0" width="1060" align="center">	
			<!-- 광고, 베스트상품 -->
			<tr valign="middle">
           	    <td colspan="2" rowspan="2" class="simple_banner_wrap banner01" data-type="slide">
              	    <ul class="banner01">
                        <li><img src="resources/images/banner/banner1.jpg"></li>
                        <li><img src="resources/images/banner/banner2.jpg"></li>
                        <li><a href="#"><img height="435" src="resources/images/banner/banner3.jpg"></a></li>
                        <li><a href="#"><img height="435" src="resources/images/banner/banner4.jpg"></a></li>
                    </ul>
                </td>
                <td colspan="2" class="simple_banner_wrap banner03" id="back" data-nav-type="prev_next" align="center" >
               	    <ul>
                        <li width="700">
                        	<b class="besttitle"><br>잠자는 피카츄 봉제인형</b><p/>
                            <div style="position: relative;">
                                <a href="#">
                                    <img height="300" src="resources/images/goods/picasleep.jpg" style="position: absolute;">
                     	            <img height="300" src="resources/pic/click/ball_click.png">
                         	    </a>
                            </div>
                            <font size="4px" color="#555555"><br><b>\ 25,000</b></font>
                        </li>
                        
                        <li width="700">
                            <b class="besttitle"><br>쇼와노트 플랫케이스A (L)</b><p/>
                            <div style="position: relative;">
                                <a href="#">
                                    <img height="300" src="resources/images/goods/platcaseA.jpg" style="position: absolute;">
                                    <img height="300" src="resources/pic/click/ball_click.png">
                                </a>
                            </div>
                            <font size="4px" color="#555555"><br><b>\ 6,500</b></font>
                        </li>
                        
               	        <li width="700">
               	        	<b class="besttitle"><br>2016년 신학기 가방</b><p/>
                       	    <div style="position: relative;"> 
                       	    	<a href="#">
                         		    <img height="300" src="resources/images/goods/bag.jpg" style="position: absolute;">
                          		    <img height="300" src="resources/pic/click/ball_click.png">
                    		    </a>
                    		</div>
                       	    <font size="4px" color="#555555"><br><b>\ 79,000</b></font>
                    	</li>
             	    </ul>
          	    </td>
      	    </tr>
      	    
      	    <tr>
                <td colspan="4" height="35"/>
      	    </tr>
			
			<!-- 상품목록 -->
			<tr>
				<td colspan="4" class="title">
					<b>포켓몬 상품</b><br>
					<img src="resources/sun/sun.jpg">
				</td>
			</tr>
		</table>
		
		<!-- 등록된 물품이 없을 경우 -->
		<c:if test="${empty list }">
			<table align="center" width="1000">
				<tr>
					<td align="center">
						등록된 상품이 없습니다
					</td>			
				</tr>
			</table> 
		</c:if>
		
		<br>
		<br>
		
		<div class="item-container">
		<div class="container">
		<!-- 등록된 물품이 있을 경우 -->
		<c:if test="${not empty list }">	
				<c:forEach var="list" items="${list }">
					<c:if test="${list.inven >= 1 }">
					 	<div class="child-container" style="position:relative;">
					 	
					 	
					 	<a href="detail_view.do?product_idx=${list.product_idx }" >
							<img class="gf" src="resources/productImage/${list.image }"style="position:absolute;" >
							<img class="gf" src="resources/pic/click/ball_click.png"><br><br>
							<div class="gf2"><strong>${list.name }</strong></div>
						     <div class="gf3"><strong><f:formatNumber value="${list.price }" type="number"/></strong>원</div>				
						     <div class="gf4" style="position:relative;" >조회수 : ${list.hit} </div>
						     <div style="position:absolute; left: 24%; ">
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
							<div style="position: absolute; top:-27px; left:42px;">
								<img class="gf1" src="resources/logo/soldout-.png">	
							 </div>
							 <div class="gf2"><br><strong>${list.name }</strong></div>
						     <div class="gf3"><br><strong><f:formatNumber value="${list.price }" type="number"/></strong>원</div>				
						     <div class="gf4">조회수 : ${list.hit} </div>	
						</div>	
					</c:if>
				</c:forEach>
		</c:if>	
		</div>
		<!-- 더보기 버튼 눌렀을 때 물품리스트 -->
		<div class="container" id="plus">
		</div> 
		</div>
		
		<!-- 물품을 더 보고싶을 때 버튼 -->
		<c:if test="${not empty list && number == 20 && res == 1}">
			<table width="1000" align="center">
				<tr>
					<td align="center">
						<input id="but" type="button" value="더보기" onclick="load()">
					</td>
				</tr>
			</table>
		</c:if>
		
			
		<!-- 하단 -->
		<jsp:include page="../layout/footer.jsp"/>	
			
	</body>
</html>