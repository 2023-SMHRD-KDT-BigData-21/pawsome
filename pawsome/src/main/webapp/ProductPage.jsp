<%@page import="java.math.BigDecimal"%>
<%@page import="com.soa.model.UserLikeDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.soa.model.UserLike"%>
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
<title>pawsome</title>
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
	UserLike check = (UserLike)session.getAttribute("check");
	
	UserLikeDAO udao = new UserLikeDAO();
	BigDecimal p_id = new BigDecimal(request.getParameter("product_id"));
	int likes = udao.countLike(p_id);
	
	System.out.println(sender);
	System.out.println(receiver);
	System.out.println("check : " + check);
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
				<%if(sender == null){%>
                <!-- 비로그인 상태 -->
                <div class="textBox">
                    <div class="innerBox">
                        <div class="inner">
                        <%if(product.getAnimal_cate().equals("01")) {%>
                        강아지
                        <%} else if(product.getAnimal_cate().equals("02")) {%>
                        고양이
                        <%} else if(product.getAnimal_cate().equals("03")) {%>
                        관상어
                        <%} else if(product.getAnimal_cate().equals("04")) {%>
                        반려조
                        <%} else if(product.getAnimal_cate().equals("05")) {%>
                        파충류
                        <%} else if(product.getAnimal_cate().equals("06")) {%>
                        설치류
                        <%} else if(product.getAnimal_cate().equals("07")) {%>
                        기타
                        <%} %>
                        > 
                        <%if(product.getProduct_cate().equals("01")) {%>사료
                        <%}else if(product.getProduct_cate().equals("02")) { %>간식
                        <%}else if(product.getProduct_cate().equals("03")) { %>영양제
                        <%}else if(product.getProduct_cate().equals("04")) { %>장난감
                        <%}else if(product.getProduct_cate().equals("05")) { %>급식류
                        <%}else if(product.getProduct_cate().equals("06")) { %>의류
                        <%}else if(product.getProduct_cate().equals("07")) { %>악세서리
                        <%}else if(product.getProduct_cate().equals("08")) { %>외출용품
                        <%}else if(product.getProduct_cate().equals("09")) { %>하우스
                        <%}else if(product.getProduct_cate().equals("10")) { %>미용
                        <%}else if(product.getProduct_cate().equals("11")) { %>목욕용품
                        <%}else if(product.getProduct_cate().equals("12")) { %>배변용품
                        <%}else if(product.getProduct_cate().equals("13")) { %>훈련용품
                        <%}else if(product.getProduct_cate().equals("14")) { %>건사료
                        <%}else if(product.getProduct_cate().equals("15")) { %>습식사료
                        <%}else if(product.getProduct_cate().equals("16")) { %>캣타워
                        <%}else if(product.getProduct_cate().equals("17")) { %>수초
                        <%}else if(product.getProduct_cate().equals("18")) { %>수조/어항
                        <%}else if(product.getProduct_cate().equals("19")) { %>수질관리용품
                        <%}else if(product.getProduct_cate().equals("20")) { %>여과용품
                        <%}else if(product.getProduct_cate().equals("21")) { %>수조장식
                        <%}else if(product.getProduct_cate().equals("22")) { %>온도계
                        <%}else if(product.getProduct_cate().equals("23")) { %>청소용품
                        <%}else if(product.getProduct_cate().equals("24")) { %>부화용품
                        <%}else if(product.getProduct_cate().equals("25")) { %>새장
                        <%}else if(product.getProduct_cate().equals("26")) { %>횃대
                        <%}else if(product.getProduct_cate().equals("27")) { %>보온용품
                        <%}else if(product.getProduct_cate().equals("28")) { %>채집통
                        <%}else if(product.getProduct_cate().equals("29")) { %>바닥재
                        <%}else if(product.getProduct_cate().equals("30")) { %>베딩
                        <%}else if(product.getProduct_cate().equals("31")) { %>기타
                        <%} %>
                        </div>
                        <%if(product.getProduct_status().equals("N")) {%>
						<div class="inner">판매중</div>
						<%}else {%>
						<div class="inner">판매완료</div>
						<%} %>
                    </div>
                    <h1 id="productName"><%=product.getProduct_name() %></h1>
                    <div class="innerBox">
                        <div id="productPrice" class="inner"><h1><%=product.getProduct_price() %>원</h1></div>
                        <!-- <div class="inner">
                        </div> -->
                    </div>
                    <div class="innerBox">
                        <div class="inner">
                            <a href="#" onclick="notLogin()" class="chatBtn">구매신청</a>
                        </div>
                        <div class="inner">
                            <a href="#" onclick="notLogin()" class="sellerInfo">판매자정보</a>
                        </div>
                        <div class="inner">
                            <button type="button" class="btn_like likeBtn">
                                <span class="img_emoti">좋아요</span>
                                <span class="ani_heart_m"></span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- 비로그인 상태 -->
				<%}else if(sender.equals(receiver)) {%>
                <!-- 판매자일 때 영역 begin -->
                <div class="textBox">
                    <div class="innerBox">
                        <div class="inner">
                        <%if(product.getAnimal_cate().equals("01")) {%>
                        강아지
                        <%} else if(product.getAnimal_cate().equals("02")) {%>
                        고양이
                        <%} else if(product.getAnimal_cate().equals("03")) {%>
                        관상어
                        <%} else if(product.getAnimal_cate().equals("04")) {%>
                        반려조
                        <%} else if(product.getAnimal_cate().equals("05")) {%>
                        파충류
                        <%} else if(product.getAnimal_cate().equals("06")) {%>
                        설치류
                        <%} else if(product.getAnimal_cate().equals("07")) {%>
                        기타
                        <%} %>
                        > 
                        <%if(product.getProduct_cate().equals("01")) {%>사료
                        <%}else if(product.getProduct_cate().equals("02")) { %>간식
                        <%}else if(product.getProduct_cate().equals("03")) { %>영양제
                        <%}else if(product.getProduct_cate().equals("04")) { %>장난감
                        <%}else if(product.getProduct_cate().equals("05")) { %>급식류
                        <%}else if(product.getProduct_cate().equals("06")) { %>의류
                        <%}else if(product.getProduct_cate().equals("07")) { %>악세서리
                        <%}else if(product.getProduct_cate().equals("08")) { %>외출용품
                        <%}else if(product.getProduct_cate().equals("09")) { %>하우스
                        <%}else if(product.getProduct_cate().equals("10")) { %>미용
                        <%}else if(product.getProduct_cate().equals("11")) { %>목욕용품
                        <%}else if(product.getProduct_cate().equals("12")) { %>배변용품
                        <%}else if(product.getProduct_cate().equals("13")) { %>훈련용품
                        <%}else if(product.getProduct_cate().equals("14")) { %>건사료
                        <%}else if(product.getProduct_cate().equals("15")) { %>습식사료
                        <%}else if(product.getProduct_cate().equals("16")) { %>캣타워
                        <%}else if(product.getProduct_cate().equals("17")) { %>수초
                        <%}else if(product.getProduct_cate().equals("18")) { %>수조/어항
                        <%}else if(product.getProduct_cate().equals("19")) { %>수질관리용품
                        <%}else if(product.getProduct_cate().equals("20")) { %>여과용품
                        <%}else if(product.getProduct_cate().equals("21")) { %>수조장식
                        <%}else if(product.getProduct_cate().equals("22")) { %>온도계
                        <%}else if(product.getProduct_cate().equals("23")) { %>청소용품
                        <%}else if(product.getProduct_cate().equals("24")) { %>부화용품
                        <%}else if(product.getProduct_cate().equals("25")) { %>새장
                        <%}else if(product.getProduct_cate().equals("26")) { %>횃대
                        <%}else if(product.getProduct_cate().equals("27")) { %>보온용품
                        <%}else if(product.getProduct_cate().equals("28")) { %>채집통
                        <%}else if(product.getProduct_cate().equals("29")) { %>바닥재
                        <%}else if(product.getProduct_cate().equals("30")) { %>베딩
                        <%}else if(product.getProduct_cate().equals("31")) { %>기타
                        <%} %>
                        </div>
                        <%if(product.getProduct_status().equals("N")) {%>
						<div class="inner">판매중</div>
						<%}else {%>
						<div class="inner">판매완료</div>
						<%} %>
                    </div>
                    <h1 id="productName"><%=product.getProduct_name() %></h1>
                    <div class="innerBox">
                        <div id="productPrice" class="inner"><h1><%=product.getProduct_price() %>원</h1></div>
                        <%-- <div class="inner">
							<a href="ProductDeleteController?product_id=<%=product.getProduct_id()%>">삭제하기</a>
                        </div> --%>
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
                        <div class="inner likeCnt">찜개수 ❤️<%=likes %></div>
                    </div>
                </div>
                <!-- 판매자일 때 영역 end -->
				<%}else {%>
                <!-- 구매자일 때 영역 begin -->
                <div class="textBox">
                    <div class="innerBox">
                        <div class="inner">
                        <%if(product.getAnimal_cate().equals("01")) {%>
                        강아지
                        <%} else if(product.getAnimal_cate().equals("02")) {%>
                        고양이
                        <%} else if(product.getAnimal_cate().equals("03")) {%>
                        관상어
                        <%} else if(product.getAnimal_cate().equals("04")) {%>
                        반려조
                        <%} else if(product.getAnimal_cate().equals("05")) {%>
                        파충류
                        <%} else if(product.getAnimal_cate().equals("06")) {%>
                        설치류
                        <%} else if(product.getAnimal_cate().equals("07")) {%>
                        기타
                        <%} %>
                        > 
                        <%if(product.getProduct_cate().equals("01")) {%>사료
                        <%}else if(product.getProduct_cate().equals("02")) { %>간식
                        <%}else if(product.getProduct_cate().equals("03")) { %>영양제
                        <%}else if(product.getProduct_cate().equals("04")) { %>장난감
                        <%}else if(product.getProduct_cate().equals("05")) { %>급식류
                        <%}else if(product.getProduct_cate().equals("06")) { %>의류
                        <%}else if(product.getProduct_cate().equals("07")) { %>악세서리
                        <%}else if(product.getProduct_cate().equals("08")) { %>외출용품
                        <%}else if(product.getProduct_cate().equals("09")) { %>하우스
                        <%}else if(product.getProduct_cate().equals("10")) { %>미용
                        <%}else if(product.getProduct_cate().equals("11")) { %>목욕용품
                        <%}else if(product.getProduct_cate().equals("12")) { %>배변용품
                        <%}else if(product.getProduct_cate().equals("13")) { %>훈련용품
                        <%}else if(product.getProduct_cate().equals("14")) { %>건사료
                        <%}else if(product.getProduct_cate().equals("15")) { %>습식사료
                        <%}else if(product.getProduct_cate().equals("16")) { %>캣타워
                        <%}else if(product.getProduct_cate().equals("17")) { %>수초
                        <%}else if(product.getProduct_cate().equals("18")) { %>수조/어항
                        <%}else if(product.getProduct_cate().equals("19")) { %>수질관리용품
                        <%}else if(product.getProduct_cate().equals("20")) { %>여과용품
                        <%}else if(product.getProduct_cate().equals("21")) { %>수조장식
                        <%}else if(product.getProduct_cate().equals("22")) { %>온도계
                        <%}else if(product.getProduct_cate().equals("23")) { %>청소용품
                        <%}else if(product.getProduct_cate().equals("24")) { %>부화용품
                        <%}else if(product.getProduct_cate().equals("25")) { %>새장
                        <%}else if(product.getProduct_cate().equals("26")) { %>횃대
                        <%}else if(product.getProduct_cate().equals("27")) { %>보온용품
                        <%}else if(product.getProduct_cate().equals("28")) { %>채집통
                        <%}else if(product.getProduct_cate().equals("29")) { %>바닥재
                        <%}else if(product.getProduct_cate().equals("30")) { %>베딩
                        <%}else if(product.getProduct_cate().equals("31")) { %>기타
                        <%} %>
                        </div>
                        <%if(product.getProduct_status().equals("N")) {%>
						<div class="inner">판매중</div>
						<%}else {%>
						<div class="inner">판매완료</div>
						<%} %>
                    </div>
                    <h1 id="productName"><%=product.getProduct_name() %></h1>
                    <div class="innerBox">
                        <div id="productPrice" class="inner h1size"><h1><%=product.getProduct_price() %>원</h1></div>
                        <div class="inner">
                            <button type="button" class="btn_like likeBtn">
                                <span class="img_emoti">좋아요</span>
                                <span class="ani_heart_m"></span>
                            </button>
                        </div>
                        <!-- <div class="inner">
                            <a href="#">판매자정보</a>
                        </div> -->
                    </div>
                    <div class="innerBox">
                        <div class="inner">
                            <a href="#" onclick="chat()" class="chatBtn">구매신청</a>
                        </div>
                        <div class="inner">
                            <a href="#" onclick="sellerInfo()" class="sellerInfo">판매자정보</a>
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
					<div class="productPageContent">
						<%=product.getProduct_content() %>
					</div>
					
                    <% if(sender == null){%>
					<% }else if(sender.equals(receiver)){%>
					<div class="bottomBtn">
                        <div class="btnalign">
                            <button id="updateBtn">수정하기</button>
                            <button id="delBtn"><a href="ProductDeleteController?product_id=<%=product.getProduct_id()%>">삭제하기</a></button>
                        </div>
                    </div>
                    <% } else {%>
                    <% }%>
					<!-- 변경end -->
				</div>
			</div>
		</div>
	</div>


	<script>
	
	// 페이지 처음 실행할 때 좋아요 눌렀던 상품인지 체크 및 좋아요 상태 반영
	
	check();
	
	function check(){
		let check = "<%=check%>";
		console.log(check)
		
		$.ajax({
	        url:'UserLikeController', 
	        type:'post',
	        data:{
	           "product_id":"<%=product_id%>",
	           "user_id":"<%=sender%>",
	           "check":"c"
	        },
	        success:function(response){
	        	check = "<%=check%>";
	        	if(response.check != null){
	        		 $('.likeBtn').addClass('btn_unlike')
	        	}
	        },
	        error:function(){
	           console.log("요청실패!");   
	        }
	     })
	     	
	}
	
	function sellerInfo(){
		var seller_id = '<%=product.getSeller_id()%>';
		console.log(seller_id);
		window.open("sellerInfo.jsp?seller_id="+seller_id, "판매자정보", "width=500, height=530")
	}
	
	<%if(sender== null) {%>
	<%}else if(sender.equals(receiver)) {%>
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
			
			$.ajax({
		         url:'UserLikeController', 
		         type:'post',
		         data:{
		            "product_id":"<%=product_id%>",
		            "user_id":"<%=sender%>"
		         },
		         success:function(){
		        	console.log("요청성공!");
		         },
		         error:function(){
		            console.log("요청실패!");   
		         }
		      })
			
		} else {
			$(this).addClass('btn_unlike');
			$('.ani_heart_m').addClass('hi');
			$('.ani_heart_m').removeClass('bye');
			
			$.ajax({
		         url:'UserLikeController', 
		         type:'post',
		         data:{
		            "product_id":"<%=product_id%>",
		            "user_id":"<%=sender%>"
		         },
		         success:function(){
		        	console.log("요청성공!");
		         },
		         error:function(){
		            console.log("요청실패!");   
		         }
		      })
		      
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
		
		function notLogin() {
		    alert("로그인 후 이용해주세요");
		    window.location.href = 'login.jsp';
		}
	</script>
	<script src="assets/js/header.js"></script>
</body>
</html>