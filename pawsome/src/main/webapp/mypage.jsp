<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/mypage.css">
</head>
<body>
	<div data-include-path="header.html"></div>
	<!--하단부-->
	<div class="box5">
		<div class="mypage">
			<!--개인 정보란-->
			<div class="left">
				<!--프로필&닉네임 수정칸-->
				<div class="up">
					<div class="left1">
						<span style="padding-right: 50px"></span>MY PAGE
					</div>
					<div class="right1">
						<button class="modify">수정</button>
					</div>
				</div>
				<div class="down">
					<div class="left2">
						<div class="circle">
							<div id="photo">
								<img id="photo"
									src="https://i.namu.wiki/i/P4EcUkE1smLslPIYuzQV5tXGpN1lpszX202_nioWCfKlQkQH_e373do_I51rnuSuGTj5wvd1zH3jryD9bpDDVw.webp">
							</div>
						</div>
					</div>
					<div class="right2">
						<span style="padding-right: 20px"></span>
						<div id="nickName">닉네임 : Death</div>
					</div>
				</div>
			</div>
			<div class="right">
				<!--신뢰도, 판매&구매건수, 찜한 물품-->
				<div class="up2">
					신뢰도<span style="padding-right: 20px"></span>
					<div class="credit">
						<div id="gauge"></div>
					</div>
				</div>
				<div class="down2">
					<div class="downOne">
						<div class="circle">
							<div class="part1">판매건수</div>
							<div class="part2" id="sellCount">N</div>
						</div>
					</div>
					<div class="downTwo">
						<div class="circle">
							<div class="part1">구매건수</div>
							<div class="part2" id="buyCount">N</div>
						</div>
					</div>
					<div class="downThree">
						<div class="circle">
							<div class="part1">찜한 물건</div>
							<div class="part2" id="checkCount">N</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box6">
		<!--선택 버튼 목록-->
		<div class="checkList">
			<button class="selling">판매중</button>
			<span style="padding-right: 20px"></span>
			<button class="sellOver">판매완료</button>
			<span style="padding-right: 20px"></span>
			<button class="buy">구매</button>
			<span style="padding-right: 20px"></span>
			<button class="choice">찜 목록</button>
		</div>
	</div>
	<div class="box7">
		<!--상품 이미지 및 게시글 링크-->
		<div class="merchandiseList">
			<div class="merchandise">
				<div class="merchandise1">상품 이미지</div>
				<div class="merchandise2">
					게시글 제목<br> 게시글 가격<br> 날짜
				</div>
			</div>
			<span style="padding-right: 25px"></span>
		</div>
	</div>

	<script>
		/*header.html*/
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