package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.ProductDAO;

public class UpdateStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String product_id = request.getParameter("product_id");
			
			ProductDAO dao = new ProductDAO();
			
			dao.updateStatus(product_id);
	}

}
