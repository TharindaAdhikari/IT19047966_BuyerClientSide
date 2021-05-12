package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/BuyerAPI")
public class BuyerAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	Buyer buyerObj = new Buyer();
    public BuyerAPI() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = buyerObj.insertBuyer(request.getParameter("bName"), request.getParameter("bAddress"),
				request.getParameter("bEmail"), request.getParameter("bDate"), request.getParameter("pNo"));
		response.getWriter().write(output);
	}
	
	// Convert request parameters to a Map
			private static Map getParasMap(HttpServletRequest request) {
				Map<String, String> map = new HashMap<String, String>();
				try {
					Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
					String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
					scanner.close();
					String[] params = queryString.split("&");
					for (String param : params) {
						String[] p = param.split("=");
						map.put(p[0], p[1]);
					}
				} catch (Exception e) {
				}
				return map;
			}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = buyerObj.updateBuyers(paras.get("hidBuyerIDSave").toString(), paras.get("bName").toString(),
				paras.get("bAddress").toString(), paras.get("bEmail").toString(), paras.get("bDate").toString(),
				paras.get("pNo").toString());
		response.getWriter().write(output);
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = buyerObj.deleteBuyer(paras.get("bID").toString());
		response.getWriter().write(output);
	}

}
