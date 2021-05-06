<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>

<link rel="stylesheet" href="./css/banner.css">
<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/mon.css">
<link rel="stylesheet" href="./css/contents.css">
<link rel="stylesheet" href="./css/daram.css">
<link rel="stylesheet" href="./css/fonts.css">
<link rel="stylesheet" href="./css/incipit.css">
<link rel="stylesheet" href="./css/loading.css">
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/slick.css">
<link rel="stylesheet" href="./css/swiper.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/shop.css">
<link rel="stylesheet" href="./css/shop.css">
<link rel="stylesheet" href="./css/common.css">
</head>

<body>
	<div id="banner">
		<%@include file="./banner.jsp"%>
	</div>

	<!--  상품상세 -->
	<div class="productView_top">
		<div class="imgWrap">
			<img id="zoom_goodst"
				src="https://fs.arumnet.com/image/N2780HKSSH//item/27800000339238/4.jpg"
				onerror="fn_ChangeImage(this, 'big');hideNpayButton();"
				data-zoom-image="https://fs.arumnet.com/image/N2780HKSSH//item/27800000339238/4.jpg"
				alt="" />
		</div>
		<div class="txtWrap">
			<div class="prdInfo top">
				<p class="prdName">${pd.product_name}</p>
				<ul style="border-top: 0;">
					<li>
						<dl>
							<dt>단위</dt>
							<dd>130g(15~20미내외)</dd>
						</dl>
					</li>
				</ul>
				<ul style="height: 120px;">
					<li>
						<dl>
							<dt>판매가</dt>
							<dd id="product_price"><c:out value="${pd.product_price}"/></dd>
						</dl>
					</li>
					<li>
				</ul>
				<ul>
					<li>
						<dl>
							<dt>배송비</dt>
							<dd>무료배송</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>어가명</dt>
							<dd>
								<span>자연애</span>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>원산지</dt>
							<dd style="font-size: 20px; font-weight: 500;"
								class="item_notice">
								<a>상품정보 고시 참고</a>
							</dd>
						</dl>
					</li>
				</ul>
				<div class="prd-add">
					<div class="amount-box">
						<div class="amount">
							<a href="javascript:;" class="del_item_quantity2 cursor amount-down">-</a>
							<input type="text" name="quantity" id="quantity"
								size="3" maxlength="3" value="1"
								class="number  quantity_chk itemCount" /> <a href="javascript:;"
								class="add_item_quantity2 cursor amount-up">+</a>
						</div>
						<p>${pd.product_price}</p>
					</div>
				</div>

				<div class="total-price">
					<input type="hidden" class="itemPrice" value="14900.0" />
					<dl>
						<dt>총 합계금액</dt>
						<input type="hidden" value="14900.0" class="total">
						<dd class="totalPrice">총 14,900원</dd>
					</dl>
				</div>

				<div class="btnWrap btn02">
					<a href="javascript:callAddCart();" alt="장바구니 담기" class="cart_add  float_left cursor">장바구니 담기</a>
					<!-- 장바구니 담기 기능 이식 완료 -->
					<a href="javascript:blockFloat();" alt="구매하기" class="order_now float_left cursor blue">바로 구매하기</a>
				</div>
			</div>
		</div>
	</div>
      
    <div id="float" style="display:none; position:absolute; left:600px; top:600px; border:1px solid; z-index:10;">
       <div><a href="javascript:callAddCart();">장바구니</a></div>
       <div><a href="javascript:closeFloat();">계속쇼핑</a></div>
    </div>

	<div class="footer">
		<%@include file="./footer.jsp"%>
	</div>

    <form id="addCart" action="addCart" method="get">
       <input type="hidden" name="product_no" value="${pd.product_no}">
       <input type="hidden" name="amount" value="0">
    </form>

	<script>
		function callAddCart() {
			let form = document.getElementById('addCart');
			form.amount.value = document.getElementById('quantity').value;
			form.submit();
		}
		function blockFloat() {
			let target = document.getElementById('float');
			target.style.display = 'block';
		}
		function closeFloat() {
			let target = document.getElementById('float');
			target.style.display = 'none';
		}
        
	    function calcurateTotalPrice(){
	       var total_price= 0; // 총 금액을 저장할 변수
	       
	       let product_price = document.getElementById('product_price'); 
	       // html에서 id가 'product_price'인 <dd>를 가져옴
	       
	       let cart_total = document.getElementById('quantity'); 
	       // html에서 id가 'quantity'인 <input>을 가져옴
	       
	       total_price+=Number(product_price.textContent) * Number(cart_total.value);
	       
	       // product_prices 배열의 길이만큼 for문을 반복
	    }
	</script>
</body>
</html>