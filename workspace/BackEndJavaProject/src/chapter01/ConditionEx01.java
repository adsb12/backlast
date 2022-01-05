package chapter01;

import java.util.Scanner;

public class ConditionEx01 {

	public static void main(String[] args) {
		
		// 나이에 따라서 불려지는 명칭을 출력
		// 12세 미만 - 아동
		// 12세 이상 ~ 18세 미만 - 청소년
		// 18세 이상 - 성인
		
		Scanner sc = new Scanner(System.in);
		
		int age, pay = 0;
		age = sc.nextInt();
		
		if(age < 12) {
			System.out.println("아동");
		}
		if(age >= 18) {
			System.out.println("성인");
		}
		if(age >= 12 && age < 18) {
			System.out.println("청소년");
		}
		
		// pay 변수에 아동이면 0, 청소년이면 500, 성인 1000
		// 마지막에 "금액은 ???원 입니다."
		if(age < 12) {
			pay = 0;
		} else if(age < 18) {
			pay = 500;
		} else {
			pay = 1000;
		}
		System.out.println("금액은 " + pay + "원 입니다");
		
		

	}

}
