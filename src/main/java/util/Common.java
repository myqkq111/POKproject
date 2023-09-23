package util;

public class Common {
	
	//경로설정
	public static String VIEW_PATH = "/WEB-INF/views/";
	
	
	
	
	//일반 게시판용
			public static class Board {
				
			//한 페이지에 보여줄 게시물 개수
			public final static int BLOCKLIST = 10;
				
			//페이지 메뉴 개수
			public final static int BLOCKPAGE = 3;
				
			//Common.Board.BLOCKLIST; -> 10
		}
		
		//게시판 경로설정
		public static String VIEW_PATH1 = "/WEB-INF/views/board/";
	
}
