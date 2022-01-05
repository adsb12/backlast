package user;

public class UserBean {

	private String id;
	private String pw;
	
	public UserBean() {}
	
	public UserBean(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
