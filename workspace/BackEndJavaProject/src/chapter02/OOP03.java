package chapter02;

import java.util.Scanner;

public class OOP03 {

	public static void main(String[] args) {
		
		Scanner sc;
		
		Book[] books = new Book[3];
//		 Book book = new Book();
		
		for(int i = 0; i < 3; i++) {
			
			sc = new Scanner(System.in);
			
			Book book = new Book();
			
			book.title = sc.nextLine();
			book.writer = sc.nextLine();
			book.price = sc.nextInt();
		
			books[i] = book;
			
		}
		
		for (int i = 0; i < 3; i++) {
			
			System.out.println(books[i].title);
			System.out.println(books[i].writer);
			System.out.println(books[i].price);
			
		}

	}

}
