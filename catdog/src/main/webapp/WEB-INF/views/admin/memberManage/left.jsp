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
       <div class="list-group-item lefthead"><i></i>회원관리</div>
       <a href="${pageContext.request.contextPath}/admin/memberManage/analysis" class="list-group-item">회원분석</a>   
       <a href="${pageContext.request.contextPath}/admin/memberManage/list" class="list-group-item">회원목록</a>    
       <a href="${pageContext.request.contextPath}/admin/memberManage/blacklist" class="list-group-item">신고회원관리</a>   
       <a href="${pageContext.request.contextPath}/admin/memberManage/outlist" class="list-group-item">탈퇴회원관리</a>
</div>
