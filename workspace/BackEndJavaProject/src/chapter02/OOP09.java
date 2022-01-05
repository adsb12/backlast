package chapter02;

interface My_interface {
	
	public static final int n = 0;
	public abstract void method1();
	
}

interface My_interface2 {
	
	public static final int n2 = 10;
	public abstract void method2();
	
}

class My_class implements My_interface, My_interface2 {

	public void method1() {
		
		System.out.println(n);
		
	}

	public void method2() {
		System.out.println(n);
	}
		
}

public class OOP09 {

	public static void main(String[] args) {

		My_class cl = new My_class();
		cl.method1();
		cl.method2();
	}

}
