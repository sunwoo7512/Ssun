<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<title>강남 노량진</title>
<link href="./css/main_css.css" rel="stylesheet">
<link rel="stylesheet" href="./css/common.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			slideWidth : 1900,//$(window).width(),
			adaptiveHeight : false,
			auto : true,
			speed : 500,
			pause : 5000,
			mode : 'horizontal',
			autoControls : true,
			pager : true,
			captions : true
		});
	});
</script>

</head>
<body>

	<div id="banner">
		<%@include file="./banner.jsp"%>
	</div>
	<div id="slide">
		<ul class="bxslider">
			<li><img src="./resources/images/슬라이드1.jpg" alt="슬라이드3"></li>
			<li><img src="./resources/images/슬라이드2.jpg" alt="슬라이드3"></li>
			<li><img src="./resources/images/슬라이드3.jpg" alt="슬라이드3"></li>
			<li><img src="./resources/images/슬라이드4.jpg" alt="슬라이드3"></li>
			<li><img src="./resources/images/슬라이드5.jpg" alt="슬라이드3"></li>
		</ul>
	</div>
	<div id="best">
		<h2 style="text-align: center;">추천 상품</h2>
	</div>
	<br>
	<br>
	<div id="month">

		<a href="#"><img src="./resources/images/soosan1.png"></a>
	</div>
	<br>
	<br>
	<h2 style="text-align: center;">강남 노량진만의 특별한 이벤트!</h2>
	<div id="event">
		<a href="#"><img src="./resources/images/event1.JPG"></a> <a
			href="#"><img src="./resources/images/event2.JPG"></a> <a
			href="#"><img src="./resources/images/event3.JPG"></a>
	</div>
	<div class="footer">
		<%@include file="./footer.jsp"%>
	</div>


</body>
</html>