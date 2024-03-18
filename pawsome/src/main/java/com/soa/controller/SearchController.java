package com.soa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soa.model.Product;
import com.soa.model.ProductDAO;

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			//HttpSession session = request.getSession();
			
			String product_name = request.getParameter("s_word");
			
			Product pd = new Product(product_name);
			ProductDAO dao = new ProductDAO();
			
			List<Product> list = dao.search(pd);
			
			request.setAttribute("search_result", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp"); // 결과를 보여줄 JSP 페이지
			dispatcher.forward(request, response);
	}

}
