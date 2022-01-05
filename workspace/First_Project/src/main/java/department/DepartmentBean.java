package department;

public class DepartmentBean {
	
	private String dept_id;
	private String dept_name;
	private String dept_tel;
	
	public DepartmentBean() {}
	
	public DepartmentBean(String dept_id, String dept_name, String dept_tel) {
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.dept_tel = dept_tel;
	}
	
	public String getDept_id() {
		return dept_id;
	}
	
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	
	public String getDept_name() {
		return dept_name;
	}
	
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	public String getDept_tel() {
		return dept_tel;
	}
	
	public void setDept_tel(String dept_tel) {
		this.dept_tel = dept_tel;
	}

}
