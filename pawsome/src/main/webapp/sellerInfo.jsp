<%@page import="com.soa.model.Member"%>
<%@page import="com.soa.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.soa.model.ImageFileDAO"%>
<%@page import="com.soa.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.soa.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/sellerInfo.css">
</head>
<body>
<%
	String seller_id = request.getParameter("seller_id");
	MemberDAO mdao = new MemberDAO();
	Member member = mdao.idCheck(seller_id);
	System.out.println(member);
	pageContext.setAttribute("member", member);
	
	ProductDAO pdao = new ProductDAO();
	List<Product> plist = pdao.myProduct(seller_id);
	pageContext.setAttribute("plist", plist);
	
	ImageFileDAO idao = new ImageFileDAO();
	List<String> ilist = new ArrayList();
	for(int i = 0; i < plist.size(); i++) {
	 ilist.add(idao.myProductImage(plist.get(i).getProduct_id()));
	}
%>
	<div class="bigBox">
        <div class="card">
            <div class="left">
                <div class="circle">
                    <%if(member.getUser_img()==null) {%>
                        <img class="photo" src="https://www.studiopeople.kr/common/img/default_profile.png">
                    <%}else { %>
                        <img class="photo" src="data:image/jpg;base64,<%=member.getUser_img() %>">
                    <%} %>
                </div>
            </div>
            <div class="right">
                <div class="up"><%=member.getUser_nick() %></div>
                <div class="middle">
                    신뢰도
                    <span class="padding" style="padding-right: 20px"></span>
                    <div class="credit">
                        <div id="gauge"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 판매글 리스트 불러오기 begin -->
    <div  class="listBox">
        <h3 class="listBoxTitle">판매글 리스트</h3>
        <div class="listalign">

            <!-- productList 클래스를 반복시켜주면 돼요 -->
            <div class="productList">
                <div class="productImg">
                    <img src="https://thumbnail.10x10.co.kr/webimage/image/basic600/457/B004579162.jpg?cmd=thumb&w=400&h=400&fit=true&ws=false" alt="">
                </div>
                <div class="productText">
                    <h3>제목</h3>
                    <h3>가격</h3>
                    <h3>날짜</h3>
                </div>
            </div>

            <div class="productList">
                <div class="productImg">
                    <img src="https://thumbnail.10x10.co.kr/webimage/image/basic600/457/B004579162.jpg?cmd=thumb&w=400&h=400&fit=true&ws=false" alt="">
                </div>
                <div class="productText">
                    <h3>제목</h3>
                    <h3>가격</h3>
                    <h3>날짜</h3>
                </div>
            </div>

           <div class="productList">
                <div class="productImg">
                    <img src="https://thumbnail.10x10.co.kr/webimage/image/basic600/457/B004579162.jpg?cmd=thumb&w=400&h=400&fit=true&ws=false" alt="">
                </div>
                <div class="productText">
                    <h3>제목</h3>
                    <h3>가격</h3>
                    <h3>날짜</h3>
                </div>
            </div>
          
        </div>        
    </div>
    <!-- 판매글 리스트 불러오기 end -->
</body>
</html>