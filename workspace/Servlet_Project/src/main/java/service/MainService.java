package service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import authmail.Authmail;
import authmail.AuthmailDAO;
import users.Users;
import users.UsersDAO;
import util.Mail;

// Model의 일종, 연산 및 검증 작업 수행
public class MainService {

	private UsersDAO dao;
	private AuthmailDAO aDao;
	
	public MainService() {
		dao 		= new UsersDAO();
		aDao 	= new AuthmailDAO();
	}
	
	
	// 회원 가입 기능 Service
	// parameter : request 객체
	// return : {	0 	: 성공,
//						-1	: 데이터 베이스 오류 }
	
	public int join(HttpServletRequest request) {
	
		int result = 0;
		
		String user_id 			= request.getParameter("user_id");
		String user_pw 			= request.getParameter("user_pw");
		String user_name 		= request.getParameter("user_name");
		String user_gender 	= request.getParameter("user_gender");
		String user_email 		= request.getParameter("user_email");
		String addr1 				= request.getParameter("addr1");
		String addr2 				= request.getParameter("addr2");
		String addr3 				= request.getParameter("addr3");
		// ──────────────────────────────이 구간 까지가 
		// 뷰에서 값을 받아와서 모델로 넘겨 주는 것 --> 이것을 해주는게 컨트롤러다.
		
		// model에 적용 : 빈 객체에 초기화를 시키고 사용하는 것.
		Users users = new Users();
		users.setUser_id(user_id);
		users.setUser_pw(user_pw);
		users.setUser_name(user_name);
		users.setUser_gender(user_gender);
		users.setUser_email(user_email);
		users.setUser_addr(addr1 + " " + addr2 + " " + addr3);
		
		// 회원가입 기능 메소드 호출
		int rs = dao.join(users);

		return result;
		
	}

	// 로그인 기능 Service
	// parameter	: request 객체 (user_id, user_pw) 
	// return		: { 	 0 	: 성공
	//							 1 	: 로그인정보 불일치
	//							-1	: 데이터베이스 오류 }
	public int login(HttpServletRequest request) {
		int result = 0;
		
		String user_id 	= request.getParameter("user_id");
		String user_pw 	= request.getParameter("user_pw");
		
		// 아이디와 비밀번호를 입력했는지 검증
		if(user_id == null || user_pw == null || user_id.equals("") || user_pw.equals("")) {
			return 2;
		}
		
		// 로그인 메소드 호출
		result = dao.login(user_id, user_pw);
		
		return result;
	}
	
	// 아이디 중복체크 기능 Service
	// 로그인 기능 Service
	// parameter	: request 객체 (user_id) 
	// return		: { 	 
	//							 0 	: 사용 가능
	//							 1 	: 사용중
	//							-1	: 데이터베이스 오류
	//						}
	
	public int idCheck(HttpServletRequest request) {
		
		int result = 0;
		
		String user_id = request.getParameter("user_id");
		
		result = dao.idCheck(user_id);
		
		return result;
	}
	// 이메일 전송 메소드
	// parameter	: request 객체 (유저 아이디)
	// return		: { 0 : 성공, -1 : 실패 }
	public int sendAuthMail(HttpServletRequest request) {
			
		int result = 0;
		
		Random rd = new Random();
		
		int auth_num = rd.nextInt(9999) + 1; // 1 ~ 9999 까지 랜덤 숫자가 나온다.
		
		String from 		= "1223020@donga.ac.kr"; // 보내는 곳
		String to 			= 	request.getParameter("user_mail");	// 받는 곳
		String subject 	= "인증번호 메일";	// 메일의 제목
		String content 	= "다음 인증번호를 입력하세요. <br> <h2>" + auth_num +"</h2>"; // 메일의 내용

		int rs = aDao.setAuthnum(new Authmail(to, auth_num));
		
		// 오류가 나면 밑에 구문이 실행되지 않게 방지(따로 메소드를 만들 수 있지만 이렇게 하는 게 효율적)
		if (rs == -1) {
			rs = aDao.resetAuthnum(new Authmail(to, auth_num));
			if(rs == -1) return -1;
		}
		
		Properties p = new Properties();
		// ↑ 환경설정
		
		// 메일전송을 하기위한 환경 설정이다.
		// 		("mail.smtp에 대한 .값", 을 ooo 로 맞추겠다.);
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587"); // SMTP 프로토콜 : 간이우편 전송 프로토콜 -> 465port는 SMTP 암호화 전에 SMTP 암호화가 자동으로 시작. 
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "587");
//		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");	// 추가
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");			// 추가
		
/*
 * 		Could not connect to SMTP host: smtp.gmail.com, port: 465; 오류
 * 		└──> 포트 번호 587로 변경 후 .socketFactory.class 부분을 뺌.
 * 
 * 		Could not convert socket to TLS; 오류가 떠서
 * 		└──> ssl.trust 와 ssl.protocols 를 추가하고 
*/	
		
		// 데이터베이스 연동이랑 비슷하다.
		try {
			// 메일을 보내기 위해 접속, 설정
			Authenticator auth = new Mail();
			Session s = Session.getInstance(p, auth);
				s.setDebug(true);
				
			MimeMessage msg = new MimeMessage(s);
			
			// 보내는 사람, 받는 사람
			Address fromAddr = new InternetAddress(from);
			Address toAddr = new InternetAddress(to);
			
				// 내용을 입력해주는 구문.
				msg.setFrom(fromAddr);
				msg.setRecipient(Message.RecipientType.TO, toAddr);
				msg.setSubject(subject);
				msg.setContent(content, "text/html;charset=UTF-8");
				
			// 메일 보내기
			Transport.send(msg);
				
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 메일  인증 기능 Service
	// parameter : request 객체 (유저 이메일, 인증번호)
	// return : { 0 : 성공, 1 : 인증 실패, -1 : 데이터베이스 오류}
	public int mailAuth(HttpServletRequest request) {
		int result = 0;
		
		String user_mail = request.getParameter("user_mail");
		int auth_num = Integer.parseInt(request.getParameter("auth_num"));
		
		result = aDao.getAuthnum(new Authmail(user_mail, auth_num));
		
		return result;
	}
	
}
