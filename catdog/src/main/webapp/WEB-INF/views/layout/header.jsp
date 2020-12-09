<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<li class="menu1"><a href="${pageContext.request.contextPath}/commu/">HOME</a></li>
	            <li class="menu1"><a href="#">커뮤니티</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/bbs/list">자유게시판</a></li>
	            		<li><a href="#">포토갤러리</a></li>
	            		<li><a href="#">실종게시판</a></li>
	            		<li><a href="#">중고거래</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">수의사</a>
	            	<ul class="submenu1">
	            		<li><a href="${pageContext.request.contextPath}/faq/faq">QnA</a></li>
	            		<li><a href="#">동영상</a></li>
	            		<li><a href="#">FAQ</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">이벤트</a></li>
	            <li class="menu1"><a href="#">고객센터</a>
	            	<ul class="submenu1">
	            		<li><a href="#">공지사항</a></li>
	            		<li><a href="#">1:1 문의</a></li>
	            		<li><a href="#">FAQ</a></li>
	            	</ul>
	            </li>
	            <li class="menu1"><a href="#">조회?</a></li>
	            <li class="menu2"><a href="${pageContext.request.contextPath}/store">SHOP</a></li>
	         </ul>
		</div>
	</div>
</div>
