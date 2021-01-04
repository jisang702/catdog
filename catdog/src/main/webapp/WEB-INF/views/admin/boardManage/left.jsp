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
       <div class="list-group-item lefthead"><i></i>게시판관리</div>
       <a href="${pageContext.request.contextPath}/admin/boardManage/analysis" class="list-group-item">게시판통계</a>
       <a href="${pageContext.request.contextPath}/admin" class="list-group-item">게시판관리</a>
       <a href="${pageContext.request.contextPath}/admin/boardManage/listArticle" class="list-group-item">게시물통합관리</a>       
       <a href="${pageContext.request.contextPath}/admin/boardManage/listReply" class="list-group-item">댓글통합관리</a>
       <a href="${pageContext.request.contextPath}/admin/boardManage/listReplyReport" class="list-group-item">신고댓글관리</a>       
</div>
