package chapter02;

class MyMath {
	
	static int add(int a, int b) {
		
		return a+b;
		
	}
	
	static int add(int a, int b, int c) {
		return a+b+c;
	}
	
	/*
	static float add(int a, int b) {
		
		return (float)a + (float)b;
	}
	 */
	
	static float triArea(int width, int height) {
		
		return (float)width * (float)height / 2;
	}
	
	static float triArea(float width, int height) {
		
		return width * (float)height / 2;
	}
	
	static float triArea(int width, float height) {
	
	return (float)width * height / 2;
	}
	
	static float triArea(float width, float height) {
		
		return width * height / 2;
	}
}

class Triangle {
	
	int height;
	int width;
	float area;
	
	Triangle() {
		this(40, 30);
		height = 20;
		width = 30;
		area = MyMath.triArea(width, height);
		System.out.println("삼각형이 생성되었습니다.");
	}
	
	Triangle(int height, int width) {
//		this();
		System.out.println(this.height);
		System.out.println(this.width);
		this.height = height;
		this.width = width;
		area = MyMath.triArea(width, height);
		System.out.println("삼각형이 생성되었습니다.");
	}
}
	
public class OOP04 {

	public static void main(String[] args) {
		
		int rs1 = MyMath.add(1, 2);
		int rs2 = MyMath.add(1, 2, 3);
		
		Triangle tri1 = new Triangle(70, 20);
		// Triangle tri2 = new Triangle();
		System.out.println(tri1.height);
		System.out.println(tri1.width);
		System.out.println(tri1.area);

	}

}
