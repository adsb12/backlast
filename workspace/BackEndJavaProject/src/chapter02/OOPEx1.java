package chapter02;

import java.util.Scanner;

// 버스 현재 탑승 인원과 버스의 총수익, 총 탑승객을 구하는 프로그램
// 버스는 객체 -> 클래스
// 버스번호, 현재 탑승 인원, 총 탑승인원, 총 수익, 요금, 정류장
// 승객이 탑승, 하차, 정거장에 도착, 출발, 현재 탑승인원 출력, 총수익 출력, 총 탑승객 출력

class Bus {
	
	int busNum;
	int checkNum;
	int checkTotal;
	int incomeTotal;
	int[] charge;
	String[] stops;
	
	// 생성자
	Bus(int busNum, int[] charge, String[] stops) {
		this.busNum = busNum;
		this.checkNum = 0;
		this.checkTotal = 0;
		this.incomeTotal = 0;
		this.charge = charge;
		this.stops = stops;
		
		for(int i = 0; i < stops.length; i++) {
			arrival(i);
			leave(i);
			printNow();
			for(int j = 0; j < 10_000_000; j++);
		}
		printFinish();
	}
	
	// 탑승
	void checkIn(int child, int youth, int adult) {
		// 현재 탑승 인원에 추가
		checkNum += (child + youth + adult);
		// 총 탑승 인원에 추가
		checkTotal += (child + youth + adult);
		// 총 수익 계산
		incomeTotal += (charge[0] * child + charge[1] * youth + charge[2] * adult);
	}
	
	// 하차
	void checkOut(int outs) {
		if(checkNum - outs > 0) {
			checkNum -= outs;
		}else {
			checkNum = 0;
		}
	}
	
	// 정거장 도착
	void arrival(int i) {
		System.out.println(stops[i] + " 에 도착했습니다.");
		
		Scanner sc = new Scanner(System.in);
		int child = sc.nextInt();
		int youth = sc.nextInt();
		int adult = sc.nextInt();
		
		checkIn(child, youth, adult);
	}
	
	// 정거장 출발
	void leave(int i) {
		Scanner sc = new Scanner(System.in);
		int outs = sc.nextInt();
		
		checkOut(outs);
		
		System.out.println(stops[i] + " 에서 출발했습니다.");
	}
	
	// 현재 탑승인원
	void printNow() {
		System.out.println("현재 탑승 인원 : " + checkNum);
	}
	
	// 총 수익, 탑승객 출력
	void printFinish() {
		System.out.println("총 탑승객 : " + checkTotal);
		System.out.println("총 수익 : " + incomeTotal);
	}
}

public class OOPEx1 {

	public static void main(String[] args) {

		new Bus(5, new int[]{700, 900, 1000}, new String[]{"정류장1", "정류장2", "정류장3"});
		
	}

}
