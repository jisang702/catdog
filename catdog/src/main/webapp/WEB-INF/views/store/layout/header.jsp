<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<a class="mybtn1" type="button" href="${pageContext.request.contextPath}/member/login">로그인</a>
				<a class="mybtn2" type="button" href="${pageContext.request.contextPath}/member/register">회원가입</a>
			</div>
		</div>
	</div>
	<div id="mainMenu">
		<div class="menu">
			<ul class="menunav">
				<li class="menu1"><a href="${pageContext.request.contextPath}/store">HOME</a></li>
	            <li class="menu1"><a href="#">강아지상품</a>
	            </li>
	            <li class="menu1"><a href="#">고양이상품</a>
	            </li>
	            <li class="menu1"><a href="#">병원연계</a></li>
	            <li class="menu1"><a href="#">제휴문의</a>
	            </li>
	            <li class="menu1"><a href="#">장바구니</a></li>
	            <li class="menu2"><a href="${pageContext.request.contextPath}/commu">커뮤니티</a></li>
	         </ul>
		</div>
	</div>
</div>