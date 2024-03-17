<%@page import="java.util.ArrayList"%>
<%@page import="com.soa.model.MessageLogDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.soa.model.MessageRoomDAO"%>
<%@page import="com.soa.model.MessageRoom"%>
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
<%
	String id = (String) session.getAttribute("member");
	String counpart_id = "";                                 //대화 상대 id 
	MessageRoomDAO dao = new MessageRoomDAO();
	
	List<MessageRoom> list = dao.getList(id);
	
	System.out.println(id);
	
	MessageLogDAO ldao = new MessageLogDAO();
	
	ArrayList<String> countparts = new ArrayList<String>();
%>
	<div class="chatListContainer">
		<div class="chatting">
			<!--채팅 목록 리스트-->
			<%for(int i = 0; i < list.size(); i++) { %>
			<div class="case casebox" ondblclick="chat(this);">
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
					<%if(list.get(i).getBuyer().equals(id)){ %>
					<div class="nickname" ><span><%=list.get(i).getSeller() %></span></div>
					<input class="receiver" type="hidden" value="<%=list.get(i).getSeller() %>">
					<%
						String rnum = list.get(i).getRoom_no();
						String product_id = list.get(i).getProduct_id();
						String log = ldao.getLast(rnum);
					%>
					<input class="product_id" type="hidden" value="<%=product_id%>">
					<div class="last"><span><%=log %></span></div>
					<%} else{ %>
					<div class="nickname"><span><%=list.get(i).getBuyer() %></span></div>
					<input class="receiver" type="hidden" value="<%=list.get(i).getBuyer() %>">
					<%
						String rnum = list.get(i).getRoom_no();
						String product_id = list.get(i).getProduct_id();
						String log = ldao.getLast(rnum);
					%>
					<input class="product_id" type="hidden" value="<%=product_id%>">
					<div class="last"><span><%=log %></span></div>
					<%} %>
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
			<%} %>
			<!-- 여기까지 반복 -->


		</div>
	</div>
	<script>
		function chat(casebox) {
        	// 채팅창 띄워기(사이즈 지정)
        	let countpart = casebox.querySelector('.receiver').value;
			let pd_id = casebox.querySelector('.product_id').value;
        	var sender = '<%=id%>';                  
        	var receiver = countpart;             
        	var product_id = pd_id;
        	window.open("chat.jsp?sender="+sender+"&receiver="+receiver+"&product_id="+product_id, "채팅하기", "width=640, height=800") // 새로운 창 띄우기 
        	//var childWindow = window.open("chatlist.jsp?sender="+sender+"&recevier="+receiver, "채팅하기", "width=640, height=800") // 새로운 창 띄우기 
        	// getContextPath : 현재위치,  채팅하기 : 창의 이름
	}
	</script>
</body>
</html>