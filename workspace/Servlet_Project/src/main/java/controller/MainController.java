package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MainService;

// home에 대한 패턴일때만 적용 하는 것. ↓
// 어노테이션↓								 ↓
@WebServlet(urlPatterns = {"/home", "/home/*"}) //
//																└-->  /(슬래쉬) 후 뭐가 오든지 실행되게 만듬. (680p)
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MainService service;
	
    public MainController() {
    	service = new MainService();
    }

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response character set 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		// request에서 Session 객체 받아옴
		HttpSession session = request.getSession();
		
		// response에서 Writer 객체 받아옴
		PrintWriter script = response.getWriter();
		
		// url path를 request에서  불러오기
		String path = request.getPathInfo();
		String url = "/home";

		// 기본 홈(주소창에)에 / 나 /main이 오면 /main/main.jsp로 넘기겠다.
		
		// url이 localhost:port/project/home 일 때
		if(path == null) {
			url = "/main/main.jsp";
		}
		
		// /home/으로 넘어와도 아래 response 메소드로 /home으로 url을 바꿔주고 서블렛에 다시 들어와서 실행된다.
		
		// url이 localhost:port/project/home/ 일 때
		else if(path.equals("/")) {
			
			// url을 localhost:포트번호/프로젝트이름/home 로 변경
			response.sendRedirect("../home");
			// sendRedirect = url 바꿔주는 메소드
			return;
		}
		
		// url이 localhost:port/project/home/login 일 때
		else if(path.equals("/login")) {
			url = "/main/login.jsp";
		}
		
		// url이 localhost:port/project/home/join 일 때
		else if(path.equals("/join")) {
			url = "/main/join.jsp";
		}
		
		// url이 localhost:port/project/home/joinAction 일 때
		else if(path.equals("/joinAction")) {
			
			int rs = service.join(request);
					
				if(rs == 0) {
						response.sendRedirect("./login");
						return;
						
				}
				
				else {
					script.println("<script>");
					script.println("alert('회원가입에 실패했습니다.');");
					script.println("history.back();");
					script.println("</script>");
					return;
				}
		}
		
		// url이 localhost:port/project/home/loginAction 일 때
		
		else if(path.equals("/loginAction")) {
			
			int rs = service.login(request);
				
				if(rs == 0) {
					// servlet에서 session을 사용하려면 request 객체에 있는 getSession()을 가져와야 한다.
					session.setAttribute("user_id", request.getParameter("user_id"));
					response.sendRedirect("../home");
					return;
				}
				else if (rs == 1) {
					script.println("<script>");
					script.println("alert('로그인 정보가 일치하지 않습니다.');");
					script.println("history.back();");
					script.println("</script>");
					return;
				}
				else if (rs == 2) {
					script.println("<script>");
					script.println("alert('모두 입력해주세요.');");
					script.println("history.back();");
					script.println("</script>");
					return;
				}
				else if (rs == -1) {
					script.println("<script>");
					script.println("alert('데이터베이스 오류 입니다.');");
					script.println("history.back();");
					script.println("</script>");
					return;
				}
		}
		
		// url이 localhost:port/project/home/logout 일 때
		else if(path.equals("/logout")) {
			session.invalidate(); // 세션 지우기.
			response.sendRedirect("../home");
			return;
		}
		
		// url이 localhost:port/project/home/idCheck 일 때
		
		else if(path.equals("/idCheck")) {
			int rs = service.idCheck(request);
			// 웹페이지에 찍히는 걸 읽어줌
			response.getWriter().write(rs + ""); // doHandle이 void라 반환값이 없는 것이다. 그래서 response객체를 이용해서 보내줌.
			return;							// 	   └─ rs는 데이터타입이 int 형이라 ""으로 빈문자열을 추가 해줘서 문자열로 넘어가게 만들어준다.	
		}
		
		// url이 localhost:port/project/home/sendAuthMail 일 때
		else if(path.equals("/sendAuthMail")) {
			int rs = service.sendAuthMail(request);
			response.getWriter().write(rs + "");
			return;
		}
		
		// url이 localhost:port/project/home/mailAuth 일 때
		else if(path.equals("/mailAuth")) {
			int rs = service.mailAuth(request);
			response.getWriter().write(rs + "");
			
			return;
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);	
	}// ↑ doHandle()을 넣어주는 이유는 Get, Post 어떤 방식이 와도 처리하겠다.
	

}
