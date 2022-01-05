package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import boarder.Boarder;
import boarder.BoarderDAO;
import boarder.Paging;
import util.Util;

public class BbsService {

	private BoarderDAO dao;

	public BbsService() {
		dao = new BoarderDAO();
	}
	
	// 글쓰기 Service
	// parameter : request 객체 (작성자 아이디, 제목, 내용, 파일)
	// return : {0 : 성공, -1 : 실패}
	public int write(HttpServletRequest request) {
		int result = 0;
		
		HttpSession session = request.getSession();
		
		String writer = (String)session.getAttribute("user_id"); 
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		Boarder boarder = new Boarder();
		boarder.setBoarder_id(dao.next());
		boarder.setWriter(writer);
		boarder.setTitle(title);
		boarder.setContents(contents);
		
		result = dao.write(boarder);

		return result;
	}
	
	// 목록 불러오기 Service
	// parameter : request 객체 (현재 페이지)
	// return : 게시물 목록
	public ArrayList<Boarder> getBoarderList(HttpServletRequest request) {
		ArrayList<Boarder> list = new ArrayList<Boarder>();
		
		
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}	
		
		list = dao.getBoarderList(pageNum, dao.next());

		for(int i = 0; i < list.size(); i++) {
			Boarder boarder = list.get(i);
			boarder.setTitle(Util.setXss(boarder.getTitle()));
			boarder.setContents(Util.setXss(boarder.getContents()));
		}
		
		return list;
	}
	
	// 게시물 불러오기 Service
	// parameter : request 객체(boarder_id)
	// return : boarder 객체
	public Boarder getBoarder(HttpServletRequest request) {
		
		int boarder_id = Integer.parseInt(request.getParameter("boarder_id"));
		
		Boarder boarder = dao.getBoarder_id(boarder_id);
		boarder.setTitle(Util.setXss(boarder.getTitle()));
		boarder.setContents(Util.setXss(boarder.getContents()));
		
		return boarder;
	}
	
	// 게시물 수정 Service
	// Parameter : request 객체 (게시물 번호, 작성자, 제목, 내용)
	// return : { 0 : 성공, -1 : 실패 }
	public int update(HttpServletRequest request) {
		int boarder_id = Integer.parseInt(request.getParameter("boarder_id"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		Boarder boarder = new Boarder();
		boarder.setBoarder_id(boarder_id);
		boarder.setTitle(title);
		boarder.setContents(contents);
		
		int result = dao.update(boarder);
		
		return result;
	}
	
	// 게시물 삭제 Service
	// parameter : request 객체 (게시물 번호)
	// return : {0 : 성공, -1 : 실패}
	public int delete(HttpServletRequest request) {
		int boarder_id = Integer.parseInt(request.getParameter("boarder_id"));
		int result = dao.delete(boarder_id);
		
		return result;
	}
	
	// 페이징 처리 Service
	// parameter : request 객체 (페이지 번호)
	// return : Paging 객체
	public Paging getPaging(HttpServletRequest request) {
		
		Paging paging = null;
		int pageNum = 1;
		
		if(request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int cnt = dao.getCount();
		if(cnt != -1) paging = new Paging(pageNum, cnt);
		return paging;
	}
	
}
