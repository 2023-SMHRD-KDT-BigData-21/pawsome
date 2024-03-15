<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--하단부-->
	<div class="box5">
		<!--로그인칸 상단의 로고-->
		<h1>
			<img
				src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
				width="20px" height="20px">PAWSOME<img
				src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
				width="20px" height="20px">
		</h1>
	</div>
	<div class="box6">
		<form action="LoginController" method="post">
			<div class="join">
				<div id="joinTitle">
					<!--로그인 문구-->
					로그인
				</div>
				<div class="id">
					<!--아이디 입력란-->
					<input id="id" type="text" name="userId"
						placeholder="    아이디를 입력하세요">
				</div>
				<div class="pw">
					<!--비밀번호 입력란-->
					<input id="pw" type="password" name="userPw"
						placeholder="    비밀번호를 입력하세요">
				</div>
				<div class="login">
					<!--로그인 버튼-->
					<input class="loginButton" type="submit" value="로그인" name="login">
				</div>
				<div id="search">
					<!--ID&PW찾기, 회원가입 이동-->
					<a class="a" href="#">아이디 찾기</a><span style="padding-right: 10px"></span>|
					<span style="padding-right: 10px"></span> <a class="a" href="#">비밀번호
						찾기</a><span style="padding-right: 10px"></span>| <span
						style="padding-right: 10px"></span> <a class="a" href="join.jsp">회원가입</a>
				</div>
				<div class="button-login">
					<!--카카오 연동 로그인-->
					<a href="javascript:kakaoLogin();" id="kakao-login-btn"> <img
						src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png">
					</a>
				</div>
			</div>
		</form>
	</div>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init('5cc445686e665aa46813bc168750e813');
		
		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope: 'profile_nickname',
				success: function (authObj) {
					console.log(authObj);
					window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						window.location.href = "index.jsp";
					}
				});
			},
			 fail: function(error) {
                 console.log(error)
			 }
		});
	}

		
	</script>

</body>
</html>