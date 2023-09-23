package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {
	
SqlSession sqlSession;
	
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//상품등록
	public int product_insert(ProductVO vo) {
		int res = sqlSession.insert("p.product_insert",vo);
		return res;
	}
	
	
	//상품수정
		public int product_update(ProductVO vo) {
			int res = sqlSession.insert("p.product_update",vo);
			return res;
		}
		
		
		// 상품 전체조회
		public List<ProductVO> p_list(){
			List<ProductVO> list = sqlSession.selectList("p.p_list");
			
			return list;
		}
		
		// 상품 하나 조회
		public ProductVO selectOne(String idx) {
			
			ProductVO vo = sqlSession.selectOne("p.p_one" , idx);
			
			return vo;
		}
		
		
		
		
		
		
		// 관리자 상품 삭제
		public int product_delete(String idx) {
			
			int res = sqlSession.delete("p.product_delete" , idx);
			
			
			return res;	
			
		}

	
	//상품 조회(메인페이지 전시용)
	public List<ProductVO> main_Product(){
		List<ProductVO> list = sqlSession.selectList("p.main_Product");
		return list;
	}
	
	//상품 조회(다음 상품이 있는지 없는지 확인)
	public int nextCheck() {
		int res = sqlSession.selectOne("p.nextCheck");
		return res;
	}
	//상품 조희 더보기(메인페이지 전시용)
	public List<ProductVO> main_Product_plus(HashMap<String, Integer> map){
		List<ProductVO> list = sqlSession.selectList("p.main_Product_plus", map);
		return list;
	}
	
	//상품 조희 더보기(다음 상품이 있는지 없는지 확인)
	public int main_Product_plus_nextCheck(int end) {
		int res = sqlSession.selectOne("p.main_Product_plus_nextCheck",end);
		return res;
	}
	
	//카페고리 페이지 이동
	public List<ProductVO> cate_page(String cate){
		List<ProductVO> list = sqlSession.selectList("p.cate_page",cate);
		return list;
	}
			
	//카페고리 페이지 상품 갯수
	public int pok_count(String cate) {
		int res = sqlSession.selectOne("p.pok_count",cate);
		return res;
	}
	
	//카테고리 페이지 신상품순 정렬
	public List<ProductVO> cate_array_new(String cate){
		List<ProductVO> list = sqlSession.selectList("p.cate_array_new",cate);
		return list;
	}
	
	//카테고리 페이지 판매인기순 정렬
	public List<ProductVO> cate_array_best(String cate){
		List<ProductVO> list = sqlSession.selectList("p.cate_array_best",cate);
		return list;
	}
	
	//카테고리 페이지 낮은가격순 정렬
	public List<ProductVO> cate_array_low(String cate){
		List<ProductVO> list = sqlSession.selectList("p.cate_array_low",cate);
		return list;
	}
	
	//카테고리 페이지 높은가격순 정렬
	public List<ProductVO> cate_array_high(String cate){
		List<ProductVO> list = sqlSession.selectList("p.cate_array_high",cate);
		return list;
	}
	
	//상품 상세페이지
	public ProductVO product_information(int product_idx) {
		ProductVO vo = sqlSession.selectOne("p.product_information",product_idx);
		return vo;
	}
	
	//검색기능
	public List<ProductVO> search(String search){
		List<ProductVO> list = sqlSession.selectList("p.searchs",search);
		return list;
	}
	
	//검색한 상품의 개수
	public int search_count(String search) {
		int res = sqlSession.selectOne("p.search_count",search);
		return res;
	}
	
	//검색페이지 신상품순 정렬(카테고리 선택x)
	public List<ProductVO> search_cateNo_array_new(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateNo_array_new",map);
		return list;
	}
	
	//검색페이지 판매인기순 정렬(카테고리 선택x)
	public List<ProductVO> search_cateNo_array_best(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateNo_array_best",map);
		return list;
	}
	
	//검색페이지 낮은가격순 정렬(카테고리 선택x)
	public List<ProductVO> search_cateNo_array_low(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateNo_array_low",map);
		return list;
	}
	
	//검색페이지 높은가격순 정렬(카테고리 선택x)
	public List<ProductVO> search_cateNo_array_high(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateNo_array_high",map);
		return list;
	}
	
	//검색페이지 신상품순 정렬(카테고리 선택o)
	public List<ProductVO> search_cateYes_array_new(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateYes_array_new",map);
		return list;
	}
	
	//검색페이지 판매인기순 정렬(카테고리 선택o)
	public List<ProductVO> search_cateYes_array_best(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateYes_array_best",map);
		return list;
	}
	
	//검색페이지 낮은가격순 정렬(카테고리 선택o)
	public List<ProductVO> search_cateYes_array_low(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateYes_array_low",map);
		return list;
	}
	
	//검색페이지 높은가격순 정렬(카테고리 선택o)
	public List<ProductVO> search_cateYes_array_high(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cateYes_array_high",map);
		return list;
	}
	
	//검색페이지 카테고리(정렬x)
	public List<ProductVO> search_cate(HashMap<String, String> map){
		List<ProductVO> list = sqlSession.selectList("p.search_cate",map);
		return list;
	}
	
	//검색페이지 카테고리 상품갯수
	public int search_cate_count(HashMap<String, String> map) {
		int res = sqlSession.selectOne("p.search_cate_count",map);
		return res;
	}
						
	//조회수 증가
	public int update_hit(int product_idx) {
		int res =sqlSession.update("p.update_hit",product_idx);
		return res;
		
	}
	
	//구매갯수만큼 상품의 재고수량에서 빼고 판매량 올리기
	public int b_count(HashMap<String, Integer> map) {
		int res = sqlSession.update("p.b_count",map);
		return res;
	}
	

}
