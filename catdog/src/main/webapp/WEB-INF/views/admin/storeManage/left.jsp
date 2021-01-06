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
       <div class="list-group-item lefthead"><i></i>스토어관리</div>
       <a href="${pageContext.request.contextPath}/admin/storeManage/analysis" class="list-group-item">스토어통계</a>
       <a href="${pageContext.request.contextPath}/admin/storeManage/listCategory" class="list-group-item">상품카테고리관리</a>       
       <a href="${pageContext.request.contextPath}/admin/storeManage/listProduct" class="list-group-item">상품통합관리</a>
</div>
