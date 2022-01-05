package example;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Simple")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SimpleController() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response Character Set 설정(무조건 초기 설정 필수! 아니면 글자가 깨진다.)
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		RequestDispatcher rd = null;
	
		// year 파라미터 받아옴
		String year = request.getParameter("year");
		
		if(year == null) {
			rd = request.getRequestDispatcher("example03.jsp"); // 경로를 담아줘서 dispatcher에 저장이 된다.
			rd.forward(request, response); // rd.넘겨준다.
		}
	
		// 결과를 저장할 rs 변수 선언
		String rs = null;
		
		// 4이면 대학생, 
		if (year.equals("4")) rs = "대학생";
		
		// 3이면 중/고등학생
		else if (year.equals("3")) rs = "고등학생";
		
		// 6이면 대학생
		else if (year.equals("6")) rs = "초등학생";
	
		// 나머지는 잘못된 입력
		else rs = "잘못된 입력";

		// request 객체의 rs이름의 속성에 rs값을 저장 --  컨트롤러 역할 
		request.setAttribute("rs", rs); // 속성 즉 컬럼값에 rs로 만드는 것이라 생각하면된다. ("속성", 값)
		
		// View로 포워드(전해줄[앞으로 나아갈]) 할 RequestDispatcher 객체 생성 및 포워드
		rd = request.getRequestDispatcher("example02.jsp"); // 경로를 담아줘서 dispatcher에 저장이 된다.
		rd.forward(request, response); // rd.넘겨준다.
		
		
	}
	

}
