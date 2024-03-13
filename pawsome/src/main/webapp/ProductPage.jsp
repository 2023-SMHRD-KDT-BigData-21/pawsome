<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<!-- https://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg 
                        https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg  -->
				</div>
				<div class="textBox">
					<div class="innerBox">
						<div class="inner">CATE > CATE</div>
						<div class="inner">판매상태</div>
					</div>
					<h1 id="productName">제목</h1>
					<div class="innerBox">
						<div id="productPrice" class="inner">가격</div>
						<div class="inner">
							<a href="#
                            ">수정하기</a>
						</div>
					</div>
					<div class="innerBox">
						<div class="inner">
							<button>상태변경</button>
						</div>
						<div class="inner">찜개수</div>
					</div>
					<!-- <span>판매상태<span>
                            <span>CATE > CATE</span>
                            <h2 id="productName">제목</h2>
                            <span id="productPrice">가격<span>
                                    <a href="#">수정하기</a><br>
                                    <span>상태변경</span>
                                    <span>찜개수</span> -->
				</div>
			</div>
			<div class="contentBox">
				<!-- 본문 내용 div -->
				<div class="contentCheck">내용</div>
			</div>
		</div>
	</div>
</body>
</html>