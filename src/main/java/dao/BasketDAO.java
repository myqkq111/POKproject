package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BasketVO;



public class BasketDAO {
	
	
	SqlSession sqlSession; 
	
	public BasketDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//장바구니 리스트
	public List<BasketVO> b_selectList(int member_idx) {
		
		int idx = member_idx;
		
		List<BasketVO> list = sqlSession.selectList("b.basket_list" , idx);
		return list;
		
	}
	
	
	// 장바구니 정보 하나
	public BasketVO b_selectOne(Map<String, Object> map) {
		
	
	return sqlSession.selectOne("b.basket_One",map);
	
	}
	
	
	// 장바구니 추가
	public int b_insert(Map<String, Object> map) {
		int res = sqlSession.insert("b.basket_insert",map);
		
		return res;
	}
	
	
	
	
	// 장바구니 삭제
	public int basket_delete(String basket_idx) {
		
		int res = sqlSession.delete("b.basket_delete" , basket_idx);
		
		
		return res;	
		
	}
	
}
