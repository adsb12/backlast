package chapter01;

public class Condition02 {

	public static void main(String[] args) {
		
		// switch 조건문
		/*switch(변수) {
		case v1:
		case v2:
		case v3:
		default:
		}*/
		
		int a = 3;
		
		switch(a) {
		
		case 1:
			System.out.println("a는 1입니다.");
			break;
		case 3:
			System.out.println("a는 3입니다.");
		case 5:
			System.out.println("a는 5입니다.");
			break;
		default:
			System.out.println("a는 1, 3, 5가 아닙니다.");
		}

	}

}
