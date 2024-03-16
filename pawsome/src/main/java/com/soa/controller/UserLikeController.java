package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.UserLike;
import com.soa.model.UserLikeDAO;

public class UserLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String product_id = request.getParameter("product_id");
			String user_id = request.getParameter("user_id");
			String check = request.getParameter("check");
			
			
			UserLike like = new UserLike(product_id,user_id);
			UserLikeDAO dao = new UserLikeDAO();
			
			if(check != null) {
				dao.checkLike(like);
			} else {
				dao.updateLike(like);			
			}
	}

}
