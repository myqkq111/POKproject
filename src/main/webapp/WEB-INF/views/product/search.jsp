<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		
		#searchform {
		    width: 100%;
		}
		input:focus::-webkit-input-placeholder {
		    color: transparent;
		}
		input:focus:-moz-placeholder {
		    color: transparent;
		}
		input:focus::-moz-placeholder {
		    color: transparent;
		}
		#searchform input {
		    outline: none;
		}
		#searchform input[type="text"] {
		    background: url(http://2.bp.blogspot.com/-xpzxYc77ack/VDpdOE5tzMI/AAAAAAAAAeQ/TyXhIfEIUy4/s1600/search-dark.png) no-repeat 8px 8px;
		    background-size : auto;
		    border-width: 1px;
		    border-style: solid;
		    font: bold 12px Arial,Helvetica,Sans-serif;
		    color: #004a88;
		    width: 20%;
		    height: 17px;
		    padding: 7px 25px 7px 30px;
		}
		#button-search {
		    position: relative;
		    right: 10px;
		    background: #3e3d3c;
		    border-width: 0px;
		    padding: 4px 0px 7px;
		    width: 10%;
		    height: 33px;
		    cursor: pointer;
		    font: bold 13px Arial, Helvetica;
		    color: #fff;
		    text-shadow: 0 1px 0 #555;
		    border-top-right-radius: 5px;
		    border-bottom-right-radius: 5px;
		}
		#button-search:hover {
		    background: #4f5356;
		}
		#button-search:active {
		    background: #5b5d60;
		    outline: none;
		}
		#button-search::-moz-focus-inner {
		    border: 0;
		}
		#line{
			border: 3px solid #e3e3e3;
		}
		input[type="radio"] {
				  	display: none;
					}			
		input[type="radio"] + label span.img{
			    display:inline-block;
			    width: 22px;height: 22px;
			    margin: -2px 9px 0 4px;
			    font-size: 0;
			    vertical-align: middle;
			    background: url(#) no-repeat;cursor:pointer;
			    }		
		input[type="radio"]:checked + label span.img {
		  		background: url('resources/sun/sun.png') no-repeat;
				}
		.arr{
					font-family:'맑은고딕';
					color: #000000;
					text-align:right;

					}
			
			.arr:hover{
					color: #AAAAAA;
					cursor:pointer;
					}
					
			.container{
				display:flex;
				text-align:center;
				flex-wrap : wrap;
				padding: 15px 240px;
				
				margin:0;
				}
			
			.gf {
			width: 150px;
			height:150px;
			   font-size: 15px;
			}
			
			.gf:hover {
			 opacity: 0.5;
			 filter: alpha(opacity=80);	
			}
			.gf2 { 	
					letter-spacing: -1px;
					margin:auto;
					width:150px;
				   text-align: left;
   				overflow: hidden;
  					 font-size: 18px;
   				line-height: 17px;
  					 height: 30px;
			}
			.gf3 {
				margin:auto;
					width:150px;
				text-align: left;
			      color: #333333;
   				font-size: 15px;
   				font-weight: bold;
			}       	
			.gf4{
				margin:auto;
					width:150px;
				text-align: left;
			      color: #717171;
   				font-size: 13px;
   				font-weight: bold;
			}	
				.child-container{
			    width:25%;	
			    margin-bottom: 50px;				
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
		
		</style>
		<script type="text/javascript">
		
			function search_catego(){
				var cate = document.getElementById('search_cate').value;
				var search = document.getElementById('hidden_search').value; 
				var standard = document.getElementById('hidden_standard').value;	
				
				location.href="search_cate.do?search="+search+"&cate="+cate+"&standard="+standard;  
			}
			
			function searchPage_search(f){						
				f.method="POST";
				f.action="searchPage_search.do";
				f.submit();
			}
			
		</script>
	</head>
	<body>
		<!-- 상단 -->
		<jsp:include page="../layout/header.jsp"/>
		
		<table border="0" width="1000" align="center">
			<tr>
				<td style="border-bottom: 10px solid #FFFFFF" colspan="4" align="left">
					<input type="hidden" value="${res}" id="hidden_res"> <!-- 검색기능에 필요없는 파라미터이기 때문에 form에 안들어감 -->
					<input type="hidden" value="${search}" id="hidden_search">
					<b>검색결과 ${res }개</b>			<!-- form태그 안에 넣어놓으면 겹치기 때문에 따로 빼둔다 -->
				</td>
			</tr>
			<tr>
				<td id="line" height="100" colspan="4" align="center">
					<form id="searchform"> <!-- 검색기능을 위해 필요한 정보들을 form태그 안에 넣어둠 -->
						<input type="hidden" value="${cate}" name="cate">
						<input type="hidden" value="${standard}" id="hidden_standard" name="standard">
                		<input name="search" type="text" value="${search }" size="15">
                		<input id="button-search" type="button" value="검 색" onclick="searchPage_search(this.form)">
               		</form>		
				</td>
			</tr>
						   
			<tr>
				<td align="right" colspan="4" style="border-top: 10px solid #FFFFFF">
      	    		<select id="search_cate" onchange="search_catego()" style="font-size: 15px;">
						<option value="">--카테고리--</option>
						<c:if test="${cate eq '인형' }">
							<option value="인형" selected>인형</option>
						</c:if>
						<c:if test="${cate ne '인형' }">
							<option value="인형">인형</option>
						</c:if>
						<c:if test="${cate eq '문구' }">
							<option value="문구" selected>문구</option>
						</c:if>
						<c:if test="${cate ne '문구' }">
							<option value="문구">문구</option>
						</c:if>
						<c:if test="${cate eq '잡화' }">
							<option value="잡화" selected>잡화</option>
						</c:if>
						<c:if test="${cate ne '잡화' }">
							<option value="잡화">잡화</option>
						</c:if>
						<c:if test="${cate eq '출판' }">
							<option value="출판" selected>출판</option>
						</c:if>
						<c:if test="${cate ne '출판' }">
							<option value="출판">출판</option>
						</c:if>
					</select>
      	    	</td>
			</tr>  	    	    
      	    <tr>		      	    	
     	    		<td align="right" colspan="4">	
     	    		<hr> 	     
     	    			<c:if test="${standard eq '신상품순' }">
     	    				<input type="radio" id="search_array_new" name="array" value="신상품순" checked onclick="location.href='search_array.do?cate=${cate}&standard=신상품순&res=${res }&search=${search }'">
     	    			</c:if>
     	    			<c:if test="${standard ne '신상품순' }">
     	    				<input type="radio" id="search_array_new" name="array" value="신상품순" onclick="location.href='search_array.do?cate=${cate}&standard=신상품순&res=${res }&search=${search }'">
     	    			</c:if>		      	    
         				<label for="search_array_new" class="arr"><span class="img"></span>신상품순</label> 
         				
         				<c:if test="${standard eq '판매인기순' }">
     	    				<input type="radio" id="search_array_best" name="array" value="판매인기순" checked onclick="location.href='search_array.do?cate=${cate}&standard=판매인기순&res=${res }&search=${search }'">
     	    			</c:if>
     	    			<c:if test="${standard ne '판매인기순' }">
     	    				<input type="radio" id="search_array_best" name="array" value="판매인기순" onclick="location.href='search_array.do?cate=${cate}&standard=판매인기순&res=${res }&search=${search }'">
     	    			</c:if>			      	    		
         				<label for="search_array_best" class="arr"><span class="img"></span>판매인기순</label> 
         				
         				<c:if test="${standard eq '낮은가격순' }">
         					<input type="radio" id="search_array_low" name="array" value="낮은가격순" checked onclick="location.href='search_array.do?cate=${cate}&standard=낮은가격순&res=${res }&search=${search }'">
         				</c:if>
         				<c:if test="${standard ne '낮은가격순' }">
         					<input type="radio" id="search_array_low" name="array" value="낮은가격순" onclick="location.href='search_array.do?cate=${cate}&standard=낮은가격순&res=${res }&search=${search }'">
         				</c:if>		      	    
         				<label for="search_array_low" class="arr"><span class="img"></span>낮은가격순</label>
         				 
         				<c:if test="${standard eq '높은가격순' }">
         					<input type="radio" id="search_array_high" name="array" value="높은가격순" checked onclick="location.href='search_array.do?cate=${cate}&standard=높은가격순&res=${res }&search=${search }'">
         				</c:if>
         				<c:if test="${standard ne '높은가격순' }">
         					<input type="radio" id="search_array_high" name="array" value="높은가격순" onclick="location.href='search_array.do?cate=${cate}&standard=높은가격순&res=${res }&search=${search }'">
         				</c:if>	 		      	    	
         				<label for="search_array_high" class="arr"><span class="img"></span>높은가격순</label>	   
         			<hr>    
      	    	</td>
      	    </tr>	      
      	    
      	    <!-- 검색한 상품이 없거나 공백으로 검색 버튼을 눌렀을 경우 -->
			<c:if test="${res == 0 }">
				<tr>
					<td align="center">
						<img src="resources/logo/search.png">
					</td>
				</tr>
				<tr>
					<td align="center" style="color:#717171;">
						<font size="5px"><b>상품이 존재하지 않습니다.</b></font><br>
						<b>다른 검색어를 입력하시거나</b><br>
						<b>철자,띄어쓰기를 확인해주세요.</b>
					</td>
				</tr>
			</c:if>	       	
		</table>
			
			<!-- 검색한 상품이 있을 경우에만 보이기 -->	
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
		</c:if>				
		
		<!-- 하단 -->
		<jsp:include page="../layout/footer.jsp"/>
	</body>
</html>