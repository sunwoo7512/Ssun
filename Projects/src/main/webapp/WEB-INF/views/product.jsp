<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>상품목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/shop/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/shop/animate.css">
    
    <link rel="stylesheet" href="css/shop/owl.carousel.min.css">
    <link rel="stylesheet" href="css/shop/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/shop/magnific-popup.css">

    <link rel="stylesheet" href="css/shop/aos.css">
 	<link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/shop/ionicons.min.css">

    <link rel="stylesheet" href="css/shop/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/shop/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/shop/flaticon.css">
    <link rel="stylesheet" href="css/shop/icomoon.css">
    <link rel="stylesheet" href="css/shop/style.css">
  </head>
  <body class="goto-here">
    
    <!-- END nav -->

    <section class="ftco-section bg-light">
       <div class="container">
          <div class="row">
          <div class="search_box">
               <form action="./product" method="get">
                  <table>
                  <tr>
                    <td> <select name="key" class="custom-select" id="inputGroupSelect01">
                        <option selected="selected" value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                     </select> </td>
                    <td> <input type="search" placeholder="Search" name="search" id="search"></td>
                    <td> <button type="submit" class="btn btn-primary" id="search_btn">검색</button></td>
                 </tr>
                 </table>
               </form>
            </div>
             <div class="">
          <div class="col-md-8 col-lg-10 order-md-last">
                <div class="row">
                   <c:forEach items="${list}" var="list">      
                      <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex" style="margin-bottom: 2%;">
                         <div class="product d-flex flex-column">
                            <a href="./NewFile?no=${list.product_no }" class="img-prod" style="height: 100%;">
                               <img class="img-fluid" src="images/${list.product_imgName}" style="height: 250px;" alt="Colorlib Template">
                               <div class="overlay">
                               </div>
                            </a>
                            <div class="text py-3 pb-4 px-3">
                               <div class="d-flex">
                                  <div class="cat">
                                     <span>Lifestyle</span>
                                  </div>
                               </div>
                               <h3><a href="./NewFile?no=${list.product_no }">${list.product_name }</a></h3>
                               <div class="pricing">
                                  <p class="price"><span>${list.product_price}원</span></p>
                               </div>
                               <p class="bottom-area d-flex px-3">
                                  <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                  <a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                               </p>
                            </div>
                         </div>
                      </div>
                   </c:forEach>
                </div>
                <div class="row mt-5" style="justify-content:center;">
                <div id="paging"><%@include file="paging.jsp"%>
                  <c:if test="${page lt 10 }">
                     <button disabled="disabled">이전</button>
                  </c:if>
                  <c:if test="${page gt 10 }">
                     <button onclick="location.href='product?page=${page-10 }'">이전</button>
                  </c:if>
                  <c:if test="${page eq 1 }">
                     <button disabled="disabled">◀</button>
                  </c:if>
                  <c:if test="${page gt 1 }">
                     <button onclick="location.href='product?page=${page-1 }'">◀</button>
                  </c:if>
                  <c:forEach var="i" begin="${startPage }" end="${endPage }">
                     <c:if test="${i eq page }">
                        <button style="background-color: #F5A100;">
                           <b>${i }</b>
                        </button>
                     </c:if>
                     <c:if test="${i ne page }">
                        <button onclick="location.href='product?page=${i }'">${i }</button>
                     </c:if>
                  </c:forEach>
                  <c:if test="${page lt totalPage }">
                     <button onclick="location.href='product?page=${page+1 }'">▶</button>
                  </c:if>
                  <c:if test="${page eq totalPage }">
                     <button disabled="disabled">▶</button>
                  </c:if>
                  <c:if test="${page lt totalPage-9 }">
                     <button onclick="location.href='product?page=${page+10 }'">다음</button>
                  </c:if>
                  <c:if test="${page gt totalPage-9 }">
                     <button disabled="disabled">다음</button>
                  </c:if>
               </div>
              </div>
             </div>


          </div>
       </div>
    </section>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>