<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#mainMenu .menu1 a").on("click", function () {
		  $("#mainMenu .menu1 a").css('color', 'inherit');
		  $("#mainMenu .menu1 a").parent().css('border-bottom', 'none');
		  $(this).css('color', '#71da65');
		  $(this).parent().css('border-bottom', '3px solid #71da65');
	});
});

$(function() {
	 var jbOffset = $('#mainMenu').offset();
     $(window).scroll(function() {
       if ($(document).scrollTop()>jbOffset.top) {
         $('#mainMenu').addClass('mainFixed');
       }
       else {
         $('#mainMenu').removeClass('mainFixed');
       }
     });
});
</script>
</head>
<body>

<div class="main-header">
	<div class="header">
		<div class="headerinner">
			<div class="logo">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg"></a>
				<a href="##"><img src="${pageContext.request.contextPath}/resources/css/images/cat.jpeg"></a>
			</div>
			<div class="myMenu">
				<a class="mybtn1" type="button" href="${pageContext.request.contextPath}/member/login">로그인</a>
				<button class="mybtn2" type="button">회원가입</button>
			</div>
		</div>
	</div>
	<div id="mainMenu">
		<div class="menu">
			<ul class="menunav">
				<li class="menu1"><a href="#">HOME</a></li>
	            <li class="menu1"><a href="#">커뮤니티</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/bbs/list">자유게시판</a></li>
	            		<li>포토갤러리</li>
	            		<li>실종게시판</li>
	            		<li>중고거래</li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">수의사</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/faq/faq">QnA</a></li>
	            		<li>동영상</li>
	            		<li>FAQ</li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">이벤트</a></li>
	            <li class="menu1"><a href="#">고객센터</a>
	            	<ul class="submenu1">
	            		<li>공지사항</li>
	            		<li>1:1 문의</li>
	            		<li>FAQ</li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></a></li>
	            <li class="menu2"><a><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a></li>
	         </ul>
		</div>
	</div>
</div>

</body>
</html>