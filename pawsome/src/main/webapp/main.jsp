<%@page import="com.google.gson.Gson"%>
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
	
	String s_word = request.getParameter("s_word");
	
	List<Product> catelist = (List<Product>)session.getAttribute("clist");
    if(catelist != null){
        for(Product product : catelist){
        }
    }else{
    }
    
    String data = (String) request.getAttribute("data");
    Gson gson = new Gson();
    catelist = gson.fromJson(data, List.class);
    if(catelist != null){
    System.out.println(catelist.size());
    }
    
    
%>
	
	<div data-include-path="header.jsp"></div>
	<%if(s_word != null) {%>
	<input type="hidden" id="s_word" value="<%=s_word %>" >
	<%} %>
	<!-- 상품list Section Begin -->
	<div class="spad-align">
		<section class="product spad" id="spad">
			<div class="pdContainer">
				<div class="row product__filter">

					<%for(int i = 0; i < plist.size(); i++) { %>
					<%if(plist.get(i).getDel_yn().equals("N")) { %>
					<!-- 상품 div begin / 여기서부터 반복해서 쓰면 됩니다! -->
					<div class="align2 col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals" id="">
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
		
		let s_word = document.getElementById("s_word").value;
		
		if(s_word != null){
			$.ajax({
				url:'SearchController',
				type:'post',
			    data:{
			      	"s_word":s_word
			    },
			    success:function(){
			        console.log("요청성공!");
			    },
			    error:function(){
			        console.log("요청실패!");   
			         }
			      })
			}
		
		function createProductList(data) {
			console.log(data);
		    var productContainer = document.querySelector('.row.product__filter'); // 상품을 추가할 컨테이너 선택
		    productContainer.innerHTML = ''; // 기존 내용을 비웁니다.
		    
		    data.forEach(function(product) {
		        var productDiv = 
		        	` 
		            <div class="align2 col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
		                <div class="product__item">
		                    <a href="ProductPage.jsp?product_id=` + product.product_id + `">
		                        <div class="product__item__pic set-bg" data-setbg="data:image/jpg;base64,">
		                        	<img src="https://us.123rf.com/450wm/bearsky23/bearsky231610/bearsky23161000012/63637375-%EB%8B%A4%EB%A5%B8-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8%EB%A1%9C-%EC%9D%B4%EB%8F%99%ED%95%98%EA%B8%B0%EC%9C%84%ED%95%9C-%EC%99%B8%EB%B6%80-%EB%A7%81%ED%81%AC-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">
		                        </div>
		                    </a>
		                    <div class="product__item__text">
		                        <a href="ProductPage.jsp?product_id=` + product.product_id + `">
		                            <h6>` + product.product_name + `</h6>
		                            <h5>` + product.product_price + `원</h5>
		                            
		                        </a>
		                    </div>
		                </div>
		            </div>
		        ` ;
		        productContainer.insertAdjacentHTML('beforeend', productDiv);
		    });
		}
		
		var data;
		function cate(animal_cate, product_cate) {
		    $.ajax({
		        url: 'CateController',
		        type: 'post',
		        contentType: "application/json; charset=utf-8", // contentType 추가
		        data: JSON.stringify({ // JSON 형태로 데이터 변환
		            "animal_cate": animal_cate,
		            "product_cate": product_cate
		        }),
		        success: function(response) {
			        console.log("요청 성공");
			        data = response;
			        console.log(data);
			        console.log(data[0].product_id);
			        createProductList(data); // 여기에서 상품 목록 생성 함수 호출
		        },
		        error: function() {
		            // 오류 발생 시 로직
		        }
		    });
		}
		
		
	</script>
	<script src="assets/js/header.js"></script>
</body>
</html>