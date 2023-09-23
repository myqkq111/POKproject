package com.korea.pok;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import util.Common;
import vo.MemberVO;
import vo.ProductVO;

@Controller
public class AdminController {
	
	

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	
	
	@Autowired
	MemberDAO member_dao;
	
	@Autowired
	ProductDAO product_dao;
	
	
	@Autowired
	AdminDAO admin_dao;
	
		
	
		// 관리자 페이지
		@RequestMapping("admin.do")
		public String admin(Model model) {
			List<MemberVO> list = member_dao.selectList();
			model.addAttribute("m_list", list);
			
			List<ProductVO> p_list = product_dao.p_list();
			model.addAttribute("p_list" ,p_list);
			
			// 로그인 유저 타입
			String type = admin_dao.login_user((MemberVO)session.getAttribute("id"));
			model.addAttribute("login_type", type);
			
			
		
		
			
			return Common.VIEW_PATH+"admin/admin.jsp";
			
		}
		
		
		
		
		// 관리자페이지 멤버 수정
		@RequestMapping("member_admin.do")
		public String member_admin(MemberVO vo) {
			
			int res = admin_dao.admin_member_update(vo);
			
			
			
			
			if(res > 0) {
			
				return "admin.do";
			}
			
			
			return null;
			
			
		}
		
		
		
		// 관리자 멤버 삭제
				@RequestMapping("member_admin_delete.do")
				public String admin_delete(String id) {
					
					
					int res = member_dao.member_delete(id);

					if(res > 0) {
						
						
						return "admin.do";
					}
					
					
					return null;	
					
					
				}
				
				
				
				
				
				//관리자 상품 변경
				@RequestMapping("product_admin_form.do")
				public String admin_p_updateForm(String idx , Model model) {
					
					ProductVO vo = product_dao.selectOne(idx);
					
					model.addAttribute("p" , vo);
							
							
					return Common.VIEW_PATH+"product/product_update.jsp";
				}
				
				
				// 관리자 상품 삭제
				@RequestMapping("product_admin_delete.do")
				public String product_delete(String idx) {
					
					
					int res = product_dao.product_delete(idx);

					if(res > 0) {
						
						
						return "admin.do";
					}
					
					
					return null;	
					
					
				}
		
		
		
		
		
		

}
