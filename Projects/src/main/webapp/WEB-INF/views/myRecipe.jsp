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
					<form action="./myRecipe" method="get">
						<table>
							<tr>
								<td><select name="key" class="custom-select"
									id="inputGroupSelect01">
										<option selected="selected" value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
								</select></td>
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

					<div class="header_item">
						<span class="header_count"
							style="font-size: 22px; font-weight: bold;">${fn:length(list)}개의
							게시물이 있습니다.</span> <span class="header_latest"><a
							href="./myRecipe?cate=new">최신글</a></span> <span class="division_line">│</span>
						<span class="header_like"><a href="./myRecipe?cate=popular">인기글</a></span>
					</div>
				</div>
				<div class="recipe_section">
					<c:forEach items="${list }" var="list">
						<div class="recipe_cover">
							<a href="./detail?bno=${list.board_no }">
								<div class="recipe">
									<div class="recipe_img">
										<img alt="fileImg" src="./upload/${list.board_file }">
									</div>
									<div class="recipe_title">제목:${list.board_title }</div>
									<div class="recipe_user_date">
										<div class="recipe_user">
											<img src="./images/user.png" alt="user"> <span
												class="font1">${list.member_name }</span>
										</div>
										<div class="recipe_date">
											<img src="./images/calendar.png" alt="calendar"> <span
												class="font1">${list.board_date }</span>
										</div>
									</div>
									<div class="recipe_like_hate_views">
										<div class="recipe_like">
											<img src="./images/good.png" alt="like"> <span
												class="font" id="font_like">${list.board_like_cnt }</span>
										</div>
										<div class="recipe_hate">
											<img src="./images/bad.png" alt="hate"> <span
												class="font" id="font_hate">${list.board_hate_cnt }</span>
										</div>
										<div class="recipe_views">
											<img src="./images/views.png" alt="views"> <span
												class="font" id="font_views">${list.board_views }</span>
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