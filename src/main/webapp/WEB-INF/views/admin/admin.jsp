<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSns5ofF0boSBplTcCl083LYMtJHS7t8Gj4_w&usqp=CAU">	  
		  
		

<link rel="stylesheet" href="resources/css/admin/admin.css"/>
<link rel="stylesheet" href="resources/css/layout/btn.css"/>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/js/httpRequest.js"></script>

<script type="text/javascript">
window.onload = function(){
	

var sidebar1 = document.getElementById("sidebar1");
var sidebar2 = document.getElementById("sidebar2");
var sidebar3 = document.getElementById("sidebar3");

var t1 = document.getElementsByClassName("user_list");
var t2 = document.getElementsByClassName("product_list");
var t3 = document.getElementsByClassName("product_insert");

sidebar1.addEventListener("click" , function(e){
	
	t1[0].classList.remove('hidden');
	t2[0].classList.add('hidden');
	t3[0].classList.add('hidden');
	
	
	sidebar1.classList.add('tap');
	sidebar2.classList.remove('tap');
	sidebar3.classList.remove('tap');
})


sidebar2.addEventListener("click" , function(e){
	
	t2[0].classList.remove('hidden');
	t1[0].classList.add('hidden');
	t3[0].classList.add('hidden');
	
	sidebar1.classList.remove('tap');
	sidebar2.classList.add('tap');
	sidebar3.classList.remove('tap');
})


sidebar3.addEventListener("click" , function(e){
	
	t3[0].classList.remove('hidden');
	t1[0].classList.add('hidden');
	t2[0].classList.add('hidden');
	
	sidebar1.classList.remove('tap');
	sidebar2.classList.remove('tap');
	sidebar3.classList.add('tap');
})


}  
</script>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>






<main>
	<div align="center" class="sideWrap">
			
			<aside id="sidebar" >
			
				<ul class="sidebar">
				<div id="sidebar1" class="tap" style="padding:50px 0;">
				<a  style="padding:30px; font-size:20px;">
						<b>회원정보 관리</b>
				</a>
				</div>
	
				<div id="sidebar2" style="padding:50px 0;">
				<a  style="padding:30px; font-size:20px;">
						<b>판매물품 관리</b>
				</a>
				</div>
	
				<div  id="sidebar3" style="padding:50px 0;">
				<a  style="padding:30px; font-size:20px;">
					<b>물품 등록</b>
				</a>
				</div>
				</ul>
			
			
			</aside>



	<section id="main_content">
			
		
		<!-- 멤버리스트 -->	
		<div class="user_list">
		<jsp:include page="../member/member_list.jsp" />
		</div>	
			
		
		
		
		<!-- 물품리스트 -->	
		<div  class="product_list hidden">
			<jsp:include page="../product/product_list.jsp" />	
		</div>
		
			
		<!-- 상품 등록 -->	
		<div class="hidden product_insert">
			<jsp:include page="../product/product_insert.jsp"/>
		</div>
		
			
		</section>
		
	</div>	
			
			
			
</main>






<jsp:include page="../layout/footer.jsp"/>
</body>
</html>