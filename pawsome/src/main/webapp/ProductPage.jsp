<%@page import="com.soa.model.Product"%>
<%@page import="com.soa.model.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.soa.model.ImageFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/productPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%
	String sender = (String) session.getAttribute("member");
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	ImageFileDAO idao = new ImageFileDAO();
	List<String> list = idao.imgContent(product_id);
	pageContext.setAttribute("list", list);
	
	ProductDAO pdao = new ProductDAO();
	Product product = pdao.productContent(product_id);
	pageContext.setAttribute("product", product);
	String receiver = product.getSeller_id();
	
	System.out.println(sender);
	System.out.println(receiver);
%>
	<div data-include-path="header.jsp"></div>


	<!-- 본문 -->
    <div class="container"> <!-- checkPage 가운데 정렬 -->
        <div class="checkPage"> <!-- 페이지 공간 -->
            <div class="topCheck"> <!-- 사진 + 제목, 가격 등 div -->
                <div class="imgBox">
                    <img id="fileId"
                        src="data:image/jpg;base64,<%=list.get(0) %>" alt="">
                </div>
				<%if(sender.equals(receiver)) {%>
                <!-- 판매자일 때 영역 begin -->
                <div class="textBox">
                    <div class="innerBox">
                        <div class="inner">
                        <%=product.getAnimal_cate() %> > 
                        <%=product.getProduct_cate() %></div>
                        <%if(product.getProduct_status().equals("N")) {%>
						<div class="inner">판매중</div>
						<%}else {%>
						<div class="inner">판매완료</div>
						<%} %>
                    </div>
                    <h1 id="productName"><%=product.getProduct_name() %></h1>
                    <div class="innerBox">
                        <div id="productPrice" class="inner"><%=product.getProduct_price() %>원</div>
                        <div class="inner">
							<a href="ProductDeleteController?product_id=<%=product.getProduct_id()%>">삭제하기</a>
                        </div>
                    </div>
                    <div class="innerBox">
                        <div class="inner">

                            <button class="openBtn modalBtn">상태 변경</button>
                            <div class="modal hidden">
                                <div class="bg"></div>
                                <div class="modalBox">
                                    <p><br><br>원하는 상태 변경 버튼을 눌러주세요!<br><br><br></p>
                                    <div class="btndiv">
                                        <button class="closeBtn modalBtn">판매중</button>
                                        <button class="closeBtn modalBtn closeBtn2">판매완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="inner likeCnt">찜개수</div>
                    </div>
                </div>
                <!-- 판매자일 때 영역 end -->
				<%}else {%>
                <!-- 구매자일 때 영역 begin -->
                <div class="textBox">
                    <div class="innerBox">
                        <div class="inner">
                        <%=product.getAnimal_cate() %> > 
                        <%=product.getProduct_cate() %></div>
                        <%if(product.getProduct_status().equals("N")) {%>
						<div class="inner">판매중</div>
						<%}else {%>
						<div class="inner">판매완료</div>
						<%} %>
                    </div>
                    <h1 id="productName"><%=product.getProduct_name() %></h1>
                    <div class="innerBox">
                        <div id="productPrice" class="inner"><%=product.getProduct_price() %>원</div>
                        <div class="inner">
                            <a href="#">수정하기</a>
                        </div>
                    </div>
                    <div class="innerBox">
                        <div class="inner">
                            <a href="#" onclick="chat()" class="chatBtn">구매신청</a>
                        </div>
                        <div class="inner">
                            <button type="button" class="btn_like likeBtn">
                                <span class="img_emoti">좋아요</span>
                                <span class="ani_heart_m"></span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- 구매자일 때 영역 end -->
				<%} %>
			</div>

			<div class="noUse">
				<div class="underbar"></div>
			</div>
			<div class="contentBox">
				<!-- 본문 내용 div -->
				<!-- 변경begin -->
				<div class="contentCheck">
					<!-- 불러올 사진들 : secondImgBox > img -->
					<%for(int i = 1; i < list.size(); i++) {%>
					<div class="secondImgBox">
						<img id="fileId"
						src="data:image/jpg;base64,<%=list.get(i) %>"
						alt="">
					</div>
					<%} %>
					<div>
						<%=product.getProduct_content() %>
					</div>
					<!-- 변경end -->
				</div>
			</div>
		</div>
	</div>


	<script>
	<%if(sender.equals(receiver)) {%>
	/* (판매자시점)일 때만 함수를 실행해야 함. 안 그러면 오류*/
	/* (판매자시점) 상태변경 버튼 클릭시 실행되는 함수 */

	const open = () => {
	    document.querySelector(".modal").classList.remove("hidden");
	}

	const close = () => {
	    document.querySelector(".modal").classList.add("hidden");
	}

	document.querySelector(".openBtn").addEventListener("click", open);
	document.querySelector(".closeBtn").addEventListener("click", close);
	document.querySelector(".closeBtn2").addEventListener("click", close);
	document.querySelector(".bg").addEventListener("click", close);

	<%}else { %>

	/* (구매자시점) 찜하기 버튼 클릭시 실행되는 함수 */
	$('.likeBtn').click(function() {
		if ($(this).hasClass('btn_unlike')) {
			$(this).removeClass('btn_unlike');
			$('.ani_heart_m').removeClass('hi');
			$('.ani_heart_m').addClass('bye');
		} else {
			$(this).addClass('btn_unlike');
			$('.ani_heart_m').addClass('hi');
			$('.ani_heart_m').removeClass('bye');
		}
	});
	<%} %>

		 function chat() {
             // 채팅창 띄워기(사이즈 지정)
             
             var sender = '<%=sender%>';                  
             var receiver = '<%=receiver%>';             
             var product_id = '<%=product.getProduct_id()%>';
             window.open("chat.jsp?sender="+sender+"&receiver="+receiver+"&product_id="+product_id, "채팅하기", "width=640, height=800") // 새로운 창 띄우기 
             //var childWindow = window.open("chatlist.jsp?sender="+sender+"&recevier="+receiver, "채팅하기", "width=640, height=800") // 새로운 창 띄우기 
             // getContextPath : 현재위치,  채팅하기 : 창의 이름
    	}

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