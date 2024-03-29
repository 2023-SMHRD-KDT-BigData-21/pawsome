package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.soa.model.Member;
import com.soa.model.MemberDAO;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			String savePath = request.getServletContext().getRealPath("/profile") ;
			System.out.println(savePath);
			int sizeLimit = 5 * 1024 * 1024 ; // 5메가로 제한. 넘어서면 예외 발생
			
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			String user_id = multi.getParameter("userId");
			String user_pw = multi.getParameter("userPw");
			String user_name = multi.getParameter("userName");
			String user_nick = multi.getParameter("userNick");
			String user_email = multi.getParameter("userEmail");
			String user_phone = multi.getParameter("userPhone");
			String user_img = multi.getOriginalFileName("userImg");
			
			
			Member member = new Member(user_id, user_name, user_pw, user_phone, user_email, user_img, user_nick);								
			
			MemberDAO dao = new MemberDAO();
			int res = dao.join(member);
			
			
			if(res>0) {
				System.out.println("회원가입 완료");
				response.sendRedirect("main.jsp");
			}else {
				System.out.println("회원가입 실패");
				response.sendRedirect("join.jsp");
				
			}
			
			
	}

}
