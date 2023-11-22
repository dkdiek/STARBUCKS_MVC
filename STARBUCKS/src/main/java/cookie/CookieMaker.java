package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieMaker {
	
	// 쿠키 만들기
	public static void makeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift","ChocoCookie");
		cookie.setMaxAge(60 * 60 * 24); // 초 분 시 (유효 기간)
		res.addCookie(cookie);//
	}
	
	// 쿠키 없애기
	public static void removeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift","ChocoCookie");
		cookie.setMaxAge(0); // 초 분 시 (유효 기간)
		res.addCookie(cookie);//
	}

}
