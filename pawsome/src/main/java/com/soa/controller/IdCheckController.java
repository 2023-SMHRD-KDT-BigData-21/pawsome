package com.soa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.Member;
import com.soa.model.MemberDAO;

public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		System.out.println(id);
		System.out.println(nick);
		System.out.println(email);
		
		MemberDAO dao = new MemberDAO();
		Member res = null;
		if(id != null) {
			res = dao.idCheck(id);
		} else if( nick != null) {
			res = dao.nickCheck(nick);	
		} else if( email != null ) {
			res = dao.emailCheck(email);
		}

		System.out.println(res);

		PrintWriter out = response.getWriter();

		if (res != null) { // 사용할 수 없는 아이디 (NN)
			out.print("NN");
		} else { // 사용할 수 있는 아이디 (YY)
			out.print("YY");
		}
	}

}
