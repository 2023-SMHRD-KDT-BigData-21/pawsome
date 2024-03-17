<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/chatlist.css">
</head>
<body>
	<div class="chatListContainer">
		<div class="chatting">
			<!--채팅 목록 리스트-->

			<div class="case">
				<!-- 여기서부터 반복 시작 -->
				<div class="left">
					<!--프로필 부분-->
					<div class="circle">
						<!-- img : 프로필사진 경로 -->
						<img src="https://i.ytimg.com/vi/K19h13qQy9Y/maxresdefault.jpg"
							alt="">
					</div>
				</div>
				<div class="middle">
					<!--상대 닉네임 & 채팅 마지막 내용-->
					<div class="nickname"><span>닉네임</span></div>
					<div class="last"><span>마지막 내용</span></div>
				</div>
				<div class="right">
					<!--제품 이미지-->
					<a href="#">
						<div class="photo">
							<!-- img : 제품사진 경로 -->
							<img
								src="https://previews.123rf.com/images/yuliaavgust/yuliaavgust1303/yuliaavgust130300070/18411573-%EC%83%88%EC%9E%A5%EC%97%90-%EB%B3%B5%EA%B3%A0-%EC%BC%80%EC%9D%B4%EC%A7%80-%EB%B9%85-%EB%B8%94%EB%A3%A8-%EB%A8%B8-%EC%BD%94-%EC%95%84-%EB%9D%BC-ararauna%EC%97%90-%EC%95%B5%EB%AC%B4%EC%83%88.jpg"
								alt="">
						</div>
					</a>
				</div>
			</div>
			<!-- 여기까지 반복 -->


		</div>
	</div>
</body>
</html>