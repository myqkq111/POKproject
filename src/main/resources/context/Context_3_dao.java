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
@EnableAspectJAutoProxy 
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