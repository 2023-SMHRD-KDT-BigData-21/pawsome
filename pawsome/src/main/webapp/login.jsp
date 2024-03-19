<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pawsome</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
	<div data-include-path="header.jsp"></div>

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
            <div class="login">
                <div id="loginTitle"><!--로그인 문구-->
                    로그인
                </div>
                <div class="id"><!--아이디 입력란-->
                    <input class="idpwInput" id="id" type="text" name="userId" placeholder="아이디를 입력하세요">
                </div>
                <div class="pw"><!--비밀번호 입력란-->
                    <input class="idpwInput" id="pw" type="password" name="userPw" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="loginBtnClass"><!--로그인 버튼-->
                    <input class="loginButton" type="submit" value="로그인" name="login">
                </div>
                <div id="idpwsearch"><!--ID&PW찾기, 회원가입 이동-->
                    <a class="a" href="#">아이디 찾기</a><span style="padding-right: 10px"></span>| <span
                        style="padding-right: 10px"></span>
                    <a class="a" href="#">비밀번호 찾기</a><span style="padding-right: 10px"></span>| <span
                        style="padding-right: 10px"></span>
                    <a class="a" href="join.jsp">회원가입</a>
                </div>
                <div class="kakao button-login"><!--카카오 연동 로그인-->
                    <a href="javascript:kakaoLogin();" id="kakao-login-btn">
                        <img class="img"
                            src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png"
                            alt="KAKAOLOGIN">
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
						window.location.href = "main.jsp";
					}
				});
			},
			 fail: function(error) {
                 console.log(error)
			 }
		});
	}
		
		/*header.html*/
        window.addEventListener('load', function () {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function (el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
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
	<script src="assets/js/header.js"></script>
</body>
</html>