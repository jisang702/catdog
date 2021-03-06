﻿<%@ page contentType="text/html; charset=UTF-8"%>
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
				<a href="${pageContext.request.contextPath}/commu/"><img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg"></a>
				<a href="${pageContext.request.contextPath}/commu/"><img src="${pageContext.request.contextPath}/resources/css/images/cat.jpeg"></a>
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
		                	&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/admin/main">관리자모드</a>
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
	            		<li><a href="${pageContext.request.contextPath}/community/photo/list">포토갤러리</a></li>
	            		<li><a href="${pageContext.request.contextPath}/community/miss/list">찾아주세요</a></li>
	            		<li><a href="${pageContext.request.contextPath}/community/deal/list">중고장터</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a>PetCare</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/doctor/news/list">새소식</a></li>
	            		<li><a href="${pageContext.request.contextPath}/doctor/video/list">동영상</a></li>
	            		<li><a href="${pageContext.request.contextPath}/doctor/faq/list">FAQ</a></li>
	            		<li><a href="${pageContext.request.contextPath}/doctor/qna/list">QnA</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">이벤트</a></li>
	            <li class="menu1"><a href="${pageContext.request.contextPath}/customer/notice">고객센터</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/customer/notice">공지사항</a></li>
	            		<li><a href="${pageContext.request.contextPath}/customer/qna">QnA</a></li>
	            		<li><a href="${pageContext.request.contextPath}/customer/faq">FAQ</a></li>
	            	</ul>
	            </li>
	             <c:if test="${ not empty sessionScope.member && sessionScope.member.userId!='admin'}">
	            	<li class="menu1"><a href="${pageContext.request.contextPath}/mypage/home">마이페이지</a></li>
	            </c:if>
	            <c:if test="${ empty sessionScope.member && sessionScope.member.userId=='admin'}">
	            	<li class="menu1"><a href="#">&emsp;</a></li>
	            </c:if>
	            <li class="menu2"><a href="${pageContext.request.contextPath}/store"><img src="${pageContext.request.contextPath}/resources/css/images/cart.png"></a></li>
	         </ul>
		</div>
	</div>
</div>
