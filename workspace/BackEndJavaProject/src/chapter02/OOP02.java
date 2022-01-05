package chapter02;

class Book {
	
	String title;
	String writer;
	int price;
	
}

public class OOP02 {

	public static void main(String[] args) {
		
		// 객체 배열
		Book[] books;
		books = new Book[3];
		
		Book book = new Book();
		Book book1;
		books[0] = book;
		books[1] = new Book();
//		books[2] = book1;
		
		books[0].title = "달러구트 꿈 백화점";
		books[0].writer = "이미예";
		books[0].price = 14800;
		
		books[1].title = "달러구트 꿈 백화점2";
		books[1].writer = "이미예";
		books[1].price = 13800;
		
		
		book1 = books[1];
		book1.title = "왜 일하는가?";
		
		books[2] = book1;
		
		System.out.println(book.title);
		System.out.println(books[1].title);
		
		for(int i = 0; i < books.length; i++) {
			
			System.out.println(books[i].title);
			System.out.println(books[i].writer);
			System.out.println(books[i].price);
			
		}
		
	}
	
}
