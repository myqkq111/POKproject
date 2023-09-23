package com.korea.pok;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	BoardDAO board_dao;
	
	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	@RequestMapping("board_list.do")
	public String list(Model model, String page) {
		int nowPage = 1;
		
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시될 게시물의 시작과 끝번호를 계산
		int start = (nowPage -1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		//페이지 번호에 따른 전체 게시글 조회
		List<BoardVO> list = board_dao.selectList(map);
		
		//전체 게시물 수 조회
		int rowTotal = board_dao.getRowTotal();
		
		//페이지 메뉴 생성하기
		String pageMenu = Paging.getPaging("board_list.do", nowPage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");//05-23
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		
		
		return Common.VIEW_PATH1 + "board_list.jsp?page="+nowPage;
	}
	
	//게시물 한개 보기
	@RequestMapping("view.do")
	public String view(Model model, int idx, int page) {
		//view.do?idx=0&page=
		
		BoardVO vo = board_dao.selectOne(idx);
		
		//한번 클릭할때마다 조회수가 1씩 증가(F5연타해서 조회수 증가를 막아야 함)
		//조회수 증가
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			int res = board_dao.update_readhit(idx);
			session.setAttribute("show", "0");
		}
		
		model.addAttribute("vo",vo);
		
		return Common.VIEW_PATH1 + "board_view.jsp?page="+page;
	}
	
	//게시글 작성
	@RequestMapping("write.do")
	public String insert_form() {
		return Common.VIEW_PATH1 + "board_insert.jsp";
	}
	
	@RequestMapping("insert.do")
	public String insert(BoardVO vo) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = board_dao.insert(vo);
		
		if(res > 0) {
			return "redirect:board_list.do";
		}
		
		return null;
	}
	
	//게시글 수정
	@RequestMapping("modify_form.do")
	public String modify_form(Model model, int idx) {
		//파라미터로 넘어온 idx를 이용해 해당 idx를 가진 게시물 정보를 얻어온다.
		BoardVO vo = board_dao.selectOne(idx);
			
		model.addAttribute("vo",vo);
		return Common.VIEW_PATH1+"board_modify.jsp";
	}
	
	@RequestMapping("modify.do")
	public String modify(BoardVO vo, HttpServletRequest request) {
		//현재 vo에 담겨서 넘어오는 내용이 무엇인가(내용과 비밀번호)
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = board_dao.update(vo);
		
		return "redirect:board_list.do";
	}
	
	//게시글 삭제
	@RequestMapping("delform.do")
	public String del_form(Model model, int idx, String pwd) {
		
		BoardVO vo = board_dao.selectOne(idx);
		
		model.addAttribute("vo",vo);
		
		return Common.VIEW_PATH1 + "board_delete.jsp";
	}
	
	//게시글 삭제
	@RequestMapping("del.do")
	@ResponseBody//ajax
	public String delete(int idx) {
		BoardVO baseVO = board_dao.selectOne(idx);
		
		baseVO.setName("unknown");
		baseVO.setSubject("삭제된 글입니다.");
		
		int res = board_dao.del_update(baseVO);
		
		if(res > 0) {
			return "[{'result':'yes'}]";
		}
		
		return "[{'result':'no'}]";
	}
	
	//댓글달기 페이지로 이동
	@RequestMapping("reply_form.do")
	public String reply_form(int idx, int page) {
		return Common.VIEW_PATH1 + "board_reply.jsp?idx="+idx+"&page="+page;
	}
	
	//댓글달기
	@RequestMapping("reply.do")
	public String reply(BoardVO vo, int idx, int page) {
		String ip = request.getRemoteAddr();
			
		//ref, step, depth 잘 따져야 함
		//같은 ref를 가지고 있는 데이터들 중에서 지금 내가 추가하려고 하는 step값 이상인 애들을 +1을 미리 해놔야 하기 때문에 insert를 먼저 하지 않는다
			
		//기준글의 idx를 이용해서 댓글을 달고 싶은 게시글의 정보를 가져온다.
		BoardVO baseVO = board_dao.selectOne(idx);
			
		//기준글에 step이상 값을 갖는 데이터에 step = step + 1처리
		int res = board_dao.update_step(baseVO);
			
		vo.setIp(ip);
			
		//댓글이 들어갈 위치 선정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
			
		int n = board_dao.reply(vo);
			
		if(n > 0) {
			return "redirect:board_list.do?page="+page;
		}
			
			return null;
		}
	
	
}