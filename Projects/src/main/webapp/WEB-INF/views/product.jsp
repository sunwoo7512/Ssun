<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나만의 레시피</title>
<link rel="stylesheet" href="./css/myRecipe.css">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/banner.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
	<div id="banner">
		<%@include file="./banner.jsp"%>
	</div>
	<div class="wrapper">
		<div class="main_recipe">
			<!--검색기능  -->
		
				<div class="search_box">
					<form action="./product" method="get">
						<table>
							<tr>
								<td><input type="search" placeholder="Search" name="search"
									id="search"></td>
								<td>
									<button type="submit" class="btn btn-primary" id="search_btn">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="main_recipe_header">
			</div>
				<div class="recipe_section">
					<c:forEach items="${list }" var="list">
						<div class="recipe_cover">
							<a href="./p_detail?pno=${list.product_no }">
								<div class="recipe">
									<div class="recipe_img">
										<img alt="fileImg" src="./upload/${list.product_imgName }">
									</div>
									<div class="recipe_title">상품명:${list.product_name }</div>
									<div class="recipe_user_date">
										
										<div class="recipe_date">
											값: ${list.product_price }원
										</div>
									</div>
									
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
					
		</div>
		<div class="btn_page">
						<div class="header_WriteBtn">
							<c:if test="${sessionScope.no ne null }">
								<button class="btn btn-primary" id="recipe_btn"
									onclick="location.href='./write'">글쓰기</button>
							</c:if>
						</div>
						<div class="paging_box">
							<ul id="paging" class="pagination"><%@include
									file="paging.jsp"%>
								<c:if test="${page lt 10 }">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								</c:if>
								<c:if test="${page gt 10 }">
									<li class="page-item"><a class="page-link"
										href="myRecipe?page=${page-10 }">Previous</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i eq page }">
										<li class="page-item"><a class="page-link" href="#"
											style="background: #99FFFF;">${i }</a></li>
									</c:if>
									<c:if test="${i ne page }">
										<li class="page-item"><a class="page-link"
											href="myRecipe?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${page lt totalPage-9 }">
									<li class="page-item"><a class="page-link"
										href="myRecipe?page=${page+10 }">Next</a></li>
								</c:if>
								<c:if test="${page gt totalPage-9 }">
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
								</c:if>
							</ul>
						</div>
						</div>
		<div class="footer">
			<%@include file="./footer.jsp"%>
		</div>
	</div>
</body>
</html>