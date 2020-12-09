<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainht.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#mainMenu .menu1 a").on("click", function () {
		  $("#mainMenu .menu1 a").css('color', 'inherit');
		  $("#mainMenu .menu1 a").parent().css('border-bottom', 'none');
		  $(this).css('color', '#ffc107');
		  $(this).parent().css('border-bottom', '3px solid #ffc107');
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
				<button class="mybtn1" type="button">로그인</button>
				<button class="mybtn2" type="button">회원가입</button>
			</div>
		</div>
	</div>
	<div id="mainMenu">
		<div class="menu">
			<ul class="menunav">
				<li class="menu1"><a href="#">HOME</a></li>
	            <li class="menu1"><a href="#">강아지상품</a>
	            </li>
	            <li class="menu1"><a href="#">고양이상품</a>
	            </li>
	            <li class="menu1"><a href="#">병원연계</a></li>
	            <li class="menu1"><a href="#">제휴문의</a>
	            </li>
	            <li class="menu1"><a href="#">장바구니</a></li>
	            <li class="menu2"><a><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
	         </ul>
		</div>
	</div>
</div>

</body>
</html>