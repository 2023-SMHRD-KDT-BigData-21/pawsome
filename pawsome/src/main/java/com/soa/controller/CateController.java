package com.soa.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.soa.model.Product;
import com.soa.model.ProductDAO;

public class CateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// JSON 데이터를 읽어 들임
        StringBuilder sb = new StringBuilder();
        String line = null;
        
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (Exception e) { /* 예외 처리 */ }

        // JSON 문자열을 파싱
        String json = sb.toString();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
        
        String animal_cate = jsonObject.get("animal_cate").getAsString();
        String product_cate = jsonObject.get("product_cate").getAsString();
        
        // 이후 로직 처리
        Product pd = new Product(animal_cate, product_cate);
        ProductDAO dao = new ProductDAO();
        List<Product> clist = dao.cate(pd);
        
        HttpSession session = request.getSession();
        session.setAttribute("catelist", clist);
        
        // JSON 데이터로 응답하기 위해 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(clist));
        
    }

}
