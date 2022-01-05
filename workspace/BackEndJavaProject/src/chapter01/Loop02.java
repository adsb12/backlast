package chapter01;

import java.util.Scanner;

public class Loop02 {

	public static void main(String[] args) {
		
		// while 반복문
		
		// 특정조건이 올때까지 반복, 횟수가 정해지지 않았을 때 사용
		// while(조건) { ... }
		for(int i = 0; i < 10; i++);
		
		int i = 0;
		while(i < 10) {
			
			i++;
		}
		
		int sum = 0;
		
		i = 0;
		while(i < 15) {
			sum += ++i;
		}
		
		System.out.println(sum);
		
		System.out.println();
		
		boolean flag = false;
		
		while(!flag) {
			Scanner sc = new Scanner(System.in);
			int n = sc.nextInt();
			
			if(n > 0)
			System.out.println("입력한 값은 " + n + "입니다.");
			else
				flag = true;
			
		}
		
		System.out.println();
		
		i = 0;
		while(i < 10) {
			System.out.println("while 실행문");
		}
		
		// do - while 반복문
		// 무조건 1번 이상은 반복문을 실행해야할 때 사용
		// do { 반복 실행문 } while(조건);
		do {
			System.out.println("반복 실행문");
		} while(false);
		
		int a = 1;
		while( a < 100) {
			
			if(a < 1) {
				System.out.println(a + "는 0이하 입니다.");
				break;
			}
			if(a % 3 != 0) {
				a++;
				continue;
			}
			System.out.println(a + "는 3의 배수입니다.");
			a++;
		}
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			
			sc = new Scanner(System.in);
			int n = sc.nextInt();
			
			if(n == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
			
			if(n < 0) {
				System.out.println("1이상의 양의 정수를 입력하세요.");
				continue;
			}
			
			System.out.println("입력한 값은 : " + n);
		}
		
		

	}

}
