package chapter01;

public class Operator01 {

	public static void main(String[] args) {
		
		// 연산자
		// 산술연산, 비교연산, 단항연산, 논리연산, 대입연산
		
		// 산술 : +, -, *, /, %
		int a = 10, b = 3;
		float c = 3.0F;
		
		System.out.println(a + b);
		System.out.println(a - b);
		System.out.println(a * b);
		System.out.println(a / b);
		System.out.println(a % b);
		
		System.out.println(a + c);
		System.out.println(a - c);
		System.out.println(a * c);
		System.out.println(a / c);
		System.out.println(a % c);
		
		// 대입 : =, +=, -=, *=, /=, %=
		int n = 0;
		
		n += 5;
		System.out.println(n);
		n -= 3;
		System.out.println(n);
		n *= 3;
		System.out.println(n);
		n /= 4;
		System.out.println(n);
		n %= 2;
		System.out.println(n);
		
		// 증감 : ++, --
		
		// 전위 증감
		int num = 5;
		System.out.println(++num);
		System.out.println(--num);
		
		// 후위 증감
		System.out.println("num : " + num);
		System.out.println("num++ : " + num++);
		System.out.println("num : " + num);
		System.out.println("num-- : " + num--);
		System.out.println("num : " + num);
		
		System.out.println("num : " + num);
		System.out.println(++num + 3);
		System.out.println("num : " + num);
		System.out.println(num ++ + 3);
		System.out.println("num : " + num);
		
	}

}
