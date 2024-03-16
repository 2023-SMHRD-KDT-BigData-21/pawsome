<%@page import="java.util.List"%>
<%@page import="com.soa.model.MessageLogDAO"%>
<%@page import="com.soa.model.MessageLog"%>
<%@page import="com.soa.model.MessageRoomDAO"%>
<%@page import="com.soa.model.MessageRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="assets/css/chatstyle.css">
</head>
<%
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	
	MessageRoom room = new MessageRoom(sender,receiver);
	MessageRoomDAO dao = new MessageRoomDAO();
	
	int res = dao.createRoom(room);
	int rnum = dao.roomCheck(room);
	String room_no = Integer.toString(rnum);
	System.out.println(rnum);
	
	MessageLog log = new MessageLog(room_no,sender);
	MessageLogDAO ldao = new MessageLogDAO();
	List<MessageLog> list = ldao.getLog(log);
	pageContext.setAttribute("list",list);
	System.out.println(list.size());
%>
<body>
	<div id="main-container">
		<div class="profile-container">
			<div class="imgBox profileImgBox">
				<img src="https://i.ytimg.com/vi/K19h13qQy9Y/maxresdefault.jpg"
					alt="">
			</div>
			<div class="contentBox">
				<div class="title" align="center" onclick="productPage()">제목</div>
				<div class="confirmBtn" onclick="confirmMessage()">거래확정
				</div>
			</div>
			<div class="imgBox productImgBox">
				<img
					src="https://previews.123rf.com/images/yuliaavgust/yuliaavgust1303/yuliaavgust130300070/18411573-%EC%83%88%EC%9E%A5%EC%97%90-%EB%B3%B5%EA%B3%A0-%EC%BC%80%EC%9D%B4%EC%A7%80-%EB%B9%85-%EB%B8%94%EB%A3%A8-%EB%A8%B8-%EC%BD%94-%EC%95%84-%EB%9D%BC-ararauna%EC%97%90-%EC%95%B5%EB%AC%B4%EC%83%88.jpg"
					alt="">
			</div>


		</div>
		<div id="chat-container"></div>
		<div id="bottom-container">
			<input id="inputMessage" type="text" autofocus> <input
				id="btn-submit" type="submit" value="전송">
		</div>
	</div>
	<script>
		//1. 소켓 객체 생성
		var webSocket = new WebSocket("ws://localhost:8081/pawsome/chat")

		var input = document.getElementById("inputMessage")

		$("#btn-submit")
				.click(
						function() {
							var msg = input.value
							webSocket.send(msg) // 소켓서버로 msg를 보냄

							var chat = "<div class='my-chat-box'><div class='chat my-chat'>"
									+ msg + "</div></div>"
							$("#chat-container").append(chat)
							input.value = "" // 채팅 input 비우기
							input.focus();
						})

		// onOpen, onClose, onError, onMessage
		webSocket.onopen = function(e) {//소켓 서버에 연결이 되면 실행
			console.log("Socket 연결")
		}

		webSocket.onclose = function(e) {
			console.log("Socket 연결 해제")
		}

		webSocket.onerror = function(e) {
			console.log(e.data)
		}

		webSocket.onmessage = function(e) {
			console.log(e.data)

			var chat = "<div class='chat-box'><div class='chat'>" + e.data
					+ "</div></div>"
			$("#chat-container").append(chat)
		}
		
		
		/* 구매 확정 메시지 띄우기 */
		function confirmMessage(){
			confirm("구매를 확정하시겠습니까?")
		}
		
		/* '글제목' 클릭 시 해당 게시글 창 띄우기 */
		function productPage(){ 
			window.open("boardlist.jsp")
		}
		
		
	</script>
</body>
</html>