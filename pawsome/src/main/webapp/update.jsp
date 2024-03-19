<%@page import="com.soa.model.MemberDAO"%>
<%@page import="com.soa.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pawsome</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div data-include-path="header.jsp"></div>

	<%
	String user_id = (String)session.getAttribute("member");
	System.out.println(user_id);
	%>

	<div class="box6">
		<form action="MemberUpController" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="userId" value="<%=user_id %>">
			<div class="join">
				<div id="joinTitle">개인정보 수정</div>
				<div class="joinInput">
					<!--아이디 입력란-->
					<div class="word">
						<h4>
							아이디 :
							<%=user_id%></h4>
					</div>
				</div>
				<div class="joinInput">
					<!--비밀번호 입력란-->
					<div class="word">비밀번호</div>
					<span style="padding-right: 10px"></span> <input class="pw input"
						type="password" name="userPw" id="pw" placeholder="비밀번호를 입력하세요">
					<span style="padding-right: 70px"></span>
				</div>
				<div class="joinInput">
					<!--비밀번호 확인란-->
					<div class="word">비밀번호 확인</div>
					<span style="padding-right: 10px"></span> <input class="pw input"
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
					<!--닉네임 입력란-->
					<span style="padding-right: 5px"></span>
					<div class="word">닉네임</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userNick" id="nickInput" placeholder="닉네임을 입력하세요">
					<span style="padding-right: 10px"></span> <input type="button"
						name="nickTest" class="inputBtn" value="중복확인"
						onclick="nickCheck()">
				</div>
				<div class="joinInput">
					<!--이메일 입력란-->
					<span style="padding-right: 5px"></span>
					<div class="word">이메일</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userEmail" id="emailInput" placeholder="이메일을 입력하세요">
					<span style="padding-right: 60px"></span>
				</div>
				<div class="joinInput">
					<!--전화번호 입력란-->
					<span style="padding-right: 5px"></span>
					<div class="word">핸드폰 번호</div>
					<span style="padding-right: 10px"></span> <input class="input"
						type="text" name="userPhone" placeholder="휴대폰 번호를 입력하세요"> <span
						style="padding-right: 95px"></span>
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
					<input class="success" type="submit" value="수정완료">
				</div>
			</div>	
		</form>
	</div>
	<script src="js/jquery-3.6.0.min.js"></script>
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
	<script>
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
	<script src="assets/js/header.js"></script>

</body>
</html>