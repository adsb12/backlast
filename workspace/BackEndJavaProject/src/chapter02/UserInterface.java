package chapter02;

public interface UserInterface {

	// 로그인 기능
	public abstract int login(String id, String pw);
	
	// 회원가입 기능
	public abstract int regist(String id, String pw, String pw2, String userName);
}
