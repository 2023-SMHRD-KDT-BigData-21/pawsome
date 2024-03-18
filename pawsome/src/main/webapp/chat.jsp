<%@page import="oracle.net.aso.p"%>
<%@page import="com.soa.model.Product"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.soa.model.ImageFileDAO"%>
<%@page import="com.soa.model.Member"%>
<%@page import="com.soa.model.MemberDAO"%>
<%@page import="com.soa.model.ProductDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	String product_id = request.getParameter("product_id");
	System.out.println(sender + receiver);
	
	MessageRoom room = new MessageRoom(sender,receiver,product_id);
	System.out.println(room);
	
	MessageRoomDAO dao = new MessageRoomDAO();
	
	int res = dao.createRoom(room);
	int rnum = dao.roomCheck(room);
	String room_no = Integer.toString(rnum);
	System.out.println(rnum);
	
//	MessageLog log = new MessageLog(room_no,sender);
	MessageLog log = new MessageLog(room_no);
	MessageLogDAO ldao = new MessageLogDAO();
	List<MessageLog> list = ldao.getLog(log);
	pageContext.setAttribute("list",list);
	System.out.println(list.size());
	//list.get(0).getM_content();
	
	//상대방(판매자)프로필사진 불러오기
	MemberDAO mdao = new MemberDAO();
	Member member = mdao.idCheck(receiver);
	pageContext.setAttribute("member", member);
	
	//해당 게시글 정보,1번사진 불러오기
	ProductDAO pdao = new ProductDAO();
	ImageFileDAO idao = new ImageFileDAO();
	BigDecimal p_id = new BigDecimal(product_id);
	Product product = pdao.likeProduct(p_id);
	String imageFile = idao.likeProductImage(p_id);
	pageContext.setAttribute("product", product);
	pageContext.setAttribute("imageFile", imageFile);
	
%>
<body>
	<div id="main-container">
		<div class="profile-container">
			<div class="imgBox profileImgBox">
			<%if(member.getUser_img()==null) {%>
              	<img src="https://www.studiopeople.kr/common/img/default_profile.png">
            <%}else { %>
                <img src="data:image/jpg;base64,<%=member.getUser_img() %>" alt="">
            <%} %>
			</div>
			<div class="contentBox">
				<div class="title" align="center" onclick="productPage()"><span><%=product.getProduct_name() %></span></div>
				<div class="confirmBtn" onclick="confirmMessage()"><span>거래확정</span>
				</div>
			</div>
			<div class="imgBox productImgBox">
				<img src="data:image/jpg;base64,<%=imageFile%>" alt="">
			</div>


		</div>
		<div id="chat-container"></div>
		<div id="bottom-container">
			<input id="inputMessage" type="text" autofocus> 
			<input id="btn-submit" type="submit" value="전송">
		</div>
	</div>
	<script>
		//1. 소켓 객체 생성
		var webSocket = new WebSocket("ws://localhost:8081/pawsome/chat")

		var input = document.getElementById("inputMessage")

		$("#btn-submit").click(function() {
			var msg = input.value
			
			$.ajax({
		         url:'MessageLogController', 
		         type:'get',
		         data:{
		            "m_content":msg,
		            "room_no":"<%=rnum%>",
		            "sender":"<%=sender%>"
		         },
		         success:function(){
		        	console.log("요청성공!");
		         },
		         error:function(){
		            console.log("요청실패!");   
		         }
		      })
			
			webSocket.send(msg) // 소켓서버로 msg를 보냄
			
			var chat = "<div class='my-chat-box'><div class='chat my-chat'>"+ msg + "</div></div>"
			$("#chat-container").append(chat)
				input.value = "" // 채팅 input 비우기
				input.focus();
			})
		
			$(function() {
			    // inputMessage 필드에 keypress 이벤트 리스너를 추가합니다.
			    $("#inputMessage").keypress(function(e) {
			        // 눌린 키가 Enter (keyCode 13)인 경우
			        if(e.which == 13) {
			            // 기본 이벤트를 방지합니다. (Enter 키로 인한 폼 제출 방지)
			            e.preventDefault();
			            // 전송 버튼 클릭과 같은 로직을 실행합니다.
			            $("#btn-submit").click();
			        }
			    });
			});

		// onOpen, onClose, onError, onMessage
		webSocket.onopen = function(e) {//소켓 서버에 연결이 되면 실행
			console.log("Socket 연결")
			let temp =""
			<%for(int i = 0; i < list.size(); i++){%>
			temp = "<%=list.get(i).getM_content()%>"
			if(<%=list.get(i).getSender().equals(sender)%>){
				var chat = "<div class='my-chat-box'><div class='chat my-chat'>"+ temp + "</div></div>"
				$("#chat-container").append(chat)				
			} else{
				var chat = "<div class='chat-box'><div class='chat'>" + temp + "</div></div>"
				$("#chat-container").append(chat)
			}
			<%}%>
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
			if(confirm("구매를 확정하시겠습니까?")){
				$.ajax({
			         url:'UpdateStatusController', 
			         type:'post',
			         data:{
			            "product_id":'<%=product_id%>',
			            "buyer_id":'<%=sender%>'
			         },
			         success:function(){
			        	console.log("요청성공!");
			        	if(confirm("구매를 확정하시겠습니까?")==true){
			        		window.open("review.jsp", "후기보내기", "width=550, height=250");
			        	}
			         },
			         error:function(){
			            console.log("요청실패!");   
			         }
			      })
			}
		}
		
		/* '글제목' 클릭 시 해당 게시글 창 띄우기 */
		function productPage(){ 
			window.open("ProductPage.jsp?product_id=<%=product.getProduct_id()%>")
		}
		
		
	</script>
</body>
</html>