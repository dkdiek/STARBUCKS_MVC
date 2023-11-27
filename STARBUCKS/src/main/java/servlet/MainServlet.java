package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import file.controller.FileController;
import file.model.FileModel;
import index.controller.IndexController;
import login.controller.LoginController;
import starbucks.controller.StarbucksController;

public class MainServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("요청 URL : " + req.getRequestURL());
		
		String uri = req.getRequestURI();
		
		
		if (-1 < uri.indexOf("/index.star")) {
			IndexController.service(req, res);
		}
		
		if (-1 < uri.indexOf("/starbucks/")) {
			StarbucksController.service(req, res);
			/*
			 * boolean hasSession = IndexModel.checkSession(req); if(hasSession) {
			 * StarbucksController.service(req, res); } else { // 세션이 없으면 인덱스로 날림
			 * res.sendRedirect("/index.star"); }
			 */		}
		
		if (-1 < uri.indexOf("/login.star")) {
			LoginController.service(req, res);
		}
		
		if (-1 < uri.indexOf("/logout.star")) {
			LoginController.service(req, res);
		}
		if (-1 < uri.indexOf("/file/")) {
			FileController.service(req, res);
		}
		
		// download 폴더의 파일명 배열을 json으로 전달 - JS fetch 엔드포인트 설정
		if (-1 < uri.indexOf("/getDownloadFileList.star")) {
			FileModel.getDownloadFileList(req, res);
		}

	}

}
