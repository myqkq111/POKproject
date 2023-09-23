package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import dao.AdminDAO;
import dao.BasketDAO;
import dao.BoardDAO;
import dao.BuylistDAO;
import dao.MemberDAO;
import dao.ProductDAO;



@Configuration
//스프링이 자동으로 개발자의 메소드를 호출하기 전에 가로챌 수 있게 하는 옵션
@EnableAspectJAutoProxy //Advice자체를 다른 클래스를 사용하기 위해서는 @EnableAspectJAutoProxy이 필요하다.
public class Context_3_dao {
	

	@Bean 
	public AdminDAO admin_dao(SqlSession sqlSession) {
		
		return new AdminDAO(sqlSession);
		
	}
	
	
	
	@Bean 
	public MemberDAO member_dao(SqlSession sqlSession) {
		
		return new MemberDAO(sqlSession);
		
	}
	
	
	@Bean
	public ProductDAO product_dao(SqlSession sqlSession) {
		return new ProductDAO(sqlSession);
	}
	
	
	@Bean
	public BasketDAO basket_dao(SqlSession sqlSession) {
		return new BasketDAO(sqlSession);
	}
		
	
	@Bean
	public BuylistDAO buylist_dao(SqlSession sqlSession) {
		return new BuylistDAO(sqlSession);
	}
	
	
	@Bean
	public BoardDAO board_dao(SqlSession sqlSession) {
		return new BoardDAO(sqlSession);
	}
	
}
