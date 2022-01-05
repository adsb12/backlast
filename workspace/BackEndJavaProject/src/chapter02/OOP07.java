package chapter02;

class A {

	int a1;
	int a2;
	
}

class B extends A {

	int b1;
	int b2;
	
}

class C extends A {

	int c1;
	int c2;
	
}

public class OOP07 {
	
	public static void changeData(A a) {
		
		a.a1 = 10;
		a.a2 = 20;
		
	}
	
	public static A setData(A a) {
		
		a.a1 = 20;
		a.a2 = 10;
		
		return a;
	}

	public static void main(String[] args) {
		
		A a = null;
		B b = new B();
		C c = new C();
		B b2;
		
		b.b1 = 1;
		a = b;
		b2 = (B)a;
		
		b2.b1 = 3;
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(b2);
		
		System.out.println(b2.b1);
		System.out.println(b.b1);
		
		changeData(b);
		System.out.println(b.a1);
		System.out.println(b.a2);
		
		changeData(c);
		System.out.println(c.a1);
		System.out.println(c.a2);
//		a.b1 = 2;
		
		B b3 = (B)setData(b2);
		C c2 = (C)setData(c);
		System.out.println(b3.a1);
		System.out.println(b3.a2);
		System.out.println(c2.a1);
		System.out.println(c2.a2);
		
		A a1 = new B();
		A a2 = new C();

	}

}
