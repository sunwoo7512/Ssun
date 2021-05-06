<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		alert("다시 로그인 해주세요.");
		wrapWindowByMask();
		//$(".loginBox").hide();
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

			$('#mask').fadeTo("fast", 0.3);

			$('.loginBox').show();
		}

		$('.closeBox').click(function(e) {
			e.preventDefault();
			$('#mask, .loginBox').hide();
		});
		
		var userInputId = getCookie("userInputId");		
		$("#id").val(userInputId);
		if($("#id").val() != ""){
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
		var id = $("#id").val();
		var pw = $("#pw").val();

		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}

		if (id.length < 4) {
			alert("아이디를 정확하게 입력하세요.");
			$("#id").val("");
			$("#id").focus();
			return false;
		}
		if (pw == "") {
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;
		}
		if (pw.length < 4) {
			alert("비밀번호를 정확하게 입력하세요");
			$("#pw").val("");
			$("#pw").focus();
			return false;
		}

	}
</script>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;

.loginBox {
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%;
	height: 550px;
	top: 50%;
	margin-top: -275px;
	overflow: auto;
	background-color: #F0ECEC;
	padding: 1em;
	box-sizing: border-box;
	z-index: 2;
	border-radius: 10px 10px 10px 10px;
	overflow-y: hidden;
	overflow-x: hidden;
}

#mask {
	position: absolute;
	z-index: 1;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.closeBox {
	width: 10%;
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 3;
}

.logo {
	width: 90%;
	margin-left: 30%;
}

.wrapper {
	width: 100%;
	height: 100%;
	padding-top: 5%;
}

.login_form {
	width: 70%;
	height: 90%;
	margin: 0 auto;
	margin-left: 55px;
	border: none;
	margin-top: 5px;
	text-align: center;
}

.login_info {
	width: 90%;
	height: 65%;
	border-bottom: 1px solid #c8c9ca; 
	margin-right : 60px; 
	margin-bottom: 50px;
	padding-top: 20px;
	margin-right: 60px;
}

.formFooter {
	width: 90%;
	height: 30%;
	margin: 0 auto;
	text-align: center;
}

#id, #pw {
	background-color: #eeeeee;
	color: #0d0d0d;
	width: 90%;
	height: 9%;
	padding: 10px 20px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-bottom: 10px;
	border: 2px solid #f6f6f6;
	border-radius: 5px 5px 5px 5px;
}

#id:placeholder {
	color: #c5cad3;
}

#join_btn:hover {
	background-color: #0359c2;
	font-weight: bold;
}

#join_btn:active {
	transform: scale(0.9);
}

#join_btn {
	width: 250px;
	background-color: #0466e1;
	border: none;
	color: white;
	padding: 10px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13pt;
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	border-radius: 5px 5px 5px 5px;
	margin-top: 30px;
	cursor: hand;
}


#id:focus, #pw:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

.underlineHover {
	text-decoration: none;
	color: blue;
	font-weight: bolder;
}

.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #56baed;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	color: black;
	font-weight: bolder;
	text-decoration: none;
}

.underlineHover:hover:after {
	width: 100%;
}

h2{
	text-align: center;
	margin-top: 5px;
	margin: 0;
}
</style>


</head>
<body>
	<button type="button" class="loginBox_open">login</button>
	<div id="mask">메인페이지 전체 이쪽으로</div>
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
							<input type="text" name="id" id="id" placeholder="아이디"><br>
							<input type="password" name="pw" id="pw" placeholder="비밀번호"><br>
							<input type="checkbox" id="idSaveCheck"> ID 저장하기<br>								
							<input type="submit" id="join_btn" name="login" onclick="check_log();" value="LogIn"/>
						</form>
							
						</div>
						<div id="formFooter">
							<h3 style="margin-bottom: 10px;">
								<b>계정이 없으신가요?</b>
							</h3>
							<div id="underline">
								<a class="underlineHover" href="./join1">회원가입하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>