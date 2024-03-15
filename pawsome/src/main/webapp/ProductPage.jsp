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
					<!-- https://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg 
                        https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg  -->
				</div>
				<div class="textBox">
					<div class="innerBox">
						<div class="inner">강아지 > 사료</div>
						<!-- ${animal_cate} > ${product_cate} DB에서 불러올 때 이렇게 ?! -->
						<div class="inner">판매중</div>
					</div>
					<h1 id="productName">한번 먹은 사료 팝니다</h1>
					<div class="innerBox">
						<div id="productPrice" class="inner">5000원</div>
						<div class="inner">
							<!-- 판매자:수정하기 / 구매자:판매자정보 -->
							<a href="#">수정하기</a>
						</div>
					</div>
					<div class="innerBox">
						<div class="inner">
							<!-- 판매자:상태변경 / 구매자:채팅하기 -->
							<!-- 구매자일 때 -->
							<a href="#" onclick="chat()" class="chatBtn">구매신청</a>

							<!-- 판매자일 때 -->
							<!-- <button class="openBtn modalBtn">상태 변경</button>
                            <div class="modal hidden">
                                <div class="bg"></div>
                                <div class="modalBox">
                                    <p><br><br>원하는 상태 변경 버튼을 눌러주세요!<br><br><br></p>
                                    <div class="btndiv">
                                        <button class="closeBtn modalBtn">판매중</button>
                                        <button class="closeBtn modalBtn closeBtn2">판매완료</button>
                                    </div>
                                </div>
                            </div> -->

						</div>

						<!-- 판매자 : 찜개수 확인 / 구매자 : 찜하기 버튼 -->
						<!-- 구매자일 때 -->
						<div class="inner">
							<button type="button" class="btn_like likeBtn">
								<span class="img_emoti">좋아요</span> <span class="ani_heart_m"></span>
							</button>
						</div>

						<!-- 판매자일 때 -->
						<!-- <div class="inner likeCnt">찜개수</div> -->

					</div>

				</div>
			</div>

			<div class="noUse">
				<div class="underbar"></div>
			</div>
			<div class="contentBox">
				<!-- 본문 내용 div -->
				<!-- 변경begin -->
				<div class="contentCheck">
					<!-- 불러올 사진들 : secondImgBox > img -->
					<div class="secondImgBox">
						<img id="fileId"
							src="https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg"
							alt="">
					</div>
					<div class="secondImgBox">
						<img id="fileId"
							src="https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg"
							alt="">
					</div>
					<!-- 글내용은 div 안에 불러오면 됩니닷 -->
					<div>
						내용넣기<br> <br> <br> <br>내용넣기
					</div>
					<!-- 변경end -->
				</div>
			</div>
		</div>
	</div>


	<script>
		/* (판매자시점)일 때만 함수를 실행해야 함. 안 그러면 오류*/
		/* (판매자시점) 상태변경 버튼 클릭시 실행되는 함수 */
		/*
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
		 */

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