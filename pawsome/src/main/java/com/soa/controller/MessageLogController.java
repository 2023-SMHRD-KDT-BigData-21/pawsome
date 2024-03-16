package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soa.model.MessageLog;
import com.soa.model.MessageLogDAO;

public class MessageLogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			
			String content = request.getParameter("m_content");
			String rnum = request.getParameter("room_no");
			String sender = request.getParameter("sender"); 
			
			System.out.println(content);
			System.out.println(rnum);
			System.out.println(sender);
			
			MessageLog log = new MessageLog(rnum, sender, content);
			
			System.out.println(log);
			System.out.println(content);
			MessageLogDAO dao = new MessageLogDAO();
			dao.mLog(log);
	}

}
