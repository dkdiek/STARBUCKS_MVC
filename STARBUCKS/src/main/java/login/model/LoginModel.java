package login.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cookie.CookieMaker;

public class LoginModel {

	public static void login(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPw");
		// id가 null이면 nullpointerexception 발생 상수 앞에
		if ("hongkd".equals(id) && "1234".equals(pw)) {
			//세션에 username 저장
			req.getSession().setAttribute("userName", id);
			CookieMaker.makeCookie(res);
		} else {
			req.setAttribute("msg", "아이디 또는 비밀번호를 다시 확인해 주세요");
			//req.getSession().removeAttribute("userName");
		}
	}

	public static void logout(HttpServletRequest req, HttpServletResponse res) {
		// 세션에서 userName 속성 제거
		req.getSession().removeAttribute("userName");
		
		// 세션에서 loginTime 속성 제거
	    req.getSession().removeAttribute("formattedLoginTime");
	    
		// 쿠키 지우기
		CookieMaker.removeCookie(res);
	}
}
