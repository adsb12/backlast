package chapter01;

public class string01 {

	public static void main(String[] args) {
		
		// 문자열 String
		char[] str1 = {'a' , 'p' , 'p' , 'l' , 'e'};
		String str2 = "apple";
		
		System.out.println(str2.charAt(4));
		System.out.println(str2.indexOf('l'));
		
		int n1 = 0, n2 = 1;
		System.out.println(n1 == n2);
		System.out.println(str2 == "apple");
		System.out.println(str2.equals ("apple"));
		str2 = str2.replace("p", "P");
		System.out.println(str2);
		str2 = str2.replaceAll("P", "p");
		System.out.println(str2);
		

	}

}
