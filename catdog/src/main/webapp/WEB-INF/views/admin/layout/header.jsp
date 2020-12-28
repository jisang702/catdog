<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
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
				<span style="color: blue;">${sessionScope.member.userNick}</span>님
				&nbsp;|&nbsp; 
				<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
				&nbsp;|&nbsp; 
				<a href="${pageContext.request.contextPath}/member/pwd">정보수정</a>
		        &nbsp;|&nbsp;
		        <a href="${pageContext.request.contextPath}/commu">메인으로</a>
			</div>
    	</div>
	</div>

	<div id="mainMenu">
		<div class="menu">
		    <ul class="menunav">
		        <li class="menu1"><a href="${pageContext.request.contextPath}/admin">HOME</a></li>
		        <li class="menu1"><a href="${pageContext.request.contextPath}/admin/memberManage/list">회원관리</a></li>
		        <li class="menu1"><a href="#">커뮤니티관리</a></li>
		        <li class="menu1"><a href="#">스토어관리</a></li>
		        <li class="menu1"><a href="#">고객센터관리</a></li>
				<li class="menu1"><a href="#">&nbsp;</a></li>
				<li class="menu2"><a href="#">&nbsp;</a></li>
		    </ul>      
	    </div>
	</div>
</div>