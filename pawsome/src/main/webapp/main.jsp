<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.soa.converter.ImageToBase64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.soa.model.ImageFile"%>
<%@page import="com.soa.model.Product"%>
<%@page import="com.soa.model.ImageFileDAO"%>
<%@page import="com.soa.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion | Template</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
<link rel="stylesheet" href="assets/default.css">

</head>
<body>
<%
	ProductDAO pdao = new ProductDAO();
	ImageFileDAO idao = new ImageFileDAO();
	
	List<Product> plist = pdao.productList();
	List<ImageFile> ilist = idao.imageFileList();
	
	List<String> list = new ArrayList();
	ImageToBase64 converter = new ImageToBase64();
	for(int i = 0; i < ilist.size(); i++) {
	File file = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
							+ilist.get(i));
	String fileStringValue = converter.convert(file);
	list.add(i, fileStringValue);
	System.out.println(list.get(i));
	}
	
	pageContext.setAttribute("plist", plist);
	pageContext.setAttribute("list", list);
%>
	<div data-include-path="header.jsp"></div>

	<!-- 상품list Section Begin -->
	<div class="spad-align">
		<section class="product spad" id="spad">
			<div class="pdContainer">
				<div class="row product__filter">

					<%for(int i = 0; i < plist.size(); i++) { %>
					<%if(plist.get(i).getDel_yn().equals("N")) { %>
					<!-- 상품 div begin / 여기서부터 반복해서 쓰면 됩니다! -->
					<div class="align2 col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
						<div class="product__item">
							<a href="ProductPage.jsp?product_id=<%=plist.get(i).getProduct_id()%>"> <!-- a : 해당 게시글페이지로 이동 --> <!-- data-setbg : "사진 경로" -->
								<div class="product__item__pic set-bg"
									data-setbg="data:image/jpg;base64,<%=list.get(i)%>">
									
								</div>
							</a>
							<div class="product__item__text">
								<%if(plist.get(i).getProduct_status().equals("N")) { %>
									<h6>판매중</h6>
								<%}else {%>
									<h6>판매완료</h6>
								<%} %>
								<a href="ProductPage.jsp?product_id=<%=plist.get(i).getProduct_id()%>"> <!-- a : 게시글페이지로 이동 -->
									<h6>
										<%=plist.get(i).getProduct_name()%>
										<!-- 게시글 이름 -->
									</h6>
									<h5>
										<%=plist.get(i).getProduct_price()%>원
										<!-- 가격 -->
									</h5>
								</a>
							</div>
						</div>
					</div>
					<!-- 상품 div end / 여기까지 반복! -->
					<%}else { %>
					<%} %>
					<%} %>
					
				</div>
			</div>
		</section>
	</div>
	<!-- 상품list Section End -->

	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/jquery.nicescroll.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.countdown.min.js"></script>
	<script src="assets/js/jquery.slicknav.js"></script>
	<script src="assets/js/mixitup.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		/*header.jsp*/
		window.addEventListener('load', function() {
			var allElements = document.getElementsByTagName('*');
			Array.prototype.forEach.call(allElements, function(el) {
				var includePath = el.dataset.includePath;
				if (includePath) {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							el.outerHTML = this.responseText;
						}
					};
					xhttp.open('GET', includePath, true);
					xhttp.send();
				}
			});
		});
	</script>

</body>
</html>