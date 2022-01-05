package chapter02;

import java.util.Arrays;

import tmp.MyMath;

public class OOPEx2 {

	public static void main(String[] args) {
		
		int[] arr = {9, 7, 6, 4, 8, 5};
		MyMath.sort(arr);
		System.out.println(Arrays.toString(arr));
		MyMath.sortR(arr);
		System.out.println(Arrays.toString(arr));
		MyMath.reverse(arr);
		System.out.println(Arrays.toString(arr));

	}

}
