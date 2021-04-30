
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<link rel="stylesheet" href="./css/join.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function join() {
		var id = $("#id").val();
		var id_check = $("#id_check").val();
		var pw = $("#pw").val();
		var pw_check = $("#pw_check").val();
		var user_name = $("#user_name").val();
		var user_email = $("#user_email").val();
		var idck = 0;

		if (id == "" || id.length < 4) {
			alert('아이디를 4자이상 입력하세요.');
			$("#id").css('color', 'red');
			$("#id").css('border', '3px solid red');
			$("#id").val("");
			$("#id").focus();
			return false;

		} else if (pw == '' || pw.value.length < 4) {
			alert('비밀번호를 4자이상 입력하세요.');
			pw.focus();
			return false;
		} else if (pw != pw_check.value) {
			alert("패스워드가 일치하지 않습니다.");
			pw_check.focus();
			return false;
		} else if (name == '' || name.value.length < 1) {
			alert("이름을 올바르게 입력해주세요.");
			name.focus();
			return false;
		} else if (email == '') {
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
		
		
	}

	var idck = 0;
	function idCheck() {
		var id = $("#id").val();
		
		
		$.ajax({
			//async : true,
			type : "POST",
			//data : 'id='+id,
			url : "./idcheck?id="+id,
			dataType : "json",
			contentType : "aplication/json; charset UTF-8",
			success : function(data) {
				if (id == 0 && id =="") {
					alert("중복되는 아이디 입니다.");
					if ($("#correctID").is(":visible")) {
						$("#correctID").css('display', 'none');
					}
					$("#wrongID").css('display', 'block');
					$("#wrongID").css('color', 'red');
					$("#id").val(""); // 화면 css 를 바꿈 
					$("#id_check").val("");
					$("#id").css('border', '3px solid red');
					$("#id").focus();
				} else {
					alert("사용가능한 아이디입니다");
					if ($("#wrongID").is(":visible")) {
						$("#wrongID").css('display', 'none');
					}
					$("#correctID").css('display', 'block');
					$("#correctID").css('color', '#0466e1');
					$("#id").css('border', '3px solid #0466e1'); 
				}
			},
			error : function(error) {
				alert("error:" + error);
			}
		});
	
	return false;
	
		
	}

	
		
	

	function checkpassword2() {
		var pw = $("#pw").val();
		var pw_check = $("#pw_check").val();

		if (pw != pw_check) {
			if ($("#correctPW").is(":visible")) {
				$("#correctPW").css('display', 'none');
			}

			$("#wrongPW").css('display', 'block');
			$("#wrongPW").css('color', 'red');
			$("#pw").val(""); // 화면 css 를 바꿈 
			$("#pw_check").val("");
			$("#pw").css('border', '3px solid red'); // 화면 css 를 바 
			$("#pw_check").css('border', '3px solid red');
			$("#pw_check").focus();

		} else {
			/* alert("두 비밀번호가 같습니다."); */

			if ($("#wrongPW").is(":visible")) {
				$("#wrongPW").css('display', 'none');
			}
			$("#correctPW").css('display', 'block');
			$("#correctPW").css('color', '#0466e1');
			$("#pw").css('border', '3px solid #0466e1'); // 화면 css 를 바꿈 
			$("#pw_check").css('border', '3px solid #0466e1');
		}
	}

	function checkpassword1() {
		var pw = $("#pw").val();
		var pw_check = $("#pw_check").val();

		if (pw_check != "") {
			if ($("#correctPW").is(":visible")) {
				$("#correctPW").css('display', 'none');
			}
			$("#wrongPW").css('display', 'block');
			$("#wrongPW").css('color', 'red');
			$("#pw").val(""); // 화면 css 를 바꿈 
			$("#pw_check").val("");
			$("#pw").css('border', '3px solid red'); // 화면 css 를 바 
			$("#pw_check").css('border', '3px solid red');
		}
	}
</script>
</head>

<body>
	<div class="wrapper">
		<div class="header">
			<h1>header</h1>
		</div>
		<div class="section" style="background-color: skyblue;">
			<form class="form-horizontal" action="./join" method="post" onsubmit="return join()">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="id" name="user_id"
							placeholder="아이디">
						<button class="btn btn-default" id="id_check" onclick="return idCheck();">중복확인</button>
					</div>
					
				<div id="wrongID" style="display: none;">아이디가 중복됩니다. 다시
					입력해주세요.</div>
				<div id="correctID" style="display: none;">사용가능한 아이디 입니다.</div> 
				
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pw" name="user_pw"
							placeholder=".비밀번호" onchange="checkpassword1()">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">비밀번호
						확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pw_check"
							name="user_pwcheck" placeholder=".비밀번호 확인"
							onchange="checkpassword2()">
					</div>
				</div>
				<!-- 비밀번호 체크 -->
				<div id="wrongPW" style="display: none;">비밀번호가 일치하지 않습니다. 다시
					입력해주세요.</div>
				<div id="correctPW" style="display: none;">비밀번호가 일치합니다.</div>
				
				<div class="form-group">
					<label for="inputText3" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="user_name"
							name="user_name" placeholder="이름">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="user_email"
							name="user_email" placeholder="이메일">
					</div>
				</div>
				<input type="text" id="sample3_postcode" name="user_addr1"
					placeholder="우편번호"> <input type="button"
					onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample3_address" placeholder="주소"><br>
				<input type="text" id="sample3_detailAddress" name="user_addr2"
					placeholder="상세주소"> <input type="text"
					id="sample3_extraAddress" name="user_addr3" placeholder="참고항목">

				<div id="wrap"
					style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>

				<script
					src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					// 우편번호 찾기 찾기 화면을 넣을 element
					var element_wrap = document.getElementById('wrap');

					function foldDaumPostcode() {
						// iframe을 넣은 element를 안보이게 한다.
						element_wrap.style.display = 'none';
					}

					function sample3_execDaumPostcode() {
						// 현재 scroll 위치를 저장해놓는다.
						var currentScroll = Math.max(document.body.scrollTop,
								document.documentElement.scrollTop);
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = ' (' + extraAddr
														+ ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document
													.getElementById("sample3_extraAddress").value = extraAddr;

										} else {
											document
													.getElementById("sample3_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample3_postcode').value = data.zonecode;
										document
												.getElementById("sample3_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById(
												"sample3_detailAddress")
												.focus();

										// iframe을 넣은 element를 안보이게 한다.
										// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
										element_wrap.style.display = 'none';

										// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
										document.body.scrollTop = currentScroll;
									},
									// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
									onresize : function(size) {
										element_wrap.style.height = size.height
												+ 'px';
									},
									width : '100%',
									height : '100%'
								}).embed(element_wrap);

						// iframe을 넣은 element를 보이게 한다.
						element_wrap.style.display = 'block';
					}
				</script>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default" name="sign_btn" id="sign_btn">가입하기</button>
					</div>
				</div>
			</form>
		</div>


		<div class="footer">
			<h1>footer</h1>
		</div>
	</div>


</body>
</html>