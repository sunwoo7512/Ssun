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
	
		<div class="productView_view">
			<h2>${pd.product_name}</h2>
			<div class="img" style="width: 40%;height: 90%;margin-top: 2.5%;">
				<img src="images/${pd.product_imgName}" style="width:100%; height:100%;" alt="">
			</div>
			<table>
	
				<colgroup>
					<col>
					<col>
				</colgroup>
				<tbody>
	
					<tr>
						<th>단위</th>
						<td>20kg</td>
					</tr>
	
					<tr>
						<th>판매가</th>
						<td><c:out value="${pd.product_price}"/></td>
					</tr>
	
					<tr>
						<th>어가명</th>
						<td>**젓갈</td>
					</tr>
	
					<tr>
						<th>원산지</th>
						<td>상품정보 참고</td>
					</tr>
	
	
					<th>구매수량</th>
					<td>
						<div class="length">
							<input type="number" id="total" min="0" value="1"> 
							<a href="#a">증가</a> 
							<a href="#a">감소</a>
						</div>
					<tr>
						<th>결제금액</th>
						<td class="total"><b>${pd.product_price}</b>원</td>
					</tr>
				</tbody>
	
	
				</tbody>
			</table>
			
	
			
			<div class="btns">
				<a href="javascript:callAddCart();" class="btn1">장바구니</a> 			
				<a href="#a" class="btn2">구매하기</a>
			</div>
		</div>
		<form id="addCart" action="addCart" method="get">
			<input type="hidden" name="product_no" value="${pd.product_no}">
			<input type="hidden" name="member_no" value="123">
			<input type="hidden" name="increase_total" value="0">
		</form>
		
		<script>
			function callAddCart(){
				let form = document.getElementById('addCart');
				form.increase_total.value = document.getElementById('total').value;
				form.submit();
				alert('success');
			}
		</script>
</body>
</html>