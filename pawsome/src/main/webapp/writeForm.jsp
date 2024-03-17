<%@page import="com.soa.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/writeForm.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<%
	String id = (String)session.getAttribute("member");
%>

	<div data-include-path="header.jsp"></div>

	<!-- 본문 -->
	<div class="container">
		<div class="writePage">
			<form action="ProductController?seller_id=<%=id%>" method="post"
				enctype="multipart/form-data" class="writePageUnder formCSS">
				<div class="topWrite writePageUnder">
					<select name="g001" id="g001" onchange="loadAnimalPd();">
						<option value="00">동물</option>
						<option value="01">강아지</option>
						<option value="02">고양이</option>
						<option value="03">관상어</option>
						<option value="04">반려조</option>
						<option value="05">파충류</option>
						<option value="06">설치류</option>
						<option value="07">기타</option>
					</select> <select name="g002" id="g002">
						<option value="00">용품</option>
					</select> <input type="text" name="product_name" placeholder="제목을 입력하세요"
						id="titleInput">
				</div>
				<!-- https://gandevelop.tistory.com/83 div를 input처럼 사용 -->
				<div id="productContentBox" class="contentWrite writePageUnder">
					<!-- 내용 입력 : textarea -->
					<textarea name="product_content" id="productContent"
						class="contentWrite writePageUnder"></textarea>
				</div>
				<div class="bottomWrite writePageUnder">
					<div class="bottomInput">
						가격<input type="text" name="product_price" id="priceInput" dir="rtl">
					</div>
					<button type="button" id="add">파일 추가</button>
	                <button type="button" id="remove">파일 삭제</button>
					<div class="bottomInput fileInput">
						<input type="file" value="대표 사진" name="file_name1" id="file_name">
					</div>
				</div>
				<div class="submitBtn writePageUnder">
					<input type="submit" value="등록" id="btn"> 
					<input type="reset" value="취소" id="btn">
				</div>
			</form>
		</div>
	</div>

<script>
	// 버튼 추가 삭제 기능
    const addButton = document.getElementById('add');
    const removeButton = document.getElementById('remove');
    
    // 현재 파일 입력 필드의 개수를 추적하는 변수
    let fileInputCount = 1;

    // 파일 추가 버튼 클릭 이벤트 리스너
    addButton.addEventListener('click', function() {
        // 파일 입력 필드 개수를 증가
        if (fileInputCount < 5) {
	        fileInputCount++;
	
	        // 새로운 input 요소 생성
	        const newInput = document.createElement('input');
	        newInput.type = 'file';
	        // 파일 이름을 순차적으로 설정 (file_name1, file_name2, ...)
	        newInput.name = 'file_name' + fileInputCount;
	        
	        // 파일 입력 컨테이너에 새로운 input 요소 추가
	        document.querySelector('.bottomInput.fileInput').appendChild(newInput);
        }else {
        	alert("파일은 최대 5개까지만 첨부할 수 있습니다.")
        }
    });
    
 	// 파일 삭제 버튼 클릭 이벤트 리스너
    removeButton.addEventListener('click', function() {
        // 파일 입력 필드 개수가 1보다 클 때만 삭제
        if (fileInputCount > 1) {
            // 마지막으로 추가된 파일 입력 필드를 선택
            const lastInput = document.querySelector('.bottomInput.fileInput input:last-child');
            // 파일 입력 컨테이너에서 해당 입력 필드 제거
            document.querySelector('.bottomInput.fileInput').removeChild(lastInput);
            // 파일 입력 필드 개수를 감소
            fileInputCount--;
        }
    });
</script>

	<script>
	/* 동물 선택에 따라 용품 분류해주기 */
    /* 강아지 */
    let g002_01 = [
        { v: "01", t: "사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "06", t: "의류" },
        { v: "07", t: "악세서리" },
        { v: "08", t: "외출용품" },
        { v: "09", t: "하우스" },
        { v: "10", t: "미용용품" },
        { v: "11", t: "목욕용품" },
        { v: "12", t: "배변용품" },
        { v: "13", t: "훈련용품" },
        { v: "31", t: "기타" }
    ];
    /* 고양이 */
    let g002_02 = [
        { v: "14", t: "건사료" },
        { v: "15", t: "습식사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "06", t: "의류" },
        { v: "07", t: "악세서리" },
        { v: "08", t: "외출용품" },
        { v: "16", t: "캣타워" },
        { v: "09", t: "하우스" },
        { v: "10", t: "미용용품" },
        { v: "11", t: "목욕용품" },
        { v: "12", t: "배변용품" },
        { v: "13", t: "훈련용품" },
        { v: "31", t: "기타" }
    ];
    /* 관상어 */
    let g002_03 = [
        { v: "01", t: "사료" },
        { v: "17", t: "수초" },
        { v: "18", t: "수조/어항" },
        { v: "19", t: "수질관리용품" },
        { v: "20", t: "여과용품" },
        { v: "21", t: "수조장식" },
        { v: "22", t: "온도계" },
        { v: "23", t: "청소용품" },
        { v: "24", t: "부화용품" },
        { v: "31", t: "기타" }
    ];
    /* 반려조 */
    let g002_04 = [
        { v: "01", t: "사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "08", t: "외출용품" },
        { v: "11", t: "목욕용품" },
        { v: "13", t: "훈련용품" },
        { v: "25", t: "새장" },
        { v: "26", t: "횃대" },
        { v: "27", t: "보온용품" },
        { v: "31", t: "기타" }
    ];
    /* 파충류 */
    let g002_05 = [
        { v: "01", t: "사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "09", t: "하우스" },
        { v: "22", t: "온도계" },
        { v: "23", t: "청소용품" },
        { v: "28", t: "채집통" },
        { v: "29", t: "바닥재" },
        { v: "31", t: "기타" }
    ];

    /* 설치류 */
    let g002_06 = [
        { v: "01", t: "사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "08", t: "외출용품" },
        { v: "09", t: "하우스" },
        { v: "30", t: "베딩" },
        { v: "31", t: "기타" }
    ];

    /* 기타 */
    let g002_07 = [
        { v: "01", t: "사료" },
        { v: "02", t: "간식" },
        { v: "03", t: "영양제" },
        { v: "04", t: "장난감" },
        { v: "05", t: "급식기" },
        { v: "06", t: "의류" },
        { v: "08", t: "외출용품" },
        { v: "09", t: "하우스" },
        { v: "12", t: "배변용품" },
        { v: "13", t: "훈련용품" },
        { v: "31", t: "기타" }
    ];

    function loadAnimalPd() {
        let animal_cate = document.getElementById("g001").value;
        let h = [];

        if (animal_cate == "01") {
            g002_01.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else if (animal_cate == "02") {
            g002_02.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else if (animal_cate == "03") {
            g002_03.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else if (animal_cate == "04") {
            g002_04.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else if (animal_cate == "05") {
            g002_05.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else if (animal_cate == "06") {
            g002_06.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        } else {
            g002_07.forEach(item => {
                h.push(`<option value=${item.v}>${item.t}</option>`)
            });
        }

        document.getElementById("g002").innerHTML = h.join("");
    }


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
    <script src="assets/js/header.js"></script>

</body>
</html>