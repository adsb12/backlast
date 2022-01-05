package chapter02;

abstract class A1 {
	
	int a1;
	int a2;
	
	abstract void printA12(); 
}

class B1 extends A1 {
	void printA12() {
		
	}
}

class B2 extends A1 {
	void printA12() {
		
	}
}


public class OOP08 {

	public static void main(String[] args) {

		B1 b1 = new B1();
		B2 b2 = new B2();
//		A1 a1 = new A1();
		
		b1.a1 = 1;
		b1.a2 = 2;
		
		b2.a1 = 1;
		b2.a2 = 2;
		
		b1.printA12();
		b2.printA12();
		
	}

}
