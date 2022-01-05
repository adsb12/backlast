package users;
// Action.jsp 를 Servlet으로 만든거 뿐이다.(MVC 패턴이 아님)
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher; // 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join") // 클래스 자체가 돌아가는게 Join이라는 url을 넘겼을 때만 작동
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// join에서 전달하는 방식이 POST라 doPost 메서드 사용
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			// 이 구간 부터────────────────────────────────
			// request, response --> charset
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset = UTF-8");
			
			//
			RequestDispatcher rd = null;
			
			PrintWriter script = response.getWriter();
			
			
			// view에서 파라미터 받아옴
			String user_id 			= request.getParameter("user_id");
			String user_pw 			= request.getParameter("user_pw");
			String user_pw2		= request.getParameter("user_pw2");
			String user_name 		= request.getParameter("user_name");
			String user_gender 	= request.getParameter("user_gender");
			String user_email 		= request.getParameter("user_email");
			String addr1 				= request.getParameter("addr1");
			String addr2 				= request.getParameter("addr2");
			String addr3 				= request.getParameter("addr3");
			// ──────────────────────────────이 구간 까지가 
			// 뷰에서 값을 받아와서 모델로 넘겨 주는 것 --> 이것을 해주는게 컨트롤러다.
			
			
			// 입력 내용 모두 입력 했는지 검증
			if(
					user_id.equals("") 		|| user_id == null 		||
					user_pw.equals("") 		|| user_pw == null 		||
					user_pw2.equals("") 	|| user_pw2 == null 		||
					user_name.equals("") 	|| user_name == null 	||
					user_gender.equals("")	|| user_gender == null	||
					user_email.equals("") 	|| user_email == null 	||
					addr1.equals("") 			|| addr1 == null 			||
					addr2.equals("") 			|| addr2 == null 			||
					addr3.equals("") 			|| addr3 == null 			) {
				
				script.println("<script>");
				script.println("alert('모두 입력해주세요.');");
				script.println("history.back();");
				script.println("</script>");
			}
			
			// 비밀번호와 비밀번호 확인이 다를 경우
			if(!user_pw.equals(user_pw2)) {
				script.println("<script>");
				script.println("alert('비밀번호가 서로 다릅니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
			
			
			// model에 적용 : 빈 객체에 초기화를 시키고 사용하는 것.
			Users users = new Users();
			users.setUser_id(user_id);
			users.setUser_pw(user_pw);
			users.setUser_name(user_name);
			users.setUser_gender(user_gender);
			users.setUser_email(user_email);
			users.setUser_addr(addr1 + " " + addr2 + " " + addr3);
	
			
			// DAO 생성 및 호출
			UsersDAO dao = new UsersDAO();
			
			// 회원가입 기능 메소드 호출
			int rs = dao.join(users);
			
			if(rs == 0) {
				// 
				rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response); // forwarding을 시키면 url이 그대로 남아 있다. --> 이렇게 되면 안됌
				
				
//				script.println("<script>");
//				script.println("location.href = 'login.jsp'");
//				script.println("</script>");
			}
			else if(rs != 0) {
				script.println("<script>");
				script.println("alert('회원가입에 실패했습니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
	}

}
