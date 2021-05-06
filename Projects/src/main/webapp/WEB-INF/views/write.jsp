<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>글쓰기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/write.css">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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
<body>
   <div class="update_container">
   <div class="header"><h2>header</h2></div>
      <div id="recipe_write">
         <div class="page-hearder">
         <hr>
            <h1>수정하기</h1>
         </div>
         <div>
            <form class="form-group" action="./write1" method="post" onsubmit="return write1()" enctype="multipart/form-data">
                <input type="hidden" name="bno" id="bno" value="${dto.board_no }">   
               <table class="table table-striped row">
                  <tr>
                     <th>제목</th>
                     <td><input class="form-control" type="text" name="title" id="title"
                        placeholder="제목을 입력하세요.">${dto.board_title}</td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td><textarea class="form-control" name="content" rows="10" id="content" cols=""> ${dto.board_content} 
                        </textarea>
                     </td>
                  </tr>
                  <tr>
                     <th>파일첨부</th>
                     <td><input class="form-control" type="file" name="file" id="file" value="${dto.board_file}"></td>
                  </tr>
                  
                  <tr>
                     <td class="text-center" colspan="2"><input
                        class="btn btn-primary" type="submit" value="글쓰기"></td>
                  </tr>
               </table>
            </form>
         </div>
      </div>
      <div class="footer">
         <%@include file="./footer.jsp"%>
      </div>
   </div>
</body>
</html>
