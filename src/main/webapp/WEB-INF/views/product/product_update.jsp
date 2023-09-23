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
				url: 'product_update.do',	// form을 전송할 실제 파일경로
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
						alert('변경 성공');
					    location.href="admin.do"; 
					}else{
						alert('변경 실패');
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
                document.getElementById("ori_main_img").src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById("ori_main_img").src = "";
        }
    } 
		
		
		
		
		function content_image(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                document.getElementById("ori_content_img").src = e.target.result;
	            }
	            reader.readAsDataURL(input.files[0]);
	        } else {
	            document.getElementById("ori_content_img").src = "";
	        }
	    } 
		
		
		
		
		
		
		</script>
		
		
		
	<style>
	#ori_main_img{
		width:220px;
	}
	#ori_content_img{
		width:120px;
	}
	
	</style>
	</head>
	<body>
	
	
	
	<form id="f" name="product_form" enctype="multipart/form-data" method="POST" action="product_update.do">
			<input type="hidden" name="product_idx" value="${p.product_idx}">
			<table class="product_table" style="width:40%; border:3px solid #004a88;" align="center" >			
				
				<tr>
					<td><h1>상품수정</h1></td>
				</tr>
				<tr>
				<td><b>상품메인이미지 :</b><br><img id="ori_main_img"  src="resources/productImage/${p.image }"></td>
				</tr>
		
				
					
				
				<tr>
					<td>
						<h3>교체할 메인 이미지</h3>
			　			<input class="p_image" type="file" name="imageFile" onchange="image(this)">
					</td>
				</tr>
	
				
				<tr align="center" height="35px">
					<td><b>상품 설명</b></td>
				</tr>
				<tr>
					<td>
						<textarea class ="content" name="content" rows="10" cols="50">${p.content}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<b style="font-size:18px;">상품 내용 이미지 </b>: <img id="ori_content_img" src="resources/productImage/${p.content_img}">
						<br><br>
			　			<b style="font-size:18px;">교체 이미지 선택:&nbsp;&nbsp;  </b><input class="p_image"  type="file" name="imageDetail" onchange="content_image(this)">
					</td>
				</tr>
				
			

				<tr height="40px">
					<td>
						상품명
						<input class="p_name"  name="name" placeholder="상품이름" value="${p.name }"><br>
						가격
						<input class="p_price"type="number" min="0" max="9999999999" name="price" placeholder="상품 가격" value="${p.price }">

						<select name="cate">
							<option value="">--카테고리--</option>
							<option value="인형">인형</option>
							<option value="문구">문구</option>
							<option value="잡화">잡화</option>
							<option value="출판">출판</option>
						</select>
					</td>
				</tr>
				<tr height="35px">
					<td><b>재고 수량</b></td>
				</tr>
				<tr>
				<td>
					<input type="number" min="0" max="999" size="8px" name="inven" placeholder="재고 수량" value="${p.inven }">
				</td>
				</tr>
				
				
				<tr>
					<td><br>
						<input type="button" class="btn-reg" value="수 정 " onclick="send()">
						<input type="button" class="btn-can" value="취 소" onclick="history.back()">
					</td>
				</tr>
				
			</table>
		
		</form>
		
	
		
	</body>
</html>