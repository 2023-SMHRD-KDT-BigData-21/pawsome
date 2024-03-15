<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!--하단부 게시글-->
	<div class="box5">
		<!--회원가입 창 상단의 PAWSOME-->
		<h1>
			<img
				src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
				width="20px" height="20px"> PAWSOME <img
				src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
				width="20px" height="20px">
		</h1>
	</div>
	<div class="box6">
		<form action="JoinController" method="post" enctype="multipart/form-data">
			<div class="join">
				<div id="joinTitle">
					<!--회원가입 문구-->
					회원가입
				</div>
				<div class="joinInput">
					<!--아이디 입력란-->
					<span style="padding-left: 35px"></span>
					<div class="word">아이디</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userId" id="idInput" placeholder="아이디를 입력하세요">
					<span style="padding-right: 10px"></span> <input type="button"
						name="idTest" value="ID 중복확인" onclick="idCheck()">
				</div>
				<div class="joinInput">
					<!--비밀번호 입력란-->
					<div class="word">비밀번호</div>
					<span style="padding-right: 10px"></span> <input class="pw"
						type="password" name="userPw" id="pw" placeholder="비밀번호를 입력하세요">
					<span style="padding-right: 70px"></span>
				</div>
				<div class="joinInput">
					<!--비밀번호 확인란-->
					<div class="word">비밀번호 확인</div>
					<span style="padding-right: 10px"></span> <input class="pw"
						type="password" name="pwCheck" id="pwCheck"
						placeholder="비밀번호를 다시 입력하세요"> <span
						style="padding-right: 105px"></span>
				</div>
				<div class="joinInput">
					<!--비밀번호 일치 불일치 확인-->
					<div class="pwResult">
						<span class="test" id="checkPw"></span>
					</div>
				</div>
				<div class="joinInput">
					<!--이름 입력란-->
					<div class="word">이름</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userName" placeholder="이름을 입력하세요"> <span
						style="padding-right: 40px"></span>
				</div>
				<div class="joinInput">
					<!--닉네임 입력란-->
					<span style="padding-right: 35px"></span>
					<div class="word">닉네임</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userNick" id="nickInput"
						placeholder="닉네임을 입력하세요"> <span
						style="padding-right: 10px"></span> <input type="button"
						name="nickTest" value="NickName 중복확인" onclick="nickCheck()">
				</div>
				<div class="joinInput">
					<!--이메일 입력란-->
					<span style="padding-right: 35px"></span>
					<div class="word">이메일</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userEmail" id="emailInput"
						placeholder="이메일을 입력하세요"> <span
						style="padding-right: 10px"></span> <input type="button"
						name="emailTest" value="이메일 중복확인" onclick="emailCheck()">
				</div>
				<div class="joinInput">
					<!--전화번호 입력란-->
					<span style="padding-right: 5px"></span>
					<div class="word">핸드폰 번호</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userPhone" placeholder="휴대폰 번호를 입력하세요">
					<span style="padding-right: 95px"></span>
				</div>
				<div class="joinInput2">
					<!--반려동물 선택란-->
					<div class="join1">
						반려동물 선택<br> <input class="animalChoice" type="checkbox"
							name="animalCate">강아지 <input class="animalChoice"
							type="checkbox" name="animalCate">고양이 <input
							class="animalChoice" type="checkbox" name="animalCate">반려조
						<br> <input class="animalChoice" type="checkbox"
							name="animalCate">관상어 <input class="animalChoice"
							type="checkbox" name="animalCate">설치류 <input
							class="animalChoice" type="checkbox" name="animalCate">기타동물
					</div>
				</div>
				<div class="joinInput">
					<!--프로필 사진 업로드-->
					<div class="word">사진 설정</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="file" name="userImg"> <span
						style="padding-right: 70px"></span>
				</div>
				<div class="joinInput">
					<!--가입완료-->
					<input class="success" type="submit" value="가입완료">
				</div>
			</div>
		</form>
	</div>
	<script>
		function idCheck() {
			var input = document.getElementById("idInput")
			console.log(input.value)
			$.ajax({
				type : "get", //요청방식
				data : {
					"id" : input.value
				}, //요청 데이터
				url : "IdCheckController", //요청경로
				dataType : "text", //응답받을 데이터 형식("json")
				success : function(data) { //data (서버에서 응답한 데이터)
					if (data == "YY") { //사용할 수 있는 아이디
						alert("사용할 수 있는 아이디")
					} else { //"NN" 사용할 수 없는 아이디
						alert("사용할 수 없는 아이디")
					}

				},
				error : function() {
					console.log("통신실패!")
				}
			})
		}
	</script>
	<script>
		function nickCheck() {
			var input = document.getElementById("nickInput")
			console.log(input.value)
			$.ajax({
				type : "get", //요청방식
				data : {
					"nick" : input.value
				}, //요청 데이터
				url : "IdCheckController", //요청경로
				dataType : "text", //응답받을 데이터 형식("json")
				success : function(data) { //data (서버에서 응답한 데이터)
					if (data == "YY") { //사용할 수 있는 아이디
						alert("사용할 수 있는 닉네임")
					} else { //"NN" 사용할 수 없는 아이디
						alert("사용할 수 없는 닉네임")
					}

				},
				error : function() {
					console.log("통신실패!")
				}
			})
		}
	</script>
	<script>
		function emailCheck() {
			var input = document.getElementById("emailInput")
			console.log(input.value)
			$.ajax({
				type : "get", //요청방식
				data : {
					"nick" : input.value
				}, //요청 데이터
				url : "IdCheckController", //요청경로
				dataType : "text", //응답받을 데이터 형식("json")
				success : function(data) { //data (서버에서 응답한 데이터)
					if (data == "YY") { //사용할 수 있는 아이디
						alert("사용할 수 있는 이메일")
					} else { //"NN" 사용할 수 없는 아이디
						alert("사용할 수 없는 이메일")
					}

				},
				error : function() {
					console.log("통신실패!")
				}
			})
		}
	</script>
	<script>
		$('.pw').keyup(function() {
			let pass1 = $("#pw").val();
			let pass2 = $("#pwCheck").val();

			if (pass1 != "" || pass2 != "") {
				if (pass1 == pass2) {
					$("#checkPw").html('일치');
					$('.test').css('color', 'green');
				} else {
					$("#checkPw").html('불일치');
					$('.test').css('color', 'red');
				}
			}

		})
	</script>

</body>
</html>