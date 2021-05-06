<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/join3.css">
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

	<div id="banner">
	<%@include file="./banner.jsp"%>
	</div>
	<div class="wrapper">
	<div class="section">
		<div class="maincontent">
			<div class="content1"><h3>수르띠에 회원가입이 완료되었습니다</h3></div>
			<br>
			<br>
			<br>
			<div class="content2"><b>수르띠에 회원으로 가입해주셔서 감사합니다</b></div>
			
			<div class="login_main_btn">
				<div class="main_btn"><button onclick="location.href='./'">MAIN</button></div>
			</div>
			
		</div>
	</div>
	</div>
	<div class="footer">
         <%@include file="./footer.jsp"%>
      </div>


</body>
</html>