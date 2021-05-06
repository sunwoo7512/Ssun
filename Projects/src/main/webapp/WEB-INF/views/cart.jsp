<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

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
</head>
<body>
	<div id="banner">
		<%@include file="./banner.jsp"%>
	</div>
	<div id="subContents2">
		<div id="contents" class="auto">
			<div class="breadCrumb">
				<ul>
					<li>홈</li>
					<li>장바구니</li>
				</ul>
			</div>
			<div class="order-process">
				<ul>
					<li class="on"><span class="step">STEP 01</span>
						<p>장바구니</p></li>
					<li><span class="step">STEP 02</span>
						<p>주문/결제</p></li>
					<li><span class="step">STEP 03</span>
						<p>주문완료</p></li>
				</ul>
			</div>
			<div
				style="font-size: 17px; margin-bottom: 15px; color: #004393; margin-left: 4px;">
				<input type="checkbox" id="checkCartAll" class="checkCartAll" value="" title="전체 선택하기" style="margin-left: 7px;"> 
				<strong style="margin-left: 3px;">장바구니 전체선택</strong>
			</div>

			<div class="orderList">
				<table class="contentsTable03 order" id="cartTable">
					<caption>장바구니 목록</caption>
					<colgroup>
						<col width="30px;">
						<col width="140px">
						<col width="">
						<col width="150px">
						<col width="150px">
						<col width="150px">
					</colgroup>
					<thead>
						<tr>
							<th class="first"><input type="checkbox" id="checkbox"
								class="checkAll" value="" title="전체 선택하기"
								style="margin-left: 5px;"></th>
							<th>전체선택</th>
							<th>주문 상품 정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
			         <c:forEach items="${cartList}" var="cart">
			            <tr>
			               <td style="text-align:center;" class="first"><input type="checkbox" name="select" id="${cart.product_no}"></td>
			               <td style="text-align:center;"><div class="prd-box"><div class="thumb"><img src="images/${cart.product_imgName}" style="width: 100%; height: 100%;" alt=""></div></div></td>
			               <td style="text-align:center;"><div class="prd-title"><span class="product_name"><c:out value="${cart.product_name}" /></span></div></td>
			               <td style="text-align:center;"><p class="product_price price rowPrice"><c:out value="${cart.product_price}" /></p></td>
			               <td style="text-align:center;"><div class="amount02"><input type="number" value="<c:out value="${cart.cart_total}" />" name="cart_total" id="total${cart.product_no}" min="1" onchange="javascript:modifyDBTotal(${cart.product_no}, this.value);"><a href="javascript:;" onclick="javascript:increaseDBTotal(${cart.product_no});" >up</a><a href="javascript:;" onclick="decreaseDBTotal(${cart.product_no});" >down</a></div></td>
			               <td></td>
			            </tr>
			         </c:forEach>
			         <tr>
		               <td>총 금액</td>
<!-- 		               <td rowspan="4"><input type="text" value="" id="total_price"></td> -->
		            </tr>
					<tfoot>
						<tr>
							<td colspan="6">
								<p class="comment">
									* 배송비 (무료배송) 0원 이상 구매 시 무료배송입니다.</span>
								</p>
								<div class="total">
									<span>상품금액 : 14,900원 + 배송비 : 0 원</span> <span class="blue">주문
										합계 : </span><input type="text" value="" id="total_price">
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				<div class="btnWrap_s btnLeft">
					<a href="javascript:;" class="btn_select_buy blue">선택상품 주문</a> 
					<a href="javascript:;" onclick="deleteSelected();" class="btn_select_delete">선택상품 삭제</a> 
					<a href="/deleteAll" class="btn_all_delete">장바구니	비우기</a>

					<div class="nPay" style="float: right; clear: both;"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<%@include file="./footer.jsp"%>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"
           integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
           crossorigin="anonymous">
	</script>
     
    <script>
	// 선택된 checkbox들의 id값을 배열로 생성
     function createSelectedCheckBoxIds(){
        let itemCheckbox = document.getElementsByName('select');
        var selectedList = new Array();
        for(var i=0; i<itemCheckbox.length; i++){
            if(itemCheckbox[i].checked) selectedList.push(itemCheckbox[i].id);
        }
        return selectedList;
     }

     // 선택된 checkbox들의 row index를 배열로 생성 
     function createRowIndexOfSelectedCheckBoxs(){
        let itemCheckbox = document.getElementsByName('select');
        var selectedList = new Array();
        for(var i=0; i<itemCheckbox.length; i++){
            if(itemCheckbox[i].checked) selectedList.push(itemCheckbox[i].parentElement.parentElement);
        }
        return selectedList;
     }

     // 전달받은 tr list를 table에서 삭제
     function deleteSelectedCheckbox(trList){
        let targetTable = document.getElementById("cartTable");
        let forIndex = trList.length;
        for(var i = 0; i<forIndex; i++){
           targetTable.deleteRow(trList[i].rowIndex);
        }
     }
        
     function calcurateTotalPrice(){
        var total_price= 0; // 총 금액을 저장할 변수
        
        let product_prices = document.getElementsByClassName('product_price'); 
        // html에서 class가 'product_price'인 아이들을 가져와서 배열로 만듬
        
        let cart_totals = document.getElementsByName('cart_total'); 
        // html에서 name이 'cart_total'인 아이들을 가져와서 배열로 만듬
        
        // product_prices 배열의 길이만큼 for문을 반복
        for(var i = 0; i<product_prices.length; i++){

           total_price+=Number(product_prices[i].textContent) * Number(cart_totals[i].value); 
           // Number() -> javascript는 java처럼 string, int 형식을 명시할 수 없음
           // total_price에 저장될 값이 숫자 형식이라고 지정해줌 
           // Number(product_prices[i].value) c:forEach에서 생성된 상품 한 줄의 상품값 가져옴
           // Number(cart_totals[i].value) c:forEach에서 생성된 상품 한 줄의 상품개수를 가져옴
           // 두 개를 곱해서 장바구니에 넣은 상품 값을 계산
           // 계산한 값을 for문이 반복될때마다 저장
        }
        
        document.getElementById("total_price").value=total_price;
        // document.getElementById("total_price")
        // document(html 페이지라고 보시면 됩니다)에서 total_price라는 id를 가지고 있는 아이를 찾음
        // id가 total_price인 객체?의 value를 total_price로 변경
     }

     function checkAllbox(){
        let mainCheckbox = document.getElementById("selectAll");
        let itemCheckbox = document.getElementsByName('select');
        if(mainCheckbox.checked) itemCheckbox.forEach(e => e.checked=true); 
        // 전체선택 checkbox가 체크됬을 때 모든 checkbox를 체크 상태로 바꿈
        else itemCheckbox.forEach(e => e.checked=false);
        // 전체선택 checkbox가 해제됬을 때 모든 checkbox를 체크 해제로 바꿈
     }
     
     function deleteSelected(){
        var selectedCheckBoxs = createSelectedCheckBoxIds();
        console.log(selectedCheckBoxs);
          $.ajax({
             url: "/deleteSelectedCart",
             type: "POST",
             dataType: "json",
             data: {
                "array" : selectedCheckBoxs
                },
             success: function(data){
             },
             error: function (request, status, error){
             }
            });
          deleteSelectedCheckbox(createRowIndexOfSelectedCheckBoxs());
          calcurateTotalPrice();
     }
     
     function increaseViewTotal(productNo){
        let inputId = "total"+productNo;
        let targetInput = document.getElementById(inputId);
        targetInput.value = ++targetInput.value;
     }
     
     function increaseDBTotal(productNo){
          $.ajax({
             url: "/increaseTotal",
             type: "POST",
             dataType: "json",
             data: "productNo="+productNo,
             success: function(data){
             },
             error: function (request, status, error){
             }
            });
         increaseViewTotal(productNo);
          calcurateTotalPrice();
     }
     
     function decreaseViewTotal(productNo){
        let inputId = "total"+productNo;
        let targetInput = document.getElementById(inputId);
      targetInput.value = --targetInput.value;
        
     }
     
     function decreaseDBTotal(productNo){
        let inputId = "total"+productNo;
        let targetInput = document.getElementById(inputId);
        let targetValue = targetInput.value;
        if(targetValue == 1) return alert('개수가 1보다 작을 수 없습니다.');
          $.ajax({
             url: "/decreaseTotal",
             type: "POST",
             dataType: "json",
             data: "productNo="+productNo,
             success: function(data){
             },
             error: function (request, status, error){
             }
            });
         decreaseViewTotal(productNo);
          calcurateTotalPrice();
     }
     
     function modifyViewTotal(productNo, amount){
        let inputId = "total"+productNo;
        let targetInput = document.getElementById(inputId);
      targetInput.value = amount;
        
     }
     
     function modifyDBTotal(productNo, amount){
          $.ajax({
             url: "/modifyTotal",
             type: "POST",
             dataType: "json",
             data: {
                "productNo" : productNo, "amount" : amount
                },
             success: function(data){
             },
             error: function (request, status, error){
             }
            });
        modifyViewTotal(productNo, amount);
          calcurateTotalPrice();
     }

     </script>
     
   <script>
      window.onload = calcurateTotalPrice();
   </script>
</body>
</html>