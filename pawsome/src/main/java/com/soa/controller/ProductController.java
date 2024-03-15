package com.soa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.soa.model.ImageFile;
import com.soa.model.ImageFileDAO;
import com.soa.model.Product;
import com.soa.model.ProductDAO;

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String savePath = request.getServletContext().getRealPath("/upload") ;
	    System.out.println(savePath);
	    int sizeLimit = 5 * 1024 * 1024 ; // 5메가로 제한. 넘어서면 예외 발생
	    
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		// 글 정보
		String product_name = multi.getParameter("product_name");
		String product_price = multi.getParameter("product_price");
		String product_content = multi.getParameter("product_content");
		String animal_cate = multi.getParameter("g001");
		String product_cate = multi.getParameter("g002");
		
		// 사진 정보
		String file_name1 = multi.getOriginalFileName("file_name1");
		String file_name2 = multi.getOriginalFileName("file_name2");
		String file_name3 = multi.getOriginalFileName("file_name3");
		String file_name4 = multi.getOriginalFileName("file_name4");
		String file_name5 = multi.getOriginalFileName("file_name5");
		
		ImageFile imageFile = new ImageFile(file_name1, file_name2, file_name3, file_name4, file_name5);
		Product pd = new Product(product_name, product_price, product_content, product_cate, animal_cate);
		
		System.out.println(pd);
		System.out.println(imageFile);
		
		// 글 정보 DAO로 insert
		ProductDAO dao = new ProductDAO();
		String res = dao.insert(pd);
		
		// 사진 정보 DAO로 insert
		ImageFileDAO imgdao = new ImageFileDAO();
		imgdao.imgInsert(imageFile,res);
		
	}

}