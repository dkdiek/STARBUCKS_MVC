package login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;

public class LoginController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		if (-1 < uri.indexOf("/login.star")) {
			LoginModel.login(req, res);
			res.setContentType("text/html;charset=UTF-8");
			//포워딩 처리
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);

			//리다이렉트 처리해서 index.star로 url 보이게 함(리다이렉트하면 index.jsp에서 msg값 없어짐)
			//res.sendRedirect(req.getContextPath() + "/index.star");

		}
		
		if (-1 < uri.indexOf("/logout.star")) {
			LoginModel.logout(req, res);
			res.setContentType("text/html;charset=UTF-8");
			//포워딩 처리
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);

			//리다이렉트 처리해서 index.star로 url 보이게 함(리다이렉트하면 index.jsp에서 msg값 없어짐)
			//res.sendRedirect(req.getContextPath() + "/index.star");
		}
	
	}
}
