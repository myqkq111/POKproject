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
//@ComponentScan("com.korea.pok") //controller패키지와 dao패키지에 Component의 자식이 있으면 객체를 만들어라, 자동주입을 하게 되면 수동주입은 불가
//컨트롤러 뿐만 아니라 Component의 자식요소를 전부 탐색해서 객체로 만들어준다.
//어노테이션에도 상속관계가 있다
/*
 *@Component
 *	ㄴ@Controller
 *	ㄴ@Service
 *	ㄴ@Repository 
 * */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어 질 수 있다.
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

//	  @Bean 
//	  public InternalResourceViewResolver resolver() {
//	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//	  resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
//	  resolver.setSuffix(".jsp"); return resolver; }
	
	
	
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
