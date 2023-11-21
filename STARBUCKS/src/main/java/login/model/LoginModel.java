package login.model;

import javax.servlet.http.HttpServletRequest;

public class LoginModel {

	public static void checkUser(HttpServletRequest req) {
		String id = (String) req.getParameter("userId");
		String pw = (String) req.getParameter("userPw");

		if ("hongkd".equals(id) && "1234".equals(pw)) {
			req.getSession().setAttribute("userName", "홍길동");
		} else {
			req.getSession().removeAttribute("userName");
		}
	}

	public static void logout(HttpServletRequest req) {
		// 세션에서 userName 속성 제거
		req.getSession().removeAttribute("userName");
	}
}
