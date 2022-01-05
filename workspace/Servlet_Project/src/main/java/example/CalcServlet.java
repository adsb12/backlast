package example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Calc")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response Character Set을 UTF-8, text/html로 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");

		// request에서 전송받음 parameter 받아옴
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String op = request.getParameter("op");
		
		// 사칙연산 함수 호출
		int rs = calc(num1, num2, op);
		
		// HTML 출력
		PrintWriter script = response.getWriter();
		script.println("<html>");
		script.println("<head><title>계산결과</title></head>");
		script.println("<body>");
		script.println("계산결과 : " + rs);
		script.println("</body>");
		script.println("</html>");
	}
	
	private int calc(int num1, int num2, String op) {
		int rs = 0;
		
		// op가 +일 때
		if(op.equals("+")) rs = num1 + num2;
		
		// op가 - 일 때
		else if(op.equals("-")) rs = num1 - num2;
		
		// op가 * 일 때
		else if(op.equals("*")) rs = num1 * num2;
				
		// op가 / 일 때
		else if(op.equals("/")) rs = num1 / num2;

		return rs;
	}
}
