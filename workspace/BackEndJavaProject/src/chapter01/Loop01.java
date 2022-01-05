package chapter01;

import java.util.Iterator;
import java.util.Scanner;

public class Loop01 {

	public static void main(String[] args) {
		
		// for 반복문
		// 특정 횟수만큼 반복시키고자할 때 자주 사용됨
		
		// for(초깃값; 조건식; 증감식) { 반복할 문장 }
		
		System.out.println("1번째 문장");
		System.out.println("2번째 문장");
		System.out.println("3번째 문장");
		System.out.println("4번째 문장");
		System.out.println("5번째 문장");
		System.out.println("6번째 문장");
		System.out.println("7번째 문장");
		System.out.println("8번째 문장");
		System.out.println("9번째 문장");
		System.out.println("10번째 문장");
		
		for (int i = 0; i < 10; i++) {
			System.out.println((i + 1) + "번째 문장");
		}
		
		int i = 0;
		
		for (i = 0; i < 10; i++) {
			System.out.println(i + " " + (i < 10));
		}
		
		System.out.println(i + " " + (i < 10));
		
		System.out.println("");
		
		// 1 ~ 15 까지의 합 (1 + 2 + 3 + ~ 14 + 15)
		
		int sum1 = 0;
		
		for (i = 1; i <= 15; i++) {
			sum1 += i;
		}
		System.out.println(sum1);
		
		// 1부터 300까지의 3의 제곱 값들의 합( 1 + 3 + 9 + 27 + ~)
		
		int sum2 = 0;
		
		for(int j = 1; j <= 300; j *= 3) {
			sum2 += j;
		}
		System.out.println(sum2);
		
		// *을 출력
		// 정수를 입력받아서 입력받은 정수 만큼의 세로를 가지는 ***** 사각형
		
		Scanner sc = new Scanner(System.in);
		int cnt = sc.nextInt();
		
		for(int k = 0; k < cnt; k++) {
			System.out.println("*****");
		}
		
		// *을 출력
		// 정수를 입력받아서 입력받은 정수 만큼의 가로 세로를 가지는 * 사각형
		
		for(int j = 0; j < cnt; j++) {
			for(int k = 0; k < cnt; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		// *을 출력
		// 정수를 입력받아서 입력받은 정수 만큼의 가로 세로를 가지는 * 삼각형
		for(int j = 1 ; j <= cnt; j++) {
			for(int k = 0; k < j; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		// *을 출력
		// 정수를 입력받아서 입력받은 정수 만큼의 가로 세로를 가지는 * 역삼각형
		for(int j = 0; j < cnt; j++) {
			for(int k = 0; k < (cnt - j); k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		for(;;) {
			
		}
		
//		for(int j = 0, k = 0; (i < 10 || j < 10); j++, k++) {
//			
//		}
		
	}

}
