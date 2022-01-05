package authmail;

public class Authmail {

	private String email;
	private int auth_num;

	public Authmail() {
	}

	public Authmail(String email, int auth_num) {
		this.email = email;
		this.auth_num = auth_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAuth_num() {
		return auth_num;
	}

	public void setAuth_num(int auth_num) {
		this.auth_num = auth_num;
	}

}
