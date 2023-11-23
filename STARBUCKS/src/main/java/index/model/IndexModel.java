package index.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexModel {
	// HttpServletResponse res뺏음 AuhFilter에서 쓰는것때문에
	
	public static boolean checkSession(HttpServletRequest req) throws IOException{
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
