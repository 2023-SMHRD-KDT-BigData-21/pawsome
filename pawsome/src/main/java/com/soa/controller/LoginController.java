package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soa.model.Member;
import com.soa.model.MemberDAO;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			Member member = new Member(id, pw);

			MemberDAO dao = new MemberDAO();
			Member res = dao.login(member);
			
			if (res != null) {
				System.out.println(" 로그인 성공");
				HttpSession session = request.getSession();
				session.setAttribute("member", res);
				response.sendRedirect("");
			} else {
				System.out.println("로그인 실패");
				response.sendRedirect("");
			}
	}

}
