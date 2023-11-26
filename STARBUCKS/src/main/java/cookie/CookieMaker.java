package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieMaker {
	
	// 로그인 쿠키
	public static void makeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift", "event");
		cookie.setMaxAge(60 * 60 * 24);
		res.addCookie(cookie);
	}
	
	public static void removeCookie(HttpServletResponse res) {
		Cookie cookie = new Cookie("BlackFridayGift", "event");
		cookie.setMaxAge(0);
		res.addCookie(cookie);
	}
	
//	// 디바이스 쿠키
//	public static void makeDeviceCookie(HttpServletResponse res) {
//		Cookie deviceCookie = new Cookie("DeviceCookie", "deviceCookie");
//		deviceCookie.setMaxAge(60 * 60 * 24 * 7);
//		res.addCookie(deviceCookie);
//	}
//	
//	public static void removeDeviceCookie(HttpServletResponse res) {
//		Cookie deviceCookie = new Cookie("PopupCookie", "popupCookie");
//		deviceCookie.setMaxAge(0);
//		res.addCookie(deviceCookie);
//	}
}
