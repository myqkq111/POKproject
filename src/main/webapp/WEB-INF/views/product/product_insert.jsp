<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="resources/css/product/product_insert.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
			//버튼 클릭 시 실행
			function send(){
				// Get form
				var form = $('#f')[0];
			
				// Create an FormData object 
				var data = new FormData(form);
			
				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url: 'product_insert.do',	// form을 전송할 실제 파일경로
					data: data,
					processData: false,
					contentType: false,
					cache: false,
					timeout: 600000,
					beforeSend : function() {
					    // 전송 전 실행 코드
						var cate = f.cate.value.trim();
						var name = f.name.value.trim();
						var price = f.price.value.trim();
						var imageFile = f.imageFile.value.trim();
						var imageDetail = f.imageDetail.value.trim();
						var inven = f.inven.value.trim();
				
						//유효성 검사
						if(imageFile == ''){
							alert('상품 이미지를 첨부해주새요');
							return;
						}
						if(imageDetail == ''){
							alert('상품내용 이미지를 첨부해주새요');
							return;
						}
						if(name == ''){
							alert('상품 이름을 적어주세요');
							return;
						}
						if(price == ''){
							alert('상품 가격을 적어주세요');
							return;
						}
						if((price < 1) || (price > 9999999999)){
							alert('상품 가격을 다시 적어주세요');
							return;
						}
						if(cate == ''){
							alert('카테고리를 선택해주세요');
							return;
						}
						if((inven < 1) || (inven > 999)){
							alert('수량을 다시 적어주세요');
							return;
						}
						if(inven == ''){
							alert('재고 수량을 적어주세요');
							return;
						}
					},
					success: function (data) {
						// 전송 후 성공 시 실행 코드			
						var data = data;
						var json = (new Function('return' + data))();
						if(json[0].res =='yes'){
							alert('등록 성공');
						    location.href="admin.do"; 
						}else{
							alert('등록 실패');
						}
					},
					error: function (e) {
						// 전송 후 에러 발생 시 실행 코드
						console.log("ERROR : ", e);
					}
				});
			
			}
			
		 	//이미지 파일 등록 시 이미지 띄우기
			function image(input) {
		       if (input.files && input.files[0]) {
		           var reader = new FileReader();
		           reader.onload = function(e) {
		               document.getElementById("plus").src = e.target.result;
		           }
		           reader.readAsDataURL(input.files[0]);
		       } else {
		           document.getElementById("plus").src = "";
		       }
		   } 
		</script>
	</head>
	<body>
		<form id="f" name="product_form" enctype="multipart/form-data" method="POST" action="product_insert.do">
			<div>
				<table class="product_table" style=" width:40%;border:3px solid #004a88;">					
					<tr>
						<td><h1 >상품 등록 상세</h1></td>
					</tr>		
					<tr height="35px">
						<td><h3>상품 이미지</h3></td>
					</tr>
					<tr>
						<td>
							<img id="plus">
						</td>
					</tr>
					<tr>
						<td>
				　			<input class="p_image" type="file" name="imageFile" onchange="image(this)">
						</td>
					</tr>
		
					<tr align="center" height="35px">
						<td><b>상품 설명</b></td>
					</tr>
					<tr>
						<td>
							<textarea class ="content" id="content" name="content" rows="10" cols="50"></textarea>
						</td>
					</tr>
					<tr>
						<td>
				　			<input class="p_image"  type="file" id="imageDetail" name="imageDetail">
						</td>
					</tr>						
					<tr height="40px">
						<td>
							<input class="p_name" id="name" name="name" placeholder="상품이름">
							<input class="p_price"type="number" min="0" max="9999999999" id="price" name="price" placeholder="상품 가격">
	
							<select id="cate" name="cate" style="height: 25px;">
								<option value="">--카테고리--</option>
								<option value="인형">인형</option>
								<option value="문구">문구</option>
								<option value="잡화">잡화</option>
								<option value="출판">출판</option>
							</select>
						</td>
					</tr>				
					<tr height="35px">
						<td><h3>재고 수량</h3></td>
					</tr>				
					<tr height="40px">
						<td>
							<input type="number" min="0" max="999" size="8px" id="inven" name="inven" style="width:75px; height:23px; text-align:center;" placeholder="재고 수량">
						</td>
					</tr>			
					<tr>
						<td>
							<input type="button" class="btn-reg" value="제 품 등 록" onclick="send()">
							<input type="button" class="btn-can" value="등 록 취 소" onclick="location.href='main.do'">
						</td>
					</tr>			
				</table>
			</div>
		</form>					
	</body>
</html>