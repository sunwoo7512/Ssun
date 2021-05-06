<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/detail.css">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
   function update(no, title){
      if(confirm(title + " 글을 수정하시겠습니까?")){
         location.href='./update?bno='+no;   
      }
   }
   function del(no, title){
      if(confirm(title + " 글을 삭제하시겠습니까?")){
         location.href='./delete?bno='+no;
      }
   }
   
</script>
<body>
   <div class="detail_container">
   <div class="header"><h1>header</h1></div>
      <div id="recipe_detail">
         <div class="page-hearder" style="padding-bottom: 20px;">
            <h1>상세보기</h1>
         </div>
         <div>      
               <table class="table table-striped row">
                  <tr>
                     <th class="col-md-2">작성자</th>
                     <td>${dto.member_name}</td>
                  </tr>
                  <tr>
                     <th>제목</th>
                     <td>${dto.board_title}</td>
                  </tr>
                  <tr>
                     <th>사진</th>
                     <td><img class="img" alt="fileImg" src="./upload/${dto.board_file }"></td>
                  </tr>
                  <tr>
                     <th>내용</th>
                     <td>${dto.board_content }</td>
                  </tr>
               </table>
               <div class="detail_btn">
                     <c:if test="${sessionScope.no eq dto.member_no }">
                        <div class="update_btn"><button class="btn btn-primary" onclick="update(${dto.board_no }, '${dto.board_title }')">수정</button> </div>
                       <div class="delete_btn"><button class="btn btn-primary" onclick="del(${dto.board_no }, '${dto.board_title }')">삭제</button> </div><br><br>
                     </c:if>
              </div>
               <div class="page-hearder" style="padding-top: 15px;">
            		<h3>댓글리스트</h3>
        		 </div>
               <c:forEach items="${comment }" var="c">
               <div class="detail_comment">
               <hr>
               <div class="comment_writer" style="font-weight: bold; font-size: 20px;">${c.member_id }</div>
               <div class="comment_content">${c.comment_content }</div>
               <div class="comment_date">${c.comment_date }</div>
               <hr>
               </div>
               </c:forEach>
               <!--댓글쓰기  -->
               <c:if test="${sessionScope.name ne null && sessionScope.no ne null }">
               <div class="page-hearder" style="padding-bottom: 10px;">
            		<h3>댓글쓰기</h3>
            		<hr>
        		 </div>
               <div id="myRecipe_comment">
               		<form action="./comment" method="post">
               			<textarea class="form-control" name="comment" rows="3" id="comment" cols=""></textarea><br>
               			<button class="btn btn-primary" type="submit">댓글쓰기</button>
               			<input type="hidden" name="bno" id="bno" value="${dto.board_no }"> 
               		</form>
               </div>
               </c:if>
            
         </div>
      </div>
      <div class="footer">
         <%@include file="./footer.jsp"%>
      </div>
   </div>
</body>
</html>
