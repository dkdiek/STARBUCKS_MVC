package index.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cookie.CookieMaker;

public class IndexController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//        // 디바이스 쿠키가 없으면 생성
//		boolean deviceCookieExists = checkDeviceCookie(req);
//        if (!deviceCookieExists) {
//            CookieMaker.makeDeviceCookie(res);
//        }
        
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("/index.star")) {
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
	}
	
//	// 디바이스 쿠키 존재여부 확인 메소드
//	private static boolean checkDeviceCookie(HttpServletRequest req) {
//        Cookie[] cookies = req.getCookies();
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if ("DeviceCookie".equals(cookie.getName())) {
//                    return true;
//                }
//            }
//        }
//        return false;
//    }
}

