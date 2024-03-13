<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form action="#">
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
					<span style="padding-right: 10px"></span>
					<button class="button" name="idTest" value="idTest">중복 확인</button>
				</div>
				<div class="joinInput">
					<!--비밀번호 입력란-->
					<div class="word">비밀번호</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="password" name="userPw" id="pw" placeholder="비밀번호를 입력하세요">
					<span style="padding-right: 70px"></span>
				</div>
				<div class="joinInput">
					<!--비밀번호 확인란-->
					<div class="word">비밀번호 확인</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="password" name="pwCheck" id="pwCheck"
						placeholder="비밀번호를 다시 입력하세요"> <span
						style="padding-right: 105px"></span>
				</div>
				<div class="joinInput">
					<!--비밀번호 일치 불일치 확인-->
					<div class="pwResult">비밀번호 일치 불일치 여부</div>
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
						type="text" name="userNick" placeholder="닉네임을 입력하세요"> <span
						style="padding-right: 10px"></span>
					<button class="button" name="test" value="test">중복확인</button>
				</div>
				<div class="joinInput">
					<!--이메일 입력란-->
					<span style="padding-right: 35px"></span>
					<div class="word">이메일</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userEmail" placeholder="이메일을 입력하세요"> <span
						style="padding-right: 10px"></span>
					<button class="button" name="test" value="test">중복확인</button>
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

</body>
</html>