package course;

public class CourseBean {

	private String course_id;       
	private String title;  
	private int c_number;       
	private String professor_id;    
	private int course_fees;
	
	public CourseBean() {}
	
	public CourseBean(String course_id, String title, int c_number, String professor_id, int course_fees) {
		this.course_id = course_id;
		this.title = title;
		this.c_number = c_number;
		this.professor_id = professor_id;
		this.course_fees = course_fees;
	}    
	
	public String getCourse_id() {
		return course_id;
	}
	
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getC_number() {
		return c_number;
	}
	
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	
	public String getProfessor_id() {
		return professor_id;
	}
	
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	
	public int getCourse_fees() {
		return course_fees;
	}
	
	public void setCourse_fees(int course_fees) {
		this.course_fees = course_fees;
	}



}
