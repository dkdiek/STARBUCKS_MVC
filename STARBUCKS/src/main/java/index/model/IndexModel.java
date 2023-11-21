package index.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class IndexModel {
	
	public static void checkSession(HttpServletRequest req){
		HttpSession session = req.getSession();
		Object unObj = session.getAttribute("userName");
		// null이면 캐스팅 예외 발생 방지
		String userName = "";
		if ( null != unObj) {
			userName = (String)unObj;
		}
		req.setAttribute("userName", userName);
	}

}
