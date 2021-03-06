<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

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
				<c:if test="${empty sessionScope.member}">
					<a class="mybtn1" type="button" href="${pageContext.request.contextPath}/member/login">로그인</a>
					<a class="mybtn2" type="button" href="${pageContext.request.contextPath}/member/register">회원가입</a>
				</c:if>
				<c:if test="${not empty sessionScope.member}">
					<span style="color:blue;">${sessionScope.member.userNick}</span>님
		                &nbsp;|&nbsp;
		                <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
		                &nbsp;|&nbsp;
		                <a href="${pageContext.request.contextPath}/member/pwd">정보수정</a>
				</c:if>
			</div>
		</div>
	</div>
	<div id="mainMenu">
		<div class="menu">
			<ul class="menunav">
				<li class="menu1"><a href="${pageContext.request.contextPath}/store">HOME</a></li>
	            <li class="menu1"><a href="${pageContext.request.contextPath}/store/dog/main">강아지상품</a>
	            </li>
	            <li class="menu1"><a href="${pageContext.request.contextPath}/store/cat/main">고양이상품</a></li>
   	            <c:if test="${sessionScope.member.userType=='3'}">
	            	<li class="menu1"><a href="${pageContext.request.contextPath}/store/seller/main/product">판매자메뉴</a></li>
	         	</c:if>
	            <li class="menu2"><a href="${pageContext.request.contextPath}/commu">커뮤니티</a></li>

	         </ul>
		</div>
	</div>
</div>