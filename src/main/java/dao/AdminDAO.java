package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class AdminDAO {

	SqlSession sqlSession; //실제로 경로를 가지고 DB에 접속하는 객체
	
	public AdminDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	
	public int admin_member_update(MemberVO vo) {
		
		int res = sqlSession.update("m.admin_member_update",vo);
		return res;
		
	}
	
	
	
	public String login_user(MemberVO vo) {
		String type = sqlSession.selectOne("m.login_userType",vo);
		
		return type;
	}
	
	
	
	
	
	
	
	
}
