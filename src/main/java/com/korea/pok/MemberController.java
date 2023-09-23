package com.korea.pok;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminDAO;
import dao.MemberDAO;
import util.Common;
import vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	
	
	@Autowired
	MemberDAO member_dao;
	
	@Autowired
	AdminDAO admin_dao;
	
	
	
	
	//멤버 전체 조회
	@RequestMapping("member_list.do") //맨처음 화면에서 404가 뜨지 않고 바로 보기 위해서 value값에 "/" 입력 
	public String list(Model model) {
		
		List<MemberVO> list = member_dao.selectList();
		model.addAttribute("m_list", list);
		
		
		return Common.VIEW_PATH+"member/member_list.jsp";
	}
	
	
	
	// 회원가입 폼
	@RequestMapping("member_insert_form.do")
	public String member_insert_form() {
		return Common.VIEW_PATH + "member/member_join.jsp";
	}
	
	
	// 회원가입 처리
	@RequestMapping("member_insert.do")
	public String member_insert (MemberVO vo) {
		
		
		int res = member_dao.insert(vo);
		
		
		if(res > 0) {
			return "redirect:main";
		}
		
		return null;
		
	}
	
	
	
	// 중복체크 콜백
	// 중복이 안되면 yes, 중복이 되면 no 
	@RequestMapping("check_id.do")
	@ResponseBody
	public String check_id( String id ) {
		
		int res = member_dao.check_id(id);
		
		if(res > 0) {
			
			return "[{'res' : 'no'}]";
			
		}
		
		return "[{'res' : 'yes'}]";
		
	}
	
	
	
	
	// 멤버 정보수정 이동
	@RequestMapping("memberUpdateform.do")
	public String memberUpdateform() {
		
		
		return Common.VIEW_PATH+"member/memberUpdateform.jsp";
		
	}
	
	// 멤버 수정
	@RequestMapping("member_update.do")
	public String memberUpdate(MemberVO vo) {

		int res = member_dao.update(vo);

		if(res > 0) {
			
			session.removeAttribute("id");
			
			return "redirect:main";
		}
		
		
		return null;	
	}
	
	

	
	// 로그인
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String id , String pw ) {
		
		MemberVO vo = member_dao.loginCheck(id);
		
		if(vo == null) {
			return "[{'result' : 'no_id'}]";
		}
		
		if(!vo.getPw().equals(pw)) {
			return "[{'result' : 'no_pw'}]";
		}
		
		
		session.setAttribute("id", vo);
		
		return "[{'result':'clear'}]";
	}
	
	
	
	//로그아웃
	@RequestMapping("logout.do")
	@ResponseBody
	public String logout() {
		session.removeAttribute("id");
		
		
		return "[{'res':'0'}]";
	}
	
	
	
	
	
	
	

}
