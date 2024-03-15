<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/productPage.css">
</head>
<body>
	<div data-include-path="header.jsp"></div>


	<!-- 본문 -->
	<div class="container">
		<!-- checkPage 가운데 정렬 -->
		<div class="checkPage">
			<!-- 페이지 공간 -->
			<div class="topCheck">
				<!-- 사진 + 제목, 가격 등 div -->
				<div class="imgBox">
					<img id="fileId"
						src="https://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg"
						alt="">

				</div>
				<div class="textBox">
					<div class="innerBox">
						<div class="inner">CATE > CATE</div>
						<!-- ${animal_cate} > ${product_cate} DB에서 불러올 때 이렇게 ?! -->
						<div class="inner">판매상태</div>
					</div>
					<h1 id="productName">제목</h1>
					<div class="innerBox">
						<div id="productPrice" class="inner">가격</div>
						<div class="inner">
							<!-- 판매자:수정하기 / 구매자:판매자정보 -->
							<a href="#">수정하기</a>
						</div>
					</div>
					<div class="innerBox">
						<div class="inner">
							<!-- 판매자:상태변경 / 구매자:채팅하기 -->
							<a href="#" onclick="chat()">상태변경</a>
						</div>
						<div class="inner">찜개수</div>
					</div>

				</div>
			</div>
			<div class="contentBox">
				<!-- 본문 내용 div -->
				<div class="contentCheck">내용</div>
			</div>
		</div>
	</div>


	<script>
		function chat() {
			// 채팅창 띄워기(사이즈 지정)
			window.open("chat.jsp", "채팅하기", "width=500, height=750") // 새로운 창 띄우기 
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