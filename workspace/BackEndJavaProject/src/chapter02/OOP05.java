package chapter02;

import java.util.Scanner;
import java.util.*;
//import tmp.Unit;
//import java.*;
import static java.lang.System.out;

class Person {
	
	String name;
	int age;
	String birth;
	
	Person(String name, int age, String birth) {
		this.name = name;
		this.age = age;
		this.birth = birth;
	}
	
	void eat(String food) {
		System.out.println(this.name + "가 " + food + "를 먹습니다.");
	}
}

class Student extends Person {
	
	String name;
	String stdNum;
	int grade;
	String school;
	
	Student(String name, int age, String birth, String stdNum, int grade, String school) {
		super(name, age, birth);
		this.stdNum = stdNum;
		this.grade = grade;
		this.school = school;
		System.out.println(name);
		System.out.println(this.name);
		System.out.println(super.name);
	}
	
	void goSchool() {
		System.out.println(super.name + "가 " + this.school + "에 등교합니다.");
	}
	
	void eat(String food) {
		System.out.println(this.name + "가 " + this.school + "에서 " + food + "를 먹습니다.");
	}
	
}

class Employee extends Person {
	
	int empNum;
	String part;
	String grade;
	
	public Employee(String name, int age, String birth, int empNum, String part, String grade) {
		super(name, age, birth);
		this.empNum = empNum;
		this.part = part;
		this.grade = grade;
	}

	void changePart(String part) {
		System.out.println(this.name + "의 부서가" + this.part + "에서" + part + "로 변경됩니다.");
		this.part = part;
	}
}


public class OOP05 extends Object{

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);

		Student student1 = new Student("홍길동", 15, "060101" ,"20200125", 2 ,"한국 중학교");
		
		student1.eat("사과");
		student1.goSchool();
		
//		System.out.println(Unit.m);
		
		OOP04 oop04 = new OOP04();
		
		}
}
