<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(function() {
	
	$('.faqA').hide();
	$('.faqQ').click(function() {
		var faqQ = $(this).next(".faqA").is(":hidden");
		
		if(faqQ){
			$(".faqA").hide();
			$(this).next('.faqA').slideToggle("fast");	
		}else{
			$(this).next('.faqA').slideToggle("fast");
		}
				
	});
});

$(function(){
	
	$("body").on("click", ".category", function(){
		$(".category").removeClass("grabtn");
	    $(this).addClass("grabtn");
	
	});
});
</script>

<style type="text/css">

</style>

<div style="border-bottom: 1px solid #dadada; text-align: right;">

<nav class="faqnav">
	<ul>
		<li><button class="mybtn1 category" onclick="faqlist('0');">전체</button></li>
		<c:forEach var="vo" items="${listCategory}">
			<li><button class="mybtn1 category" onclick="faqlist('${vo.faqCateNum}');">${vo.faqCateName}</button></li>
		</c:forEach>
	</ul>
</nav>

</div>

<c:forEach var="dto" items="${list}">
<div class="faqlist">
	<div class="faqQ" >
		<ul>
			<li class="faqQA" >${dto.faqCateName}</li>
			<li class="faqQA">Q</li>
			<li>${dto.faqQuestion}</li>
		</ul>
	</div>
	<div class="faqA">
		<ul>
			<li class="faqQA">A</li>
			<li>${dto.faqAnswer}</li>
			<c:if test="${sessionScope.member.userType==0}">
				<li style="float: right">
					<button type="button" class="mybtn1" onclick="deleteBoard('${dto.faqNum}','${page}')">삭제</button>
					<button type="button" class="mybtn2" onclick="updateForm('${dto.faqNum}','${page}')">수정</button>
				</li>
			</c:if>
		</ul>
	</div>
</div>
</c:forEach>

<div class="faqfooter">
	<p>다른 질문이 있다면 ?</p>
	<p>&nbsp;</p>
	<button type="button" class="mybtn2" onclick="javascript:location.href='${pageContext.request.contextPath}/customer/qna'">1:1문의하기</button>
</div>

<div align="right">
	<c:if test="${sessionScope.member.userType==0}">
		<button type="button" class="mybtn2" onclick="insertForm();">글올리기</button>
	</c:if>
</div>

