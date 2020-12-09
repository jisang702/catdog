<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(function() {
	$('.faqA').hide();
	$('.faqQ').click(function() {
		$(this).next('.faqA').toggle(300);		
	});
});
</script>

<div class="body-container">     
     <div class="faqLayout">
     		<nav class="faqnav">
	     		<ul>
	     			<li>전체</li>
	     			<li>회원가입</li>
	     			<li>로그인/로그아웃</li>
	     			<li>포인트</li>
	     			<li>기타</li>
	     		</ul>
     		</nav>
     	<div class="faqlist">
     		<div class="faqQ">
	     		<ul>
	     			<li class="faqQA">[회원가입]</li>
	     			<li class="faqQA">Q</li>
	     			<li>질~~~~~~~~~~문</li>
	     		</ul>
     		</div>
     		<div class="faqA">
     			<ul>
     				<li class="faqQA">A</li>
     				<li>답변!!!!!!!!!!!!!</li>
     			</ul>
     		</div>
     	</div>
     	<div class="faqlist">
     		<div class="faqQ">
	     		<ul>
	     			<li class="faqQA">[기타]</li>
	     			<li class="faqQA">Q</li>
	     			<li>질~~~~~~~~~~문</li>
	     		</ul>
     		</div>
     		<div class="faqA">
     			<ul>
     				<li class="faqQA">A</li>
     				<li>답변!!!!!!!!!!!!!</li>
     			</ul>
     		</div>
     	</div>
     	<div class="faqfooter">
     		<p> 다른 질문이 있다면 ? </p>
     		<button type="button" class="mybtn2">1:1문의하기</button>
     	</div>
     </div>
</div>
