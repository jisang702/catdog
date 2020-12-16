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
		                <c:if test="${sessionScope.member.userId=='admin'}">
		                	&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}">관리자모드</a>
		                </c:if>
				</c:if>
			</div>
		</div>
	</div>
	<div id="mainMenu">
		<div class="menu">
			<ul class="menunav">
				<li class="menu1"><a href="${pageContext.request.contextPath}/commu/">HOME</a></li>
	            <li class="menu1"><a>커뮤니티</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/community/board/list">자유게시판</a></li>
	            		<li><a href="${pageContext.request.contextPath}/gallery/list">포토갤러리</a></li>
	            		<li><a href="#">실종게시판</a></li>
	            		<li><a href="#">중고거래</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a>수의사</a>
	            	<ul class="submenu1">
	            		<li><a href="">QnA</a></li>
	            		<li><a href="#">동영상</a></li>
	            		<li><a href="#">FAQ</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">이벤트</a></li>
	            <li class="menu1"><a>고객센터</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/customer/notice">공지사항</a></li>
	            		<li><a href="#">1:1 문의</a></li>
	            		<li><a href="${pageContext.request.contextPath}/faq/faq">FAQ</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="${pageContext.request.contextPath}/mypage/home">마이페이지</a></li>
	            <li class="menu2"><a href="${pageContext.request.contextPath}/store"><img src="${pageContext.request.contextPath}/resources/css/images/cart.png"></a></li>
	         </ul>
		</div>
	</div>
</div>
