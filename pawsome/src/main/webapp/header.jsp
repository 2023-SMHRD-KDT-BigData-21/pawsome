<%@page import="com.soa.model.MemberDAO"%>
<%@page import="com.soa.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/header.css">
</head>
<body>
	<%
	String id = (String) session.getAttribute("member");
	MemberDAO dao = new MemberDAO();
	Member member = new Member();
	if(id!=null){
		member = dao.idCheck(id);
	}
	if(member!=null){
		pageContext.setAttribute("member", member);
	}
	%>
	<!--헤더-->
	<div class="header">
		<!--상단 좌측 로고-->
		<div class="box1">
			<div class="logo">
				<a href="main.jsp">
					<h1>
						<img
							src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
							width="20px" height="20px"> PAWSOME <img
							src="https://i.pinimg.com/600x315/6f/38/95/6f3895a9adf964f02bbf0222c6158956.jpg"
							width="20px" height="20px">
					</h1>
				</a>
			</div>
		</div>
		<!--상단 중앙 검색창-->
		<div class="box2">
			<div class="search">
				<input id="inputSearch" type="text" placeholder="찾으시는 상품을 입력해 주세요">
				<i class="icon ion-md-search"></i>
			</div>
		</div>
		<!--상단 우측 버튼-->
		<div class="box3">
			<%
			if (id != null) {
			%>
			<div class="menu">
				<a href="#" onclick="chatlist()" style="cursor: pointer;">채팅하기</a>
			</div>
			<div class="menu">
				<a href="writeForm.jsp">판매하기</a>
			</div>
			<div class="dropdown">
				<button class="dropbtn menuBtn">
				<%if(member.getUser_img()==null) {%>
                	<img id="headerProfile" src="https://www.studiopeople.kr/common/img/default_profile.png">
                <%}else { %>
                	<img id="headerProfile" src="data:image/jpg;base64,<%=member.getUser_img() %>">
                <%} %>
				</button>
				<div class="dropdown-content menu-dropdown-content">
					<a href="mypage.jsp">마이페이지</a> <a href="LogoutController">로그아웃</a>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="menu">
				<a href="join.jsp">회원가입</a>
			</div>
			<div class="menu">
				<a href="login.jsp">로그인</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!--중앙부 카테고리-->
	<div class="box4">
		<div class="category">
			<div class="innerCategory">
				<!-- <span style="padding-right: 20px"></span>카테고리 -->
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						강아지 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">의류</a>
                        <a href="#" name="g002">악세서리</a>
                        <a href="#" name="g002">외출용품</a>
                        <a href="#" name="g002">하우스</a>
                        <a href="#" name="g002">미용용품</a>
                        <a href="#" name="g002">목욕용품</a>
                        <a href="#" name="g002">배변용품</a>
                        <a href="#" name="g002">훈련용품</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						고양이 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">건사료</a>
                        <a href="#" name="g002">습식사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">의류</a>
                        <a href="#" name="g002">악세서리</a>
                        <a href="#" name="g002">외출용품</a>
                        <a href="#" name="g002">캣타워</a>
                        <a href="#" name="g002">하우스</a>
                        <a href="#" name="g002">미용용품</a>
                        <a href="#" name="g002">목욕용품</a>
                        <a href="#" name="g002">배변용품</a>
                        <a href="#" name="g002">훈련용품</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						관상어 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">수초</a>
                        <a href="#" name="g002">수조/어항</a>
                        <a href="#" name="g002">수질관리용품</a>
                        <a href="#" name="g002">여과용품</a>
                        <a href="#" name="g002">수조장식</a>
                        <a href="#" name="g002">온도계</a>
                        <a href="#" name="g002">청소용품</a>
                        <a href="#" name="g002">부화용품</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						반려조 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">외출용품</a>
                        <a href="#" name="g002">목욕용품</a>
                        <a href="#" name="g002">훈련용품</a>
                        <a href="#" name="g002">새장</a>
                        <a href="#" name="g002">횃대</a>
                        <a href="#" name="g002">보온용품</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						파충류 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">하우스</a>
                        <a href="#" name="g002">온도계</a>
                        <a href="#" name="g002">청소용품</a>
                        <a href="#" name="g002">채집통</a>
                        <a href="#" name="g002">바닥재</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						설치류 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">외출용품</a>
                        <a href="#" name="g002">하우스</a>
                        <a href="#" name="g002">베딩</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001">
						기타 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002">사료</a>
                        <a href="#" name="g002">간식</a>
                        <a href="#" name="g002">영양제</a>
                        <a href="#" name="g002">장난감</a>
                        <a href="#" name="g002">급식기</a>
                        <a href="#" name="g002">의류</a>
                        <a href="#" name="g002">외출용품</a>
                        <a href="#" name="g002">하우스</a>
                        <a href="#" name="g002">배변용품</a>
                        <a href="#" name="g002">훈련용품</a>
                        <a href="#" name="g002">기타</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		/* function chatlist() {
			// 채팅창 띄워기(사이즈 지정)
			window.open("chatlist.jsp", "채팅하기", "width=640, height=800") // 새로운 창 띄우기 
			// getContextPath : 현재위치,  채팅하기 : 창의 이름
		} */
	</script>
	<script src="assets/js/header.js"></script>
</body>
</html>