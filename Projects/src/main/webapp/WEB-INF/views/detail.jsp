<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
#write {
	margin: 0 auto;
	margin-top: 10px;
	height: auto;
	min-height:200px;
	width: 500px;
	background-color: #c0c0c0;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function update(no, title){
		if(confirm(title + " 글을 수정하시겠습니까?")){
			location.href='update?bno='+no;	
		}
	}
	function del(no, title){
		if(confirm(title + " 글을 삭제하시겠습니까?")){
			location.href='./delete?bno='+no;
		}
	}
	
</script>
</head>
<body>
	
	<div id="write">
		번호 : ${dto.board_no }<br>제목 : ${dto.board_title }
		<hr>
		글쓴이 : ${dto.member_name }
		 / 글쓴이 번호 : ${dto.member_no } (${dto.board_date })
		<%-- <c:if test="${sessionScope.no eq dto.member_no }"> --%>
			<button onclick="update(${dto.board_no }, '${dto.board_title }')">수정</button>
			<button onclick="del(${dto.board_no }, '${dto.board_title }')">삭제</button>
		<%-- </c:if> --%>
		<hr>
		${dto.board_content }<br>
		<%-- <c:if test="${dto.board_file ne null}">
			${dto.board_file }<br>
			<img alt="" src="./upload/${dto.board_file }">
		</c:if> --%>
	</div>
	
	
</body>
</html>