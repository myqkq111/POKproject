package vo;

import lombok.Data;

@Data
public class BasketVO {

	private int member_idx , product_idx , basket_idx , price, inven; //  member idx , product idx , basket idx , 상품가격
	private String regdt, id, image, name; // 장바구니 등록시간 , member 아이디 , 상품 이미지 , 상품 이름
	
	
}
