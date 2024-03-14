

/* <!-- 상품 div begin -->
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <a href="#"> <!-- 게시글페이지로 이동 -->
                            <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            </div>
                        </a>
                        <div class="product__item__text">
                            <a href="#"> <!-- 게시글페이지로 이동 -->
                                <h6>Piqué Biker Jacket</h6> <!-- 게시글 이름 -->
                                <h5>$67.24</h5> <!-- 가격 -->
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 상품 div end --> */

let spad = docum.getElementById("spad");
http://127.0.0.1:5500/TEMPLATE/product.html#
/* main 페이지 클릭시 render 함수 실행  */
const render = function () {
    let resultHtml = "";

    for (let i = 0; i < ProductList.length; i++) {
        resultHtml += `
        <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
        <div class="product__item">
            <a href="#">
                <div class="product__item__pic set-bg" data-setbg="${productList[i].fileName}">
                </div>
            </a>
            <div class="product__item__text">
                <a href="#">
                    <h6>${productList[i].productName}</h6>
                    <h5>${productList[i].productPrice}</h5>
                </a>
            </div>
        </div>
    </div>
        `
    }

    spad.innerHtml = resultHtml ;

}