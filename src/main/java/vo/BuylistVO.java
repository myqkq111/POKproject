package vo;

import lombok.Data;

@Data
public class BuylistVO {
	
	private int buylist_idx, member_idx;
	private String product_idx , buy_count; //basket.jsp에서 컨트롤러로 idx 보낼때 스트링으로 보내기 때문에 바꿔줌 db에서 조회 등 사용할 때 int로 형변환 안해줘도 잘작동한다
	private String buyer_name, buyer_tell, buyer_mailaddr,buyer_roadaddr, buyer_detailaddr, buyer_request, buyregdt;       
	private String image, name; //상품이미지, 상품이름
	private String price; //상품가격

}
