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
			
			
			String user_id = request.getParameter("userId");
			String user_pw = request.getParameter("userPw");
			
			// System.out.println("성공!");
			
			Member member = new Member(user_id, user_pw);
			// System.out.println(member);
			MemberDAO dao = new MemberDAO();
			Member res = dao.login(member);
			System.out.println(res);
			
			if(res==null) {
				System.out.println("실패");
			}else {
				System.out.println("성공");
				HttpSession session = request.getSession();
				session.setAttribute("member", res);
			}
	}

}
