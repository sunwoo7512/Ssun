<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="./css/Maininfo.css">
</head>
<body>
<div class="wrapper">
		<div class="main_recipe">
			<div class="main_recipe_header">
				<div class="header_WriteBtn">
					<button class="recipe_btn" onclick="location.href='./write'">글쓰기</button>
				</div>
				<div class="header_item">
				<c:if test="${board_no ne null }">
					<span class="header_count">xx개의 게시물이 있습니다.</span> 
					</c:if>
					<span class="header_latest">최신글</span> 
						<span class="division_line">│</span>
					<span class="header_like">인기글</span>
				</div>
			</div>
			<div class="recipe_section">
				<c:forEach items="${list }" var="list">
					<div class="recipe_cover">
						<a href="./detail?no=${list.board_no }">
							<div class="recipe">
								<div class="recipe_img">${list.board_file }</div>
								<div class="recipe_title">${list.board_title }</div>
								<div class="recipe_name_date">
									<img src="./images/user.png" alt="user"> <span
										class="font1">${list.member_name }</span> <img
										src="./images/calendar.png" alt="calendar"> <span
										class="font1">${list.board_date }</span>
								</div>
								<div class="recipe_like_hate">
										<img src="./images/like.png" alt="like"> 
										<span>${list.board_like }</span>
										<img src="./images/hate.png" alt="hate" style="width: 24px;">
										<span class="font" id="font_hate">${list.board_hate }</span>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
</body>
</html>