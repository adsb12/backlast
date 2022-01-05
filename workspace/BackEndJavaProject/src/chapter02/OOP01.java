package chapter02;

class Person1 {
	
	static String contury = "korea";
	
	String name;
	String tel;
	String address;
	int age;
	
	void eat(String food) {
		System.out.println(name + "이/가");
		System.out.println(food + "를 ");
		System.out.println("먹습니다.");
	}
	
	int nextAge() {
		
		return age + 1;
	}
	
	void getInfo() {
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("tel : " + tel);
		System.out.println("address : " + address);
	}
	
	void ridingCar1(Car c) {
		
		System.out.println(name + "이" + c.cc + "배기량 차량을 탑승합니다.");
		c.cc  = 2000;
		System.out.println("c의 배기량을 2000 변경했습니다.");
		
	}
	
	void ridingCar2(int cc) {
		
		System.out.println(name + "이" + cc + "배기량 차량을 탑승합니다.");
		cc  = 2000;
		System.out.println("c의 배기량을 2000 변경했습니다.");
		
	}
	
	Car changeCar(Car c) {
		
		Car car = c;
		car.type = "세단";
		car.cc = 3000;
		
		return car;
	}
	
}

class Car {
	
	String type;
	int cc;
	
	static void sell() {
		System.out.println("자동차를 구매합니다.");
	}
	
}

public class OOP01 {

	public static void main(String[] args) {
		
		Person1 man;	              // 객체 선언
		man = new Person1();	  // 객체 생성
		
		Person1 woman = new Person1();  // 객체 생성과 동시에 초기화
		Car car = new Car();
		car.type = "SUV";
		car.cc = 2500;
		
		man.name = "홍길동";
		man.age	 = 30;
		man.tel = "010-1111-1111";
		man.address = "부산광역시";
		
		woman.name = "이영희";
		woman.age	 = 28;
		woman.tel = "010-2222-2222";
		woman.address = "울산광역시";
		
		System.out.println(man.name);
		System.out.println(woman.name);
		
		man.eat("사과");
		System.out.println(man.nextAge());
		
		man.getInfo();
		woman.getInfo();
		
		Person1 man2 = new Person1();
//		Person1.name;
//		man2.name;
		System.out.println(man.contury);
		System.out.println(woman.contury);
		System.out.println(man2.contury);
		System.out.println(Person1.contury);
		
		System.out.println();
		
		System.out.println(car.cc);
		man.ridingCar1(car);
		System.out.println(car.cc);
		
		System.out.println();
		
		car.cc = 2200;
		System.out.println(car.cc);
		man.ridingCar2(car.cc);
		System.out.println(car.cc);
		
		Car car2 = man.changeCar(car);
		System.out.println(car);
		System.out.println(car2);
		System.out.println(car.type);
		System.out.println(car2.type);
		
		car2.type = "SUV";
		System.out.println(car.type);
		System.out.println(car2.type);
		
		Car.sell();

	}

}
