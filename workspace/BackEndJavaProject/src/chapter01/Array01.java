package chapter01;

import java.util.Arrays;
import java.util.Scanner;

public class Array01 {

	public static void main(String[] args) {
		
		// 배열
		// 같은 데이터타입의 여러 데이터를 하나로 관리
		
		// 배열 선언
		int[] iarr;
		
		// 배열 생성
		iarr = new int[5];
		
		// 배열 선언 및 생성
		short[] sarr = new short[3];
		
		System.out.println(iarr[0]);
		iarr[0] = 1;
		iarr[1] = 2;
		iarr[2] = 3;
		iarr[3] = 4;
		iarr[4] = 5;
		
		System.out.println(iarr[2]);
		
		char[] carr1 = new char[] {'a' , 'p' , 'p' , 'l' , 'e'};
		char[] carr2 = {'a' , 'p' , 'p' , 'l' , 'e'};
		
		System.out.println(carr2[2]);
		
		System.out.println(iarr);
		//carr2 = {'p' , 'r' , 'i' , 'n' , 't'};
		
		for(int i = 0; i < sarr.length; i++) {
			sarr[i] = (short) (i + 1);
		}
		
		for(int i = 0; i < sarr.length; i++) {
			System.out.print(sarr[i] + "");
		}
		
		System.out.println();
		
		System.out.println(Arrays.toString(sarr));
		
		// 5명의 국어성적을 입력 받고 그 평균을 출력하시오
		int[] korScores = new int[3];
		Scanner sc;
		
		for(int i = 0; i < korScores.length; i++) {
			sc = new Scanner(System.in);
			int score = sc.nextInt();
			korScores[i] = score;
		}
		
		float sum = 0;
		for(int i = 0; i < korScores.length; i++) {
			sum += korScores[i];
		}
		
		int tmp = -1, emp = 0;
		for(int i = 0; i < korScores.length - 1; i++) {
			emp = i;
			
			for(int j = i + 1; j < korScores.length; j++) {
				if(korScores[j] > korScores[emp]) emp = j;
			}
			
			if(i != emp) {
				tmp = korScores[i];
				korScores[i] = korScores[emp];
				korScores[emp] = tmp;
			}
		}
		
		float avg = sum / korScores.length;
		
		System.out.println(Arrays.toString(korScores));
		System.out.println("평균 : " + avg);

	}

}










