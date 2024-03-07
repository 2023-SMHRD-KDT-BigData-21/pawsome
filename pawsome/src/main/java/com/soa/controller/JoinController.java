package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.Member;
import com.soa.model.MemberDAO;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String img = request.getParameter("img");
			String nick = request.getParameter("nick");
			
			Member member = new Member(id, name, pw, phone, email, img, nick);
			
			MemberDAO dao = new MemberDAO();
			int res = dao.join(member);
			
			if(res > 0) {
				System.out.println("가입 성공");
				response.sendRedirect("");
			} else {
				System.out.println("가입 실패");
				response.sendRedirect("");
			}
	}

}
