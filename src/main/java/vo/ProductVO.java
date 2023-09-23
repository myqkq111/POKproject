package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;



@Data
public class ProductVO {
	
	private int product_idx, price, inven, hit, sale_count;
	private String cate, name, image, content, regdt, content_img;
	private MultipartFile imageFile, imageDetail;
	

}
