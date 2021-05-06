<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_login</title>
<link href="./css/main_css.css" rel="stylesheet">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/login.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$(".loginBox").hide();
		$('.loginBox_open').click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		function wrapWindowByMask() {
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();

			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight
			});

			$('#mask').fadeTo("slow", 0.3);

			$('.loginBox').show();
		}

		$('.closeBox').click(function(e) {
			e.preventDefault();
			$('#mask, .loginBox').hide();
		});
		
		var userInputId = getCookie("userInputId");		
		$("#lid").val(userInputId);
		if($("#lid").val() != ""){
			$("#idSaveCheck").prop('checked', true);
		}
		$("#idSaveCheck").change(function (){
			if(     $("#idSaveCheck").is(":checked")     ){
				var userInputId = $("#id").val();
				setCookie("userInputId", userInputId, 7);
			} else {
				deleteCookie("userInputId");
			}
		});		
	});
	
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) 
			+ (    (exdays == null) ? "" : "; expires=" + exdate.toGMTString()  );
		document.cookie = cookieName + "=" + cookieValue;
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1){
				end = cookieData.length;
			}
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function check_log() {
		var id = $("#lid").val();
		var pw = $("#lpw").val();

		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#lid").focus();
			return false;
		}

		if (id.length < 4) {
			alert("아이디를 정확하게 입력하세요.");
			$("#lid").val("");
			$("#lid").focus();
			return false;
		}
		if (pw == "") {
			alert("비밀번호를 입력하세요");
			$("#lpw").focus();
			return false;
		}
		if (pw.length < 4) {
			alert("비밀번호를 정확하게 입력하세요");
			$("#lpw").val("");
			$("#lpw").focus();
			return false;
		}

	}
</script>



</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.name ne null }">
			${sessionScope.name }님 반갑습니다.
			<a href="./logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			<span class="loginBox_open">로그인해주세요</span>
		</c:otherwise>
		</c:choose>
	<div id="mask"></div>
	<div class="loginBox">
		<div class="closeBox">
			<img src="./images/close.png" class="close" alt="close" style="width: 24px;"/>
		</div>					
		<div class="wrapper">
			<div class="login_section">
				<div class="login_content">
					 <div class="logo">
						<img alt="logo" src="./images/substituted.png" style="width: 150px;">
					</div>	
					<h2>Login to continue!</h2>				
					<div class="login_form">
						<div class="login_info">
						<form action="./login" method="post" onsubmit="return login();">
							<input type="text" name="id" id="lid" placeholder="아이디"><br>
							<input type="password" name="pw" id="lpw" placeholder="비밀번호"><br>
							<input type="checkbox" id="idSaveCheck"> ID 저장하기<br>								
							<input type="submit" id="join_btn" name="login" onclick="check_log();" value="LogIn"/>
						</form>
							
						</div>
						<div id="formFooter">
							<h3 style="margin-bottom: 10px;">
								<b>계정이 없으신가요?</b>
							</h3>
							<div id="underline">
								<a class="underlineHover" href="./join">회원가입하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>