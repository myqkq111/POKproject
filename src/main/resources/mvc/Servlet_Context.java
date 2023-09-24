package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.pok.AdminController;
import com.korea.pok.BoardController;
import com.korea.pok.MemberController;
import com.korea.pok.MypageController;
import com.korea.pok.ProductController;

import dao.BoardDAO;
import dao.ProductDAO;

@Configuration
@EnableWebMvc
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public MemberController memberController() {		
		return new MemberController();
	}
	
	@Bean
	public ProductController productController(ProductDAO product_dao) {
		return new ProductController(product_dao);
	}
	
	@Bean
	public AdminController adminController() {		
		return new AdminController();
	}

	@Bean
	public MypageController mypageController() {	
		return new MypageController();
	}

	@Bean
	public BoardController boardController(BoardDAO board_dao) {		
		return new BoardController(board_dao);
	}
}