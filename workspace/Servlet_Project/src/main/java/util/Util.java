package util;

public class Util {
	
	public static String setXss(String str) {
		return str.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>");
	}
	
}
