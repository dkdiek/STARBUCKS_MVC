package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieMaker {
	
	public static void makeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift", "cookie");
		cookie.setMaxAge(60 * 60 * 24);
		res.addCookie(cookie);
	}
	
	public static void removeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift", "cookie");
		cookie.setMaxAge(0);
		res.addCookie(cookie);
	}

}
