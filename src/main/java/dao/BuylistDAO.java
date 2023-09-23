package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BuylistVO;

public class BuylistDAO {
	
	SqlSession sqlSession;
	
	public BuylistDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//결제버튼 클릭 후 구매리스트에 등록
	public int buylist_insert(BuylistVO vo) {
		int res = sqlSession.insert("buy.buylist_insert",vo);
		return res;
	}
	
	//구매내역 페이지이동
	public List<BuylistVO> buylist(int member_idx){
		List<BuylistVO> list = sqlSession.selectList("buy.buylist",member_idx);
		return list;
	}
	
	//구매내역삭제
	public int buylist_delete(int buylist_idx) {
		int res = sqlSession.delete("buy.buylist_delete",buylist_idx);
		return res;
	}
}