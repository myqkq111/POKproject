package com.korea.pok;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BasketDAO;
import dao.BuylistDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import util.Common;
import vo.BasketVO;
import vo.BuylistVO;
import vo.MemberVO;
import vo.ProductVO;

@Controller
public class MypageController {
	
	
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	
	
	@Autowired
	MemberDAO member_dao;
	@Autowired
	BasketDAO basket_dao;
	@Autowired
	BuylistDAO buylist_dao;
	@Autowired
	ProductDAO product_dao;
	
	
		// 마이페이지
	
		@RequestMapping("mypage.do")
		public String mypage() {
			
			return Common.VIEW_PATH+"member/mypage_member.jsp";
			
		}
		
		
		
		// 회원탈퇴 폼
		@RequestMapping("memberDelete.do")
		public String memberDelete() {
			
			return Common.VIEW_PATH+"member/memberDeleteform.jsp";
			
		}
		
		// 회원탈퇴
		@RequestMapping("m_delete.do")
		public String m_delete(String member_id) {
			
			
			int res = member_dao.member_delete(member_id);

			if(res > 0) {
				
				session.removeAttribute("id");
				
				return "main";
			}
			
			
			return null;	
			
			
		}
		
		
		// 장바구니 이동
		@RequestMapping("basket.do")
		public String basket(Model model) {
			MemberVO vo = (MemberVO) session.getAttribute("id");
			
			List<BasketVO> list = basket_dao.b_selectList(vo.getMember_idx());
			model.addAttribute("b_list", list);
			
			
			return Common.VIEW_PATH+"member/basket.jsp";
		}

		
		// 장바구니 저장
		@RequestMapping(value = "basket_insert.do", produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String basket(int member_idx , int product_idx ,  HttpServletResponse response) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("product_idx", product_idx);						
		
			// 상세페이지 장바구니 확인용
			BasketVO selectOne = basket_dao.b_selectOne(map);
			
	
			if(selectOne != null ) {

				
			String message = "<script> alert('이미 등록된 상품입니다.'); history.go(-1);</script>";
			
			return message;
		     
			} else if(selectOne == null) {
				
	
				int res = basket_dao.b_insert(map);
				

				return "<script> alert('장바구니에 등록되었습니다'); history.back(); </script>"; 
				
			}
			

			return null;
			
			
		}
		
				
				
				
				
		// 장바구니 저장 후 구매 이동
		@RequestMapping(value = "basket_buy.do", produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String buy(int member_idx , int product_idx ,  HttpServletResponse response) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("product_idx", product_idx);						
		
			// 상세페이지 장바구니 확인용
			BasketVO selectOne = basket_dao.b_selectOne(map);
			
			if(selectOne != null ) {
	
			String message = "<script> alert('이미 장바구니에 등록된 상품입니다. 구매를 위해 장바구니로 이동합니다'); location.href='basket.do';</script>";
			
			return message;
		     
			} else if(selectOne == null) {
				
		
				int res = basket_dao.b_insert(map);
				
				return "<script> alert('구매를 위해 장바구니로 이동합니다'); location.href='basket.do'; </script>"; 
				
			}
			
			
			return null;
			
			
		}
				
				
				
				
				
		// 장바구니 삭제
		@RequestMapping("basket_delete.do")
		public String basket_delete(String basket_idx) {
			
			
			int res = basket_dao.basket_delete(basket_idx);

			if(res > 0) {
				
				
				return "basket.do";
			}
			
			
			return null;				
					
		}
		
		
		

		//결제버튼 클릭 후 구매리스트에 등록
				@RequestMapping("buylist_insert.do")
				public String buylist_insert(BuylistVO vo, String product_idx, String buy_count, String basket_idx) {
					
					String[] p_array = product_idx.split(","); //상품idx를 문자열로 한번에 들고와서 split으로 각자 배열에 담는다
					String[] count_array = buy_count.split(","); // 상품갯수 뽑아오기
					String[] b_array = basket_idx.split(","); //장바구니 idx 가져오기
					
					
					MemberVO memberVO = (MemberVO)session.getAttribute("id");
					vo.setMember_idx(memberVO.getMember_idx());			
					
					 
					  int sum = 0; //디비에 등록 횟수
					  				  	
					  
					  	for (int i=0; i<p_array.length; i++) { 
			  			vo.setProduct_idx(p_array[i]);
			  			vo.setBuy_count(count_array[i]);
			  			
			  			HashMap<String, Integer> map = new HashMap<String, Integer>();
			  			map.put("product_idx", Integer.parseInt(p_array[i])); 
			  			map.put("buy_count", Integer.parseInt(count_array[i]));
			  			
			  			int res1 = buylist_dao.buylist_insert(vo); //구매리스트 테이블에 등록하면서
			  			int res2 = basket_dao.basket_delete(b_array[i]); //장바구니 테이블에서는 제거
			  			int res3 = product_dao.b_count(map); //구매갯수만큼 상품의 재고수량에서 빼고 판매량 올리기
			  			
			  			sum += res1;
			  			}
					  	
					  
					  	
					  if(p_array.length == sum) {
							
						  return Common.VIEW_PATH + "product/buyComplete.jsp"; 
						  
					  }			 
													
					return null; 
				}

		//구매내역 페이지이동
		@RequestMapping("buylist.do")
		public String buylist(Model model) {
			MemberVO vo = (MemberVO)session.getAttribute("id");
			List<BuylistVO> list = buylist_dao.buylist(vo.getMember_idx());
			
			model.addAttribute("list",list);
			
			return Common.VIEW_PATH + "product/buylist.jsp";
		}
		
		//구매내역삭제
		@RequestMapping("buylist_delete.do")
		public String buylist_delete(int buylist_idx) {
			int res = buylist_dao.buylist_delete(buylist_idx);
			
			if(res > 0) {
				return "redirect:buylist.do";
			}
			
			
			return null;
		}
		
		
		
		

}
