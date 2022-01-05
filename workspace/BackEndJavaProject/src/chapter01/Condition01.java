package chapter01;

public class Condition01 {

	public static void main(String[] args) {
		
		// if 조건문
		// if(조건) { 조건이 참일 때 실행문 }
		int age = 10;
		
		System.out.println("if문 위");
		
		if(age > 18) 
			System.out.println("성인");
		
		System.out.println("if문 아래");
		
		// else { 조건이 거짓일 때 실행문 }
		if(age > 18) {
			System.out.println("성인");
		} else {
			System.out.println("미성년자");
		}
		
		System.out.println("if문 아래");
		
		// else if(조건) { 위의 조건이 거짓이고 해당 조건이 참일 때 실행문 }
		if(age < 18) {
			System.out.println("청소년");
		} else if(age < 12) {
			System.out.println("아동");
		} else {
			System.out.println("성인");
		}
		
		// 중첩 if문
		int x, y;
		x = 0;
		y = 0;
		
		// 1 사분면
		if(x > 0 && y > 0) {
			System.out.println("1 사분면");
		} else if(x > 0 && y < 0) {
			System.out.println("4 사분면");
		} else if(x < 0 && y > 0) {
			System.out.println("2 사분면");
		} else if(x < 0 && y < 0){
			System.out.println("3 사분면");
		} else {
			System.out.println("영점");
		}
		
		if(x > 0) {
			if(y > 0) {
				System.out.println("1 사분면");
			} else if(y < 0) {
				System.out.println("4 사분면");
			}
		} else if(x < 0) {
			if(y > 0) {
				System.out.println("2 사분면");
			} else if(y < 0) {
				System.out.println("3 사분면");
			}
			} else {
				System.out.println("영점");
		}

	}

}














