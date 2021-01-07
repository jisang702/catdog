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
       <div class="list-group-item lefthead"><i></i> 판매관리 </div>
       <a href="${pageContext.request.contextPath}/store/seller/main/product" class="list-group-item">상품관리</a>
       <a href="${pageContext.request.contextPath}/store/seller/main/sales" class="list-group-item">판매현황</a>
       <a href="${pageContext.request.contextPath}/store/seller/main/qna" class="list-group-item">상품문의</a>
</div>
