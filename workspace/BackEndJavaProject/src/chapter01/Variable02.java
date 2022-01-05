package chapter01;

public class Variable02 {

	public static void main(String[] args) {
		
		// 데이터 타입
		// 데이터의 형태는 정수형태, 실수형태, 문자형태, 논리형태 존재
		
		// 정수형태
		// byte, short, int, long
		
		// byte는 1byte 크기를 가짐
		byte by1 = 127;
		byte by2 = -128;
//		byte by3 = 128;
//		byte by4 = -129;
		
		// short는 2byte 크기를 가짐
		short s1 = 32_767;
		short s2 = -32_768;
//		short s3 = 32768;
//		short s4 = -32769;
		
		// int는 4byte 크기를 가짐
		int i1 = 2_000_000_000;
		int i2 = -2_000_000_000;
//		int i3 = 3_000_000_000;
//		int i4 = -3_000_000_000;
		
		// long는 8byte 크기를 가짐
		long l1 = 3_000_000_000L;
		
		long sum1 = 0;
		sum1 = 2_000_000_000+1_000_000_000L;
		
		System.out.println(sum1);
		
		// 실수형태
		// float, double 존재
		
		// float은 4byte 값을 가짐
		float f1 = 0.123456789F;
		System.out.println(f1);
		
		// double은 8byte 값을 가짐
		double d1 = 0.123456789;
		System.out.println(d1);
		
		// 문자형태
		// char 2byte 값을 가짐
		char c1 = 'a';
		char c2 = '0';
		char c3 = 97;
		char c4 = 48;
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		System.out.println(c4);
		
		// 논리형태
		// boolean 1byte 값을 가짐
		boolean b1 = true;
		boolean b2 = false;
		
		// 문자열 -> 기본형타입 x, 참조형타입
		// String
		
		String str = "안녕하세요.";
		System.out.println(str);
		
		// 형변환
		// 자동 형변환과 명시적 형변환이 존재
		
		// 자동 형변환
		byte n1 = 127;
		int n2 = n1;
		short n3 = 30000;
		n2 = n3;
		
		// 명시적 형변환
		// 우항 (넣고자하는 데이터 변수) 앞에 '(변환하고자하는 데이터타입)'
		
		float n4 = 3.14F;
		long n5 = 3_000_000_000L;
		n2 = (int)n4;
		System.out.println(n2);
		n2 = (int)n5;
		System.out.println(n2);
		
		// 10 = 15;
		// 상수
		// 한번 초기화되면 바꿀수 없는 메모리 공간
		
		// final 데이터타입 상수명 = 데이터;
		final int MAX = 15;
		// MAX = 20;
		final int MIN;
		MIN = 3;
		// MIN = 5;

	}

}
