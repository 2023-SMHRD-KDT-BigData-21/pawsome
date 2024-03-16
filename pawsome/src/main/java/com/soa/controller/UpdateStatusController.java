package com.soa.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.Product;
import com.soa.model.ProductDAO;

public class UpdateStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			BigDecimal product_id = new BigDecimal(request.getParameter("product_id"));
			String buyer_id = request.getParameter("buyer_id");
			
			Product product = new Product(product_id, buyer_id);
			ProductDAO dao = new ProductDAO();
			
			dao.updateStatus(product);
	}

}
