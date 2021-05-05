<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>

<link rel="stylesheet" href="./css/NewFile.css">
</head>

<body>
	<h2>장바구니</h2>
	<table id="cartTable">
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="selectAll" onclick="javascript:checkAllbox();")></th>
				<th>사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>개수</th>
			</tr>
		</thead>
		<tbody>
			<!-- Controller에서  전달받은 ArrayList<HashMap<String, Object>> cartList에서  
			상품 Map을 꺼내서 그려줌 -->
			<c:forEach items="${cartList}" var="cart">
				<tr>
					<td style="text-align:center;"><input type="checkbox" name="select" id="${cart.product_no}"></td>
					<td style="text-align:center;"><img src="images/${cart.product_imgName}" style="width: 100%; height: 100%;" alt=""></td>
					<td style="text-align:center;"><span class="product_name"><c:out value="${cart.product_name}" /></span></td>
					<td style="text-align:center;"><span class="product_price"><c:out value="${cart.product_price}" /></span></td>
					<td style="text-align:center;"><input type="number" value="<c:out value="${cart.cart_total}" />" name="cart_total" id="total${cart.product_no}" min="1" onchange="javascript:modifyDBTotal(${cart.product_no}, this.value);"><a href="javascript:;" onclick="javascript:increaseDBTotal(${cart.product_no});" >up</a><a href="javascript:;" onclick="decreaseDBTotal(${cart.product_no});" >down</a></td>
				</tr>
			</c:forEach>
			<!-- // -->
			<!-- 하단 script문으로부터 총 금액 가져와서 받는 부분, id="total_price"-->
				<tr>
					<td>총 금액</td>
					<td rowspan="4"><input type="text" value="" id="total_price"></td>
				</tr>
			<!-- // -->
		</tbody>
	</table>
			<!-- 추가될 수 있는 선택 삭제, 구매하기, 전체 삭제 기능 구현할 부분 -->
	<div class="btns">
		<a href="javascript:;" onclick="deleteSelected();" class="btn1">선택삭제</a> 
		<a href="javascript:;" class="btn2">전체삭제</a> 
		<a href="javascript:;" class="btn2">구매하기</a>
	</div>
			<!-- // -->

			<!-- window.onload -> 화면이 모두 그려지면(html이 불러와지면) 이 스크립트가 실행됨 -->
			<!-- c:forEach로 상품리스트가 모두 만들어진 다음 이 스크립트가 실행되도록 설계 -->
	<script src="https://code.jquery.com/jquery-3.2.1.js"
  			integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  			crossorigin="anonymous"></script>
  	<script src="/js/cart.js"></script>
  	
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
  		if(targetValue == 1) return alert('개수가 1 이하로 작아질 수 없습니다.');
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