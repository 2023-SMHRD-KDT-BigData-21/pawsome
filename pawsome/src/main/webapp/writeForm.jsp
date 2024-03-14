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
	<div data-include-path="header.html"></div>

	<!-- 본문 -->
	<div class="container">
		<div class="writePage">
			<form action="ProductController" method="post"
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
						가격<input type="text" name="product_price" id="priceInput">
					</div>
					<div class="bottomInput fileInput">
						<input type="file" name="file_name" id="file_name" multiple>
					</div>
				</div>
				<div class="submitBtn writePageUnder">
					<input type="submit" value="등록" id="btn"> <input
						type="reset" value="취소" id="btn">
				</div>
			</form>
		</div>
	</div>



	<script>
        /* 동물 선택에 따라 용품 분류해주기 */
        let g002_01 = [
            { v: "01", t: "사료" },
            { v: "02", t: "간식" },
            { v: "03", t: "영양제" }
        ];

        let g002_02 = [
            { v: "01", t: "사료" },
            { v: "02", t: "간식" },
            { v: "03", t: "영양제" },
            { v: "04", t: "캣휠" }
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
            }

            document.getElementById("g002").innerHTML = h.join("");
        }


        /*header.html*/
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