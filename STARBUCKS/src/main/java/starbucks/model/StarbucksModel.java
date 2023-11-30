package starbucks.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


public class StarbucksModel {

	
	public static void makeFood(HttpServletRequest req) {
		String menu = req.getParameter("menu");
		String amount = req.getParameter("amount");
		int sum = 0;
		
		if("cake".equals(menu)) {
			sum = 5000 * Integer.parseInt(amount);
		}
		if("coffee".equals(menu)) {
			sum = 5500 * Integer.parseInt(amount);
		}
		if("sandwich".equals(menu)) {
			sum = 6000 * Integer.parseInt(amount);
		}
		req.setAttribute("menu", menu);
		req.setAttribute("amount", Integer.parseInt(amount));
		req.setAttribute("sum", String.valueOf(sum));
	}

	
}
