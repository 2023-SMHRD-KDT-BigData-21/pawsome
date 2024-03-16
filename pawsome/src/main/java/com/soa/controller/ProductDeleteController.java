package com.soa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.ImageFileDAO;
import com.soa.model.ProductDAO;


public class ProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

	    String product_id = request.getParameter("product_id");
		
		ProductDAO pdao = new ProductDAO();
		int res = pdao.deleteProduct(product_id);
		ImageFileDAO idao = new ImageFileDAO();
		int resu = idao.deleteImage(product_id);
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(res);
		if (res>0 && resu>0) { // 게시글 등록 성공
		    System.out.println(res);
		    writer.println("<script>alert('게시글이 삭제되었습니다.'); location.href='main.jsp';</script>");
		} else { // 게시글 등록 실패
		    System.out.println(res);
		    writer.println("<script>alert('게시글 삭제에 실패했습니다.'); location.href='main.jsp';</script>");
		}
	}

}
