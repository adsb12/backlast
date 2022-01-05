package chapter02;

//import tmp.Unit;

//final class Class01 {
class Class01{
	
	int a;
	
	/*final*/ int a() {
		
		return 0;
	}
}

class Class02 extends Class01 {
	
	/*final*/ int b = 0;
	
	int b() {
		b = 1;
		return 0;
	}
	
	int a() {
		
		return 1;
	}
}

public class OOP06 {

	public static void main(String[] args) {
		
		Unit_ unit = new Unit_(1, 2, 3, 4, 5);
		
//		System.out.println(unit.mm());
		System.out.println(unit.getMm());
		
//		unit.mm = 3;
		unit.setMm(3);
		System.out.println(unit.getMm());
		
//		Unit unit2 = new Unit();

	}

}
