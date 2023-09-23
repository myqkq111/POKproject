package com.korea.pok;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BasketDAO;
import dao.ProductDAO;
import util.Common;
import vo.BasketVO;
import vo.MemberVO;
import vo.ProductVO;
@Controller
public class ProductController {
	
	@Autowired
	ServletContext servletContext;
	
	
	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	BasketDAO basket_dao;
	
	@Autowired
	ProductDAO product_dao;


	private BasketVO MemberVO;
	private BasketVO ProductVO;
	
	public ProductController(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	//메인페이지
	@RequestMapping(value={"/","main"})
	public String main(Model model){
		
		List<ProductVO> list = product_dao.main_Product(); //메인에 20개의 상품을 가져온다		
		int res = product_dao.nextCheck(); //다음 상품이 있는지 없는지 확인
		int number = list.size(); //상품의 갯수 체크
		
		
		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
		
		
		model.addAttribute("list",list);
		model.addAttribute("res",res);
		model.addAttribute("number",number);
		
		return Common.VIEW_PATH+"main/main.jsp";
	}
	
	
	//물품 리스트 전체 조회 ( 관리자 페이지용 )
	public String product_list(Model model){
	
		List<ProductVO> list = product_dao.p_list();
		
		model.addAttribute("p_list" ,list);
		
		return Common.VIEW_PATH+"admin/admin.jsp";
		
	}				
	
	//메인페이지 상품 더보기
	@RequestMapping("mainPage_product_plus.do")
	@ResponseBody
	public List<ProductVO> mainPage_product_plus(int click){
		
		int start = click * 20 + 1;
		int end = start + 20 - 1;
	
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<ProductVO> list = product_dao.main_Product_plus(map);
		int res = product_dao.main_Product_plus_nextCheck(end+1);
		
		ProductVO vo = new ProductVO();
		vo.setHit(res);
		
		list.add(vo);
		
		return list;
	}
		
	//상품등록 페이지
	@RequestMapping("product_page.do")
	public String product_page() {
		return Common.VIEW_PATH + "product/product_insert.jsp";
	}
	
	//상품등록
	@RequestMapping("product_insert.do")
	@ResponseBody
	public String product_insert(ProductVO vo) {
		//유효성 검사
		if(vo.getCate().isEmpty() || vo.getName().isEmpty()) {
			return "[{'res':'no'}]";
		}
		
		//상품이미지 절대경로 가져오기
		String ProrelativePath = "/resources/productImage";		
		String ProrealPath = servletContext.getRealPath(ProrelativePath);
		System.out.println(ProrealPath);
		//상품설명 이미지 절대경로 가져오기 
		String ConrelativePath = "/resources/contentImage";		
		String ConrealPath = servletContext.getRealPath(ConrelativePath);

		//상품이미지 이름
		MultipartFile imageFile = vo.getImageFile();
		
		String imageName = "no_file";
		
		if(imageFile != null) {
			imageName = imageFile.getOriginalFilename();
		}
		
		//상품설명 이미지 이름
		MultipartFile imageDetail = vo.getImageDetail();
		
		String detailImageName = "no_file";
		
		if(imageDetail != null) {	
			detailImageName = imageDetail.getOriginalFilename();
			if(detailImageName == null || detailImageName.isEmpty()) {
				detailImageName = "no_file";
			}
		}	
		//혹시 모를 유효성 검사
		if(imageName == "no_file" || detailImageName == "no_file") {
			return "[{'res':'no'}]";
		}
		
		//이미지 절대경로에 저장
		if(imageName != "no_file" && detailImageName != "no_file") {
			File file1 = new File(ProrealPath,imageName); //상품이미지 이름을 담은 파일
			File file2 = new File(ConrealPath,detailImageName); //상품설명 이미지 이름을 담은 파일
			
			if(!file1.exists()) { //경로가 없다면
				file1.mkdirs();	  //경로까지 폴더생성
			}else { // 경로가 있다면 동일파일명이 있다는 것
				//동일파일명 방지
				long time = System.currentTimeMillis();
				imageName = String.format("%d_%s",time,imageName);
				file1 = new File(ProrealPath,imageName);
			}
			
			if(!file2.exists()) { 
				file2.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				detailImageName = String.format("%d_%s",time,detailImageName);
				file2 = new File(ConrealPath,detailImageName);
			}
			
			//이미지 업로드			
			try {
				imageFile.transferTo(file1);
				imageDetail.transferTo(file2);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}								
		}
		
		vo.setImage(imageName);
		vo.setContent_img(detailImageName);	
		
		int res = product_dao.product_insert(vo);
		
		if(res > 0) {
			return "[{'res':'yes'}]";
		}		
		return "[{'res':'no'}]";	
	}
	
	
	//카테고리 페이지 이동
	@RequestMapping("cate_page.do")
	public String cate_page(String cate, Model model) {		
		
		List<ProductVO> list = product_dao.cate_page(cate);	
		int res = product_dao.pok_count(cate);
		
		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
		
		model.addAttribute("list",list); //상품조회
		model.addAttribute("cate",cate); 
		model.addAttribute("res",res);
		
		return Common.VIEW_PATH + "product/cate_page.jsp";
	}
	
	//카테고리 페이지 상품 정렬
	@RequestMapping("cate_array.do")
	public String cate_array(String cate, String standard, int res, Model model) {
		
		List<ProductVO> list = null;
		
		switch(standard) {		
			case "신상품순":{						
					list = product_dao.cate_array_new(cate);	
					break;					
			}
			case "판매인기순":{				
					list = product_dao.cate_array_best(cate);	
					break;
			}			
			case "낮은가격순":{				
					list = product_dao.cate_array_low(cate);	
					break;
			}			
			case "높은가격순":{				
					list = product_dao.cate_array_high(cate);	
					break;
			}						
		}
		
		model.addAttribute("list",list);
		model.addAttribute("cate",cate);
		model.addAttribute("standard",standard);
		model.addAttribute("res",res);
		
		return Common.VIEW_PATH + "product/cate_page.jsp";
	}
	
	
	
	// 물품 변경
		@RequestMapping("product_update.do")
		@ResponseBody
		public String product_update(ProductVO vo) {
			//유효성 검사
			if(vo.getCate().isEmpty() || vo.getName().isEmpty()) {
				return "[{'res':'no'}]";
			}
			
			//상품이미지 절대경로 가져오기
			String ProrelativePath = "/resources/productImage";		
			String ProrealPath = servletContext.getRealPath(ProrelativePath);
			//상품설명 이미지 절대경로 가져오기 
			String ConrelativePath = "/resources/contentImage";		
			String ConrealPath = servletContext.getRealPath(ConrelativePath);

			//상품이미지 이름
			MultipartFile imageFile = vo.getImageFile();
			
			String imageName = "no_file";
			
			if(imageFile != null) {
				imageName = imageFile.getOriginalFilename();
			}
			
			//상품설명 이미지 이름
			MultipartFile imageDetail = vo.getImageDetail();
			
			String detailImageName = "no_file";
			
			if(imageDetail != null) {	
				detailImageName = imageDetail.getOriginalFilename();
				if(detailImageName == null || detailImageName.isEmpty()) {
					detailImageName = "no_file";
				}
			}	
			//혹시 모를 유효성 검사
			if(imageName == "no_file" || detailImageName == "no_file") {
				return "[{'res':'no'}]";
			}
			
			//이미지 절대경로에 저장
			if(imageName != "no_file" && detailImageName != "no_file") {
				File file1 = new File(ProrealPath,imageName); //상품이미지 이름을 담은 파일
				File file2 = new File(ConrealPath,detailImageName); //상품설명 이미지 이름을 담은 파일
				
				if(!file1.exists()) { //경로가 없다면
					file1.mkdirs();	  //경로까지 폴더생성
				}else { // 경로가 있다면 동일파일명이 있다는 것
					//동일파일명 방지
					long time = System.currentTimeMillis();
					imageName = String.format("%d_%s",time,imageName);
					file1 = new File(ProrealPath,imageName);
				}
				
				if(!file2.exists()) { 
					file2.mkdirs();
				}else {
					long time = System.currentTimeMillis();
					detailImageName = String.format("%d_%s",time,detailImageName);
					file2 = new File(ConrealPath,detailImageName);
				}
				
				//이미지 업로드			
				try {
					imageFile.transferTo(file1);
					imageDetail.transferTo(file2);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}								
			}
			
			vo.setImage(imageName);
			vo.setContent_img(detailImageName);	
			
			int res = product_dao.product_update(vo);
			
			if(res > 0) {
				return "[{'res':'yes'}]";
			}		
			return "[{'res':'no'}]";	
		}
	
	
	
	
	
	
			
	//상품 상세페이지
	@RequestMapping("detail_view.do")
	public String detail_view(int product_idx, Model model) {
		
		ProductVO vo = product_dao.product_information(product_idx);
		
		
		//조회수 증가
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			int res = product_dao.update_hit(product_idx);
			session.setAttribute("show", "0");
		}
		
		
		model.addAttribute("vo",vo);
		
		
		
		return Common.VIEW_PATH + "product/detail_view.jsp";
	}
	
	//검색기능
	@RequestMapping("search.do")
	public String search(String search, Model model) {

		//아무것도 적지않고 검색버튼을 눌렀을 때
		if(search.isEmpty() || search == null) {			
			List<ProductVO> list = null;
			
			model.addAttribute("list",list);
			model.addAttribute("res",0);
			model.addAttribute("search",search);
			model.addAttribute("cate","");
			model.addAttribute("standard","");
			
			return Common.VIEW_PATH + "product/search.jsp";
		}
		
		
		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
	
		List<ProductVO> list = product_dao.search(search); //검색한 정보에 맞는 상품을 list에 담는다
		int res = product_dao.search_count(search); //검색한 정보에 맞는 상품의 갯수

		model.addAttribute("list",list);
		model.addAttribute("res",res);
		model.addAttribute("search",search);
		model.addAttribute("cate","");
		model.addAttribute("standard","");
		
		return Common.VIEW_PATH + "product/search.jsp";
	}
	
	//검색페이지 상품 정렬
	@RequestMapping("search_array.do")
	public String search_array(String cate, String standard, String search, int res, Model model){

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("search", search);
		
		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
		
		List<ProductVO> list = null;
		
		if(search.isEmpty()) {
			model.addAttribute("list","");
			model.addAttribute("res",res);
			model.addAttribute("search",search);
			model.addAttribute("cate",cate);
			model.addAttribute("standard",standard);
			
			return Common.VIEW_PATH + "product/search.jsp";	
		}
		
		if(cate.isEmpty()) { //카테고리가 지정되지 않았다면			
			switch(standard) { //검색한 상품을 정렬만 한다
				case "신상품순":{						
						list = product_dao.search_cateNo_array_new(map);	
						break;					
				}
				case "판매인기순":{				
						list = product_dao.search_cateNo_array_best(map);	
						break;
				}			
				case "낮은가격순":{				
						list = product_dao.search_cateNo_array_low(map);	
						break;
				}			
				case "높은가격순":{				
						list = product_dao.search_cateNo_array_high(map);	
						break;
				}						
			}			
		} else { //카테고리가 지정되었다면
			switch(standard) { //검색한 상품 중에 지정한 카테고리에 속한 상품을 정렬하여 반환한다
				case "신상품순":{						
						list = product_dao.search_cateYes_array_new(map);	
						break;					
				}
				case "판매인기순":{				
						list = product_dao.search_cateYes_array_best(map);	
						break;
				}			
				case "낮은가격순":{				
						list = product_dao.search_cateYes_array_low(map);	
						break;
				}			
				case "높은가격순":{				
						list = product_dao.search_cateYes_array_high(map);	
						break;
				}						
			}			
		}
		
		model.addAttribute("list",list);
		model.addAttribute("res",res);
		model.addAttribute("search",search);
		model.addAttribute("cate",cate);
		model.addAttribute("standard",standard);
		
		return Common.VIEW_PATH + "product/search.jsp";		
	}
	
	//검색페이지 카테고리
	@RequestMapping("search_cate.do")
	public String search_cate(String cate, String standard, String search, Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("search", search);


		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
		
		int res = product_dao.search_cate_count(map); //검색한 상품 중에 지정된 카테고리에 해당하는 상품의 갯수
		
		List<ProductVO> list = null;
		
		if(search.isEmpty()) {
			
			model.addAttribute("list","");
			model.addAttribute("res",0);
			model.addAttribute("search",search);
			model.addAttribute("cate",cate);
			model.addAttribute("standard",standard);
			
			return Common.VIEW_PATH + "product/search.jsp";
		}
		
		//카테고리에서 카테고리를 선택했을 때 
		if(cate.isEmpty()) { //카테고리를 지정하지 않았다
			if(standard.isEmpty()) { //정렬도 선택하지 않았다
				list = product_dao.search(search); //검색한 상품만 list에 담는다
				res = product_dao.search_count(search); //갯수
				
				model.addAttribute("list",list);
				model.addAttribute("res",res);
				model.addAttribute("search",search);
				model.addAttribute("cate",cate);
				model.addAttribute("standard",standard);
				
				return Common.VIEW_PATH + "product/search.jsp";
			}			
			switch(standard) {//카테고리는 지정하지 않았지만 정렬은 선택했을 때		
				case "신상품순":{						
						list = product_dao.search_cateNo_array_new(map);	
						break;					
				}
				case "판매인기순":{				
						list = product_dao.search_cateNo_array_best(map);	
						break;
				}			
				case "낮은가격순":{				
						list = product_dao.search_cateNo_array_low(map);	
						break;
				}			
				case "높은가격순":{				
						list = product_dao.search_cateNo_array_high(map);	
						break;
				}						
			}
			res = product_dao.search_count(search);//갯수
			
			model.addAttribute("list",list);
			model.addAttribute("res",res);
			model.addAttribute("search",search);
			model.addAttribute("cate",cate);
			model.addAttribute("standard",standard);
			
			return Common.VIEW_PATH + "product/search.jsp";
		}
		//카테고리에서 인형,문구,잡화,출판 중에 선택했을 때
		if(standard.isEmpty()) { //정렬을 선택하지 않았을 때
			list = product_dao.search_cate(map); //검색한 상품중에 카테고리에 해당하는 상품만 list에 담는다
		} else { //정렬을 선택했을 때 
			switch(standard) {		
				case "신상품순":{						
						list = product_dao.search_cateYes_array_new(map);	
						break;					
				}
				case "판매인기순":{				
						list = product_dao.search_cateYes_array_best(map);	
						break;
				}			
				case "낮은가격순":{				
						list = product_dao.search_cateYes_array_low(map);	
						break;
				}			
				case "높은가격순":{				
						list = product_dao.search_cateYes_array_high(map);	
						break;
				}						
			}
		}
		
		model.addAttribute("list",list);
		model.addAttribute("res",res);
		model.addAttribute("search",search);
		model.addAttribute("cate",cate);
		model.addAttribute("standard",standard);
		
		return Common.VIEW_PATH + "product/search.jsp";				
	}
	
	//검색페이지에 검색기능
	@RequestMapping("searchPage_search.do")
	public String searchPage_search(String cate, String standard, String search, Model model) {
		System.out.println(search+"dg");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cate", cate);
		map.put("search", search);
		
		//조회수 세션 리셋
		request.getSession().removeAttribute("show");
		
		//아무것도 적지않고 검색버튼을 눌렀을 때
		if(search.isEmpty() || search == null) {
			
			List<ProductVO> list = null;
			
			model.addAttribute("list",list);
			model.addAttribute("res",0);
			model.addAttribute("search",search);
			model.addAttribute("cate",cate);
			model.addAttribute("standard",standard);
			
			return Common.VIEW_PATH + "product/search.jsp";
		}
		
		List<ProductVO> list = product_dao.search(search); //검색한 정보에 맞는 상품을 list에 담는다
		int res = product_dao.search_count(search); //검색한 정보에 맞는 상품의 갯수
		
		if(!cate.isEmpty()) { //카테고리를 선택했고			
			res = product_dao.search_cate_count(map); //검색한 상품 중에 지정된 카테고리에 해당하는 상품의 갯수			
			if(!standard.isEmpty()) { //정렬도 선택했다면
				switch(standard) { //검색한 상품 중에 지정한 카테고리에 속한 상품을 정렬하여 반환한다
					case "신상품순":{						
							list = product_dao.search_cateYes_array_new(map);	
							break;					
					}
					case "판매인기순":{				
							list = product_dao.search_cateYes_array_best(map);	
							break;
					}			
					case "낮은가격순":{				
							list = product_dao.search_cateYes_array_low(map);	
							break;
					}			
					case "높은가격순":{				
							list = product_dao.search_cateYes_array_high(map);	
							break;
					}					
				}
				model.addAttribute("list",list);
				model.addAttribute("res",res);
				model.addAttribute("search",search);
				model.addAttribute("cate",cate);
				model.addAttribute("standard",standard);
				
				return Common.VIEW_PATH + "product/search.jsp";
			}
			//카테고리는 선택했지만 정렬은 선택안했다면
			list = product_dao.search_cate(map); //검색한 상품중에 카테고리에 해당하는 상품만 list에 담는다
			
			model.addAttribute("list",list);
			model.addAttribute("res",res);
			model.addAttribute("search",search);
			model.addAttribute("cate",cate);
			model.addAttribute("standard",standard);
			
			return Common.VIEW_PATH + "product/search.jsp";
		}
		
		if(!standard.isEmpty()) {//정렬은 선택했고
			if(cate.isEmpty()) { //카테고리는 선택 안했을 때				
				switch(standard) { //검색한 상품을 정렬만 한다
					case "신상품순":{						
							list = product_dao.search_cateNo_array_new(map);	
							break;					
					}
					case "판매인기순":{				
							list = product_dao.search_cateNo_array_best(map);	
							break;
					}			
					case "낮은가격순":{				
							list = product_dao.search_cateNo_array_low(map);	
							break;
					}			
					case "높은가격순":{				
							list = product_dao.search_cateNo_array_high(map);	
							break;
					}						
				}	
				model.addAttribute("list",list);
				model.addAttribute("res",res);
				model.addAttribute("search",search);
				model.addAttribute("cate",cate);
				model.addAttribute("standard",standard);
				
				return Common.VIEW_PATH + "product/search.jsp";
			}
		}
		//정렬과 카테고리를 선택 안했을 때
		model.addAttribute("list",list);
		model.addAttribute("res",res);
		model.addAttribute("search",search);
		model.addAttribute("cate",cate);
		model.addAttribute("standard",standard);
		
		return Common.VIEW_PATH + "product/search.jsp";
		
	}


}
