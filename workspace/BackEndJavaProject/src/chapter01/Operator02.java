package chapter01;

public class Operator02 {

	public static void main(String[] args) {
		
		// 비교 : 좌항을 기준으로 우항과 비교
		int a = 10, b = 20, c = 10;
		
		// 같다
		System.out.println(a == b);
		System.out.println(a == c);
		
		// 다르다
		System.out.println(a != b);
		System.out.println(a != c);
		
		// 작다 크다
		System.out.println(a < b);
		System.out.println(a > b);
		System.out.println(a < c);
		System.out.println(a > c);
		
		System.out.println(a <= c);
		System.out.println(a >= c);
		
		System.out.println("----------------------");
		
		// 논리 : and(&&), or(||), not(!)
		boolean b1 = true, b2 = false, b3 = true, b4 = false;
		
		// not : 부정 연산 - !
		System.out.println(!b1);
		System.out.println(!b2);
		
		// and : 논리곱 연산 - &&
		System.out.println(b1 && b3);
		System.out.println(b1 && b4);
		System.out.println(b2 && b3);
		System.out.println(b2 && b4);
		
		// or : 논리합 연산 - ||
		System.out.println(b1 || b3);
		System.out.println(b1 || b4);
		System.out.println(b2 || b3);
		System.out.println(b2 || b4);
		
		System.out.println(true && true || false);
		System.out.println(false && true || true);
		
		boolean a1;
		//		  false				  false
		a1 = (a++ > 10) && (b++ < 10);
		System.out.println("a : " + a + " b : " + b);
		
		System.out.println("");
		
		a1 = (a++ > 10) && (++b < 10);
		System.out.println("a1 : " + a1);
		System.out.println("a : " + a + " b : " + b);
		
		a1 = ((a += 20) > 10) || (b++ < 10);
		System.out.println("a1 : " + a1);
		System.out.println("a : " + a + " b : " + b);
	}

}










