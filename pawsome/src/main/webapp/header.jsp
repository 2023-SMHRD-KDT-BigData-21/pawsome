<%@page import="com.google.gson.Gson"%>
<%@page import="com.soa.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.soa.model.MemberDAO"%>
<%@page import="com.soa.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pawsome</title>
<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/header.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
				<input type="hidden" id="searchResult" value="<%= new Gson().toJson(request.getAttribute("search_result")) %>">
				<i class="icon ion-md-search" onclick="search()"></i>
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
					<button class="dropbtn" name="g001" data-value="01">
						강아지 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('01', '01')">사료</a>
                        <a href="#" name="g002" data-value="02" onclick="cate('01', '02')">간식</a>
                        <a href="#" name="g002" data-value="03" onclick="cate('01', '03')">영양제</a>
                        <a href="#" name="g002" data-value="04" onclick="cate('01', '04')">장난감</a>
                        <a href="#" name="g002" data-value="05" onclick="cate('01', '05')">급식기</a>
                        <a href="#" name="g002" data-value="06" onclick="cate('01', '06')">의류</a>
                        <a href="#" name="g002" data-value="07" onclick="cate('01', '07')">악세서리</a>
                        <a href="#" name="g002" data-value="08" onclick="cate('01', '08')">외출용품</a>
                        <a href="#" name="g002" data-value="09" onclick="cate('01', '09')">하우스</a>
                        <a href="#" name="g002" data-value="10" onclick="cate('01', '10')">미용용품</a>
                        <a href="#" name="g002" data-value="11" onclick="cate('01', '11')">목욕용품</a>
                        <a href="#" name="g002" data-value="12" onclick="cate('01', '12')">배변용품</a>
                        <a href="#" name="g002" data-value="13" onclick="cate('01', '13')">훈련용품</a>
                        <a href="#" name="g002" data-value="31" onclick="cate('01', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="02">
						고양이 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('02', '14')">건사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '15')">습식사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '02')">간식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '03')">영양제</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '04')">장난감</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '05')">급식기</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '06')">의류</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '07')">악세서리</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '08')">외출용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '16')">캣타워</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '09')">하우스</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '10')">미용용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '11')">목욕용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '12')">배변용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '13')">훈련용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('02', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="03">
						관상어 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('03', '01')">사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '17')">수초</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '18')">수조/어항</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '19')">수질관리용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '20')">여과용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '21')">수조장식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '22')">온도계</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '23')">청소용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '24')">부화용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('03', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="04">
						반려조 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('04', '01')">사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '02')">간식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '03')">영양제</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '04')">장난감</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '05')">급식기</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '08')">외출용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '11')">목욕용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '13')">훈련용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '25')">새장</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '26')">횃대</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '27')">보온용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('04', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="05">
						파충류 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('05', '01')">사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '02')">간식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '03')">영양제</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '04')">장난감</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '05')">급식기</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '09')">하우스</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '22')">온도계</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '23')">청소용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '28')">채집통</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '29')">바닥재</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('05', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="06">
						설치류 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('06', '01')">사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '02')">간식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '03')">영양제</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '04')">장난감</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '05')">급식기</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '08')">외출용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '09')">하우스</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '30')">베딩</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('06', '31')">기타</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" name="g001" data-value="07">
						기타 <span class="radix-icons--triangle-down"></span>
					</button>
					<div class="dropdown-content">
						<a href="#" name="g002" data-value="01" onclick="cate('07', '01')">사료</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '02')">간식</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '03')">영양제</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '04')">장난감</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '05')">급식기</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '06')">의류</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '08')">외출용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '09')">하우스</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '12')">배변용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '13')">훈련용품</a>
                        <a href="#" name="g002" data-value="01" onclick="cate('07', '31')">기타</a>
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
		
		let tmp = document.getElementById("searchResult");
		
		console.log(tmp);
		
		function search(){
			let s_word = document.getElementById("inputSearch").value;
			
			if(s_word != null){
				
				$.ajax({
			         url:'main.jsp', 
			         type:'post',
			         data:{
			            "s_word":s_word
			         },
			         success:function(){
			        	console.log("요청성공!");
			         },
			         error:function(){
			            console.log("요청실패!");   
			         }
			      })
			}
			
		}
	</script>
	<script src="assets/js/header.js"></script>
</body>
</html>