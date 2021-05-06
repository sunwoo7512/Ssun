<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
   
   function update2(){      
      var title = document.getElementById('title').value;
      var content = document.getElementById('content').value;
      
      if (title == null || title == "" || title.length < 1) {
         alert("반드시 제목을 입력해야 합니다.");
         document.getElementById('title').focus();
         return false;
      }
      if (content == null || content == "" || content.length < 1) {
         alert("반드시 내용을 입력해야 합니다.");
         document.getElementById('content').focus();
         return false;
      }
      if (!confirm("수정하시겠습니까?")) {
         return false;
      }
   }
</script>
<body>
   <div class="update_container">
      <div class="col-md-7 col-md-offset-2">
         <div class="page-hearder" style="padding-bottom: 20px;">
            <h1>수정하기</h1>
         </div>
         <div>
            <form class="form-group" action="./update" method="post" onsubmit="return update2()" enctype="multipart/form-data">
                <input type="hidden" name="bno" id="bno" value="${dto.board_no }">   
               <table class="table table-striped row">
                  <tr>
                     <th class="col-md-2">작성자</th>
                     <td>${dto.member_name}</td>
                  </tr>
                  <tr>
                     <th>제목</th>
                     <td><input class="form-control" type="text" name="title" id="title"
                        value="${dto.board_title}"></td>
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
                        class="btn btn-primary" type="submit" value="수정"></td>
                  </tr>
               </table>
            </form>
         </div>
      </div>
   </div>
</body>
</html>
