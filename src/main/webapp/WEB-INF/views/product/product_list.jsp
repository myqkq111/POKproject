<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function p_update(f){
	 
	 var ori_type = f.ori_type.value.trim();
	
	 
	 
	 if(ori_type =="USER"){
		 alert('관리자만 가능합니다')
		 return;
	 }
	  
	 
	f.method="POST";
	f.action="product_admin_form.do";
	f.submit();
	 
	 
}




function admin_p_delete(f){
	
	 
	 var product_idx = f.idx.value.trim();
	 
	 if(!confirm(product_idx +" 번 물품을 삭제 하시겠습니까?")){
		 
		 return;
	 }
	 
	 alert("삭제완료");
	 
	 
	f.method="POST";
	f.action="product_admin_delete.do";
	f.submit();
	 
}


</script>


</head>
<body>


<table class="_list" style="line-height: 45px;">
			<tr>
				<th>NO</th>
				<th>대표이미지</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>가격</th>
				<th>판매량</th>
				<th>재고</th>
				<th>등록일시</th>
				<th></th>
			</tr>
	
	
			<c:forEach var="p" items="${p_list}">
			<tr>
				<td>${p.product_idx}</td>
				<td><a class="gf" href="detail_view.do?product_idx=${p.product_idx }"><img style= " width:120px;" src="resources/productImage/${p.image }"></a></td>
				<td>${p.cate}</td>
				<td>${p.name}</td>
				<td><fmt:formatNumber value="${p.price}" pattern="#,###"/></td>
				<td>${p.sale_count}</td>
				<td>${p.inven - p.sale_count}</td>
				<td>
				<fmt:parseDate value="${p.regdt}" var="regdt" pattern="yyyy-MM-dd HH:mm" />
				<fmt:formatDate value="${regdt}" pattern="yyyy/MM/dd | HH:mm" />
				</td>
				<td>
				<form>
				<input type=hidden name="idx" value="${p.product_idx}"/>
				<input type=hidden name="ori_type" value="${login_type}"/>
					<input type="button" value="물품수정" class="btn" onclick="p_update(this.form)">
					
					<input type="button" value="삭제" class="btn" onclick="admin_p_delete(this.form)">
				</form>
				</td>
			</tr>
</c:forEach>
</table>
</body>
</html>