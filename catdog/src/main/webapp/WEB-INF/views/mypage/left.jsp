<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(! idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});

</script>

<div class="list-group">
       <div class="list-group-item lefthead"><i></i> 마이페이지</div>
       <a href="${pageContext.request.contextPath}/mypage/home" class="list-group-item">홈</a>
       <a href="${pageContext.request.contextPath}/mypage/mypet" class="list-group-item">My Pet</a>
       <a href="${pageContext.request.contextPath}/mypage/mypoint" class="list-group-item">포인트</a>
       <a href="#" class="list-group-item">주문내역</a>
       <a href="${pageContext.request.contextPath}/mypage/list" class="list-group-item">작성글</a>
       <a href="${pageContext.request.contextPath}/mypage/qna" class="list-group-item">1:1문의</a>
       <a href="#" class="list-group-item">정보수정</a>
    <c:if test="${sessionScope.member.userId!='admin' }">
	    <a href="${pageContext.request.contextPath}/member/pwd?dropout" class="list-group-item">회원탈퇴</a>
	</c:if>        
</div>
