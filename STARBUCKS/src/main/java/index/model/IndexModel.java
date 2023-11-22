package index.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexModel {
	
	public static boolean checkSession(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession();
		Object unObj = session.getAttribute("userName");
		// 세션이 없으면 index로 보내버림
		if ( null == unObj) {
			return false;
		} else {
			return true;
		}
	}
}
