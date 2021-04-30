<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
	 
    $('.login_btn>a').on('click', function(){
        $('.menu_bg').show(); 
        $('.loginbox_menu').show().animate({
            right:0
        });  
    });
    $('.close_btn>a').on('click', function(){
        $('.menu_bg').hide(); 
        $('.loginbox_menu').animate({
            right: '-' + 50 + '%'
                   },function(){
	$('.loginboxr_menu').hide(); 
	}); 
    });

});

</script>
<style type="text/css">

	 body, html{
	 width:100%;
	 height: 100%;
	 overflow-x: hidden;
	 }
    .loginbox_btn{
        text-align: right;
        padding: 10px;
    }
    .loginbox_bg{
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.7);
        position: absolute;
        top:0;
        display: none;
    }
    .loginbox_menu{
 		display: none;
        width: 50%;
        height: 100%;
        background: #e98282;
        position: absolute;
        top:0;
        right: -50%;
        
    }
    .close_btn{
        width: 25px;
        height: 25px;
        margin:10px;
    }
    .close_btn > a{
        display: block;
        width: 100%;
        height: 100%;
    }
    .loginbox_wrap{
        list-style: none;
        padding: 20px 20px;   
    }
    .loginbox_wrap li a{
        color: #fff;
        text-decoration: none;
    }
</style>

</head>
<body>


	<div>

			<div class="login_btn">
				<a href="#"></a>				
			</div>
		
			
			<div class="loginbox_bg"></div>
				<div class="loginbox_menu">
					<div class="close_btn">
					<a href="#"><img src=""></a>
					</div>
				<ul class="loginbox_wrap">
					<li><a href="#">메뉴1</a></li>
					<li><a href="#">메뉴2</a></li>
					<li><a href="#">메뉴3</a></li>
					<li><a href="#">메뉴4</a></li>
					<li><a href="#">메뉴5</a></li>
					<li><a href="#">메뉴6</a></li>
				</ul>
				</div>
			
			
		
	
	</div>
	

</body>
</html>