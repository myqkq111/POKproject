package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;


public class MemberDAO {
SqlSession sqlSession; //실제로 경로를 가지고 DB에 접속하는 객체
	
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//멤버 전체조회
	public List<MemberVO> selectList() {
		List<MemberVO> list = sqlSession.selectList("m.member_list"); //여러 개의 데이터를 vo에 담고, 여러 개의 데이터를 한번에 받기 위해서 list로 받는 것
		return list;
	}
	
	
	// 중복 체크
	public int check_id(String id) {
		int res = sqlSession.selectOne("m.check_id" , id);
		
		return res;
	}
	
	
	
	//멤버 회원가입
	public int insert(MemberVO vo) {
		
		vo.setMember_type("USER");
		
		int res = sqlSession.insert("m.member_insert",vo);
		
		return res;
		
	}	
	
	
	//멤버 정보 수정
	
	public int update(MemberVO vo) {
		
		int res = sqlSession.update("m.member_update",vo);
		return res;
		
	}
	
	
	// 멤버 탈퇴
	public int member_delete(String id) {
		
		int res = sqlSession.delete("m.member_delete" , id);
		
		System.out.println("id" + id);
		return res;	
		
	}


	
	// 로그인
	public MemberVO loginCheck(String id) {
		
		MemberVO vo = sqlSession.selectOne("m.loginCheck",id);
		
		return vo;
		
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	

}
