<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/banner.css" rel="stylesheet">
</head>
<body>

	<div id="wrapper"
		style="background-image: url('./resources/images/sea5.JPG'); height: 270px; width: 100%">
		<ad>
		<div>
			<a href="./"><img class="home" alt="" src="./images/home.png"></a>
			<p>후기 작성시 적립금 할인 EVENT!</p>
			<p></p>
		</div>
		</ad>
		<div id="login">
			<a href="./join">회원가입</a> &nbsp
			<%@include file="./login.jsp"%>
			<c:if test="${sessionScope.name ne null}">
				<a href="">마이페이지</a>  &nbsp
			</c:if>
			
		</div>
		<div class="header">
			<br> <br> <br> <br> <br>
		</div>
		<nav class="mainmenu">
			<ul>
				<li><a href="./product"><b>상품보기</b></a>
				<li><a href="./goodCombi"><b>꿀조합</b></a></li>
				<li><a href="./myRecipe"><b>마이 레시피</b></a>
					<ul>
						<li><a href="#">회원정보 수정</a></li>
						<li><a href="#"></a></li>
					</ul></li>
				<li><a><b>고객센터</b></a>
					<ul>
						<li><a href="noticeboard">공지게시판</a></li>
						<li><a href="qnaboard">문의게시판</a></li>
						<c:if test="${sessionScope.grade eq 9 }">
							<li><a href="adminpage">관리자게시판</a></li>
						</c:if>
					</ul></li>
			</ul>
		</nav>
	</div>

</body>
</html>