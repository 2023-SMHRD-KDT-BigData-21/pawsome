<%@page import="java.math.BigDecimal"%>
<%@page import="com.soa.model.UserLikeDAO"%>
<%@page import="com.soa.model.ImageFile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.soa.model.ImageFileDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.soa.model.Product"%>
<%@page import="com.soa.model.ProductDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.soa.model.Member"%>
<%@page import="com.soa.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/mypage.css">
</head>
<body>
<%
	String user_id = (String)session.getAttribute("member");
	MemberDAO dao = new MemberDAO();
	Member member = dao.idCheck(user_id);
	System.out.println(member);
	pageContext.setAttribute("member", member);
	
	//판매목록 불러오기
	ProductDAO pdao = new ProductDAO();
	List<Product> myplist = pdao.myProduct(user_id);
	pageContext.setAttribute("myplist", myplist);
	
	ImageFileDAO idao = new ImageFileDAO();
	List<String> myilist = new ArrayList();
	for(int i = 0; i < myplist.size(); i++) {
		myilist.add(idao.myProductImage(myplist.get(i).getProduct_id()));
	}
	
	//구매목록 불러오기
	List<Product> buyplist = pdao.myBuyProduct(user_id);
	pageContext.setAttribute("buyplist", buyplist);
	
	List<String> buyilist = new ArrayList();
	for(int i = 0; i < buyplist.size(); i++) {
		buyilist.add(idao.myBuyProductImage(buyplist.get(i).getProduct_id()));
	}
	
	//찜목록 불러오기
	UserLikeDAO udao = new UserLikeDAO();
	List<BigDecimal> likelist = udao.likeProduct(user_id);
	
	List<Product> likeplist = new ArrayList();
	for(int i = 0; i < likelist.size(); i++) {
		likeplist.add(pdao.likeProduct(likelist.get(i)));
	}
	pageContext.setAttribute("likeplist", likeplist);
	
	List<String> likeilist = new ArrayList();
	for(int i = 0; i < likeplist.size(); i++) {
		likeilist.add(idao.likeProductImage(likelist.get(i)));
	}
	pageContext.setAttribute("likeilist", likeilist);
	
%>
	<div data-include-path="header.jsp"></div>
    <!--하단부-->
    <div class="box5">
        <div class="mypage"><!--개인 정보란-->
            <div class="left"><!--프로필&닉네임 수정칸-->
                <div class="up">
                    <div class="left1"><span class="padding" style="padding-right: 50px"></span>MY PAGE</div>
                    <div class="right1">
                        <a href="update.jsp?id=<%=user_id%>">
                            <button class="modify">수정</button>
                        </a>
                    </div>
                </div>
                <div class="down">
                    <div class="left2">
                        <div class="circle">
                        <%if(member.getUser_img()==null) {%>
                            <div id="photo"><img id="photo" src="https://www.studiopeople.kr/common/img/default_profile.png"></div>
                        <%}else { %>
                            <div id="photo"><img id="photo" src="data:image/jpg;base64,<%=member.getUser_img() %>"></div>
                        <%} %>
                        </div>
                    </div>
                    <div class="right2"><span class="padding2" style="padding-right: 20px"></span>
                        <div id="nickName"><%=member.getUser_nick() %></div>
                    </div>
                </div>
            </div>
            <div class="right"><!--신뢰도, 판매&구매건수, 찜한 물품-->
                <div class="up2">
                    <div id="left">신뢰도</div>
                    <div id="right">
                        <div class="credit">
                            <div id="gauge"></div>
                        </div>
                    </div>
                </div>
                <div class="down2">
                    <div class="downOne">
                        <div class="circle">
                            <div class="part1">판매건수</div>
                            <div class="part2" id="sellCount"><%=myplist.size() %></div>
                        </div>
                    </div>
                    <div class="downTwo">
                        <div class="circle">
                            <div class="part1">구매건수</div>
                            <div class="part2" id="buyCount"><%=buyplist.size() %></div>
                        </div>
                    </div>
                    <div class="downThree">
                        <div class="circle">
                            <div class="part1">찜한 물건</div>
                            <div class="part2" id="checkCount">N</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box6"><!--선택 버튼 목록-->
        <div class="checkList">
            <button class="selling">판매</button>
            <span style="padding-right: 20px"></span>
            <button class="buy">구매</button>
            <span style="padding-right: 20px"></span>
            <button class="choice">찜 목록</button>
        </div>
    </div>
    <!-- 판매게시글 정보 -->
    <div class="box7"><!--상품 이미지 및 게시글 링크-->
        <div class="merchandiseList">

            <%for(int i = 0; i < myplist.size(); i++) {%>
            <div class="merchandise">
                <div class="merchandise1"><img width="150px" height="150px" src="data:image/jpg;base64,<%=myilist.get(i)%>"></div>
                <div class="merchandise2">
                <%if(myplist.get(i).getProduct_status().equals("N")) {%>
					판매상태 : 판매중<br>
				<%}else {%>
					판매상태 : 판매완료<br>
				<%} %>
                    제목 : <%=myplist.get(i).getProduct_name() %><br>
                    가격 : <%=myplist.get(i).getProduct_price() %><br>
                    등록일 : <%=myplist.get(i).getProduct_reg_date().getMonth()+1 %>월
                    <%=myplist.get(i).getProduct_reg_date().getDate() %>일
                </div>
            </div>
            <span style="padding-right: 20px"></span>
            <%} %>
            
        </div>
    </div>
    <!-- 구매게시글 정보 -->
	<div class="box7"><!--상품 이미지 및 게시글 링크-->
        <div class="merchandiseList">

            <%for(int i = 0; i < myplist.size(); i++) {%>
            <div class="merchandise">
                <div class="merchandise1"><img width="150px" height="150px" src="data:image/jpg;base64,<%=buyilist.get(i)%>"></div>
                <div class="merchandise2">
					판매상태 : 판매완료<br>
                    제목 : <%=buyplist.get(i).getProduct_name() %><br>
                    가격 : <%=buyplist.get(i).getProduct_price() %><br>
                    등록일 : <%=buyplist.get(i).getProduct_reg_date().getMonth()+1 %>월
                    <%=buyplist.get(i).getProduct_reg_date().getDate() %>일
                </div>
            </div>
            <span style="padding-right: 20px"></span>
            <%} %>
            
        </div>
    </div>
    <!-- 찜목록 게시글 정보 -->
	<div class="box7"><!--상품 이미지 및 게시글 링크-->
        <div class="merchandiseList">

            <%for(int i = 0; i < likeplist.size(); i++) {%>
            <div class="merchandise">
                <div class="merchandise1"><img width="150px" height="150px" src="data:image/jpg;base64,<%=likeilist.get(i)%>"></div>
                <div class="merchandise2">
					판매상태 : 판매완료<br>
                    제목 : <%=likeplist.get(i).getProduct_name() %><br>
                    가격 : <%=likeplist.get(i).getProduct_price() %><br>
                    등록일 : <%=likeplist.get(i).getProduct_reg_date().getMonth()+1 %>월
                    <%=likeplist.get(i).getProduct_reg_date().getDate() %>일
                </div>
            </div>
            <span style="padding-right: 20px"></span>
            <%} %>
            
        </div>
    </div>
    
    <script>
        /*header.jsp*/
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

</body>
</html>