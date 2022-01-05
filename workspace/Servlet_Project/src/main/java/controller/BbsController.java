package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boarder.Boarder;
import boarder.Paging;
import service.BbsService;

// bbs url에 대한 처리를 다 해주기 위해 패턴을 배열로 맞춰둠.
@WebServlet( urlPatterns = {"/bbs", "/bbs/*"} )
public class BbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BbsService service;
	
    public BbsController() {
    	service = new BbsService();
    }
    
    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset = UTF-8");
    	
    	// response에서 Writer 받아옴
    	PrintWriter script = response.getWriter();
    	
    	// request에서 Session 받아옴
    	HttpSession session  = request.getSession();
    	
    	
    	String path = request.getPathInfo();
    	String url = null;
    	
    	// url이 localhost:port/project/bbs 일 때
    	if(path == null) {
    		
    		ArrayList<Boarder> list = service.getBoarderList(request);
    		Paging paging = service.getPaging(request);
    		request.setAttribute("list", list);
    		request.setAttribute("paging", paging);
    		
    		url = "/board/bbs.jsp";
    		
    		// url이 localhost:port/project/bbs/write 일 때
    	} else if(path.equals("/write")) {
    		url = "/board/write.jsp";
    		
    		// url이 localhost:port/project/bbs/writeAction 일 때
    	} else if(path.equals("/writeAction")) {
    		int rs = service.write(request);
    		
    		if(rs == 0) {
    			response.sendRedirect("../bbs");
    			return;
    		} else {
    			script.println("<script>");
    			script.println("alert('게시물 작성에 실패했습니다.')");
    			script.println("history.back();");
    			script.println("</script>");
    			return;
    		}
    	}
    	
    	// url이 localhost:port/project/bbs/view 일 때
    	else if(path.equals("/view")) {
    		Boarder boarder = service.getBoarder(request);
    		
    		if(boarder == null) {
    			script.println("<script>");
    			script.println("alert('존재하지 않는 게시물입니다.')");
    			script.println("location.href = '../bbs'");
    			script.println("</script>");
    			return;
    		} else if(boarder.getAvailable() == 1) {
    			script.println("<script>");
    			script.println("alert('삭제된 게시물입니다.')");
    			script.println("location.href = '../bbs'");
    			script.println("</script>");    			
    			return;
    		}
    		
    		request.setAttribute("boarder", boarder);
    		url = "../board/view.jsp";
    	}
    	
    	// url이 localhost:port/project/bbs/update 일 때
    	else if(path.equals("/update")) {
    		Boarder boarder = service.getBoarder(request);
    		
    		if(boarder == null) {
    			script.println("<script>");
    			script.println("alert('존재하지 않는 게시물입니다.')");
    			script.println("location.href = '../bbs'");
    			script.println("</script>");
    			return;
    		} else if(boarder.getAvailable() == 1) {
    			script.println("<script>");
    			script.println("alert('삭제된 게시물입니다.')");
    			script.println("location.href = '../bbs'");
    			script.println("</script>");    			
    			return;
    		}
    		request.setAttribute("boarder", boarder);
    		url = "../board/update.jsp";
    	}
    	
    	// url이 localhost:port/project/bbs/updateAction 일 때
    	else if(path.equals("/updateAction")) {
    		int rs = service.update(request);
    		
    		if(rs == 0) {
    			response.sendRedirect("./view?boarder_id=" + request.getParameter("boarder_id"));
    			return;
    		} else {
    			script.println("<script>");
    			script.println("alert('수정에 실패했습니다.')");
    			script.println("history.back()");
    			script.println("</script>");    			
    			return;
    		}
    	}
    	
    	// url이 localhost:port/project/bbs/deleteAction 일 때
    	else if(path.equals("/deleteAction")) {
    		int rs = service.delete(request);
    		
    		if(rs == 0) {
    			response.sendRedirect("../bbs");
    			return;
    		} else {
    			script.println("<script>");
    			script.println("alert('삭제에 실패했습니다.')");
    			script.println("history.back()");
    			script.println("</script>");    			
    			return;
    		}
    	}
    	
    	
    	RequestDispatcher rd = request.getRequestDispatcher(url);
    	rd.forward(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
}
