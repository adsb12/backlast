package tmp;

public class MyMath {

	// 오름차순 정렬 메소드
	public static void sort(int arr[]) {
		int tmp;
		for(int i = 1; i < arr.length; i++) {
			for(int  j = 0; j < arr.length - i; j++) {
				if(arr[j] > arr[j + 1]) {
					tmp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = tmp;
				}
			}
		}
	}
	// 내림차순 정렬
	public static void sortR(int arr[]) {
		int tmp;
		for(int i = 1; i < arr.length; i++) {
			for(int  j = 0; j < arr.length - i; j++) {
				if(arr[j] < arr[j + 1]) {
					tmp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = tmp;
				}
			}
		}
	}
	// 배열 역전 메소드
	public static void reverse(int arr[]) {
		
		final int LENGTH = arr.length - 1;
		final int CYCLE = arr.length / 2;
		
		for(int i = 0; i < CYCLE; i++) {
			int tmp = arr[LENGTH - i];
			arr[LENGTH - i] = arr[i];
			arr[i] = tmp;
		}
	}
	// 최대값 반환하는 메소드
	public static int getMax(int arr[]) {
		
		int rs = arr[0];
		
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] > rs) rs = arr[i];
		}
		
		return rs;
	}
	// 최솟값 반환하는 메소드
	public static int getMin(int arr[]) {
		
		int rs = arr[0];
		
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] < rs) rs = arr[i];
		}
		
		return rs;
	}
}
