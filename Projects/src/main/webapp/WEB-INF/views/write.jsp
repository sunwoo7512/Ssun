<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	function write1(){
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		if(title == null || title == ""){
			alert("제목을 입력하세요.");
			document.getElementById('title').focus();
			return false;
		}
		if(content == null || content == ""){
			alert("내용을 입력하세요.");
			document.getElementById('content').focus();
			return false;
		}
		if(!confirm(title.substring(0, 10) +
				" \n(으)로저장하시겠습니까?")){
			return false;
		}
	}
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
#write{
	margin: 0 auto;
	margin-top:10px;
	height: 500px;
	width:  500px;
	background-color: blue;
}
#write input, #write textarea, #write button{
	margin:0;
	padding:0;
	width: calc(100% - 10px);
	margin: 5px;
	height: 30px;
	box-sizing: content-box;
}
#write textarea{
	height: 350px;
}
</style>
</head>
<body>
			<div id="write">
				<form action="./write" method="post" onsubmit="return write1()" enctype="multipart/form-data">
					<input type="text" name="title" id="title" placeholder="제목을 입력하세요">
					<textarea name="content" id="content"></textarea>
					<input type="file" name="file" id="file">
					<button type="submit">글쓰기</button>
				</form>
			</div>

</body>
</html>