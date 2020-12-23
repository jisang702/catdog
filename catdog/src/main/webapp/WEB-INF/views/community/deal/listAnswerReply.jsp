<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="dto" items="${listAnswerReply}">
<div class="answerReplylist">
	<c:choose>
			<c:when test="${dto.dealReplySecret==1 && sessionScope.member.userId!=dto.userId 
								&& sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.writeUser}">	<div style="padding: 10px 0px 10px 5px">
					<i class="fas fa-lock"></i> 비밀댓글입니다.
				</div>
			</c:when>
			<c:otherwise>
	<div class="profile">
	<ul>
		<li><p><i class="fas fa-angle-double-right"></i> ${dto.userNick}</p></li>
		<li>${dto.dealReplyCreated}</li>
		<li>&nbsp;
			<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				 
				<button type="button" class="mybtn1 deleteAnswerReply"  data-replyNum="${dto.dealReplyNum}" data-replyType="${dto.dealReplyType}">삭제</button>
			</c:if>
		</li>
	</ul>
	</div>
	<div style="display: flex; justify-content: space-between;">
		<div class="commentwrap">
			<ul>
				<li style="max-width: 700px;">${dto.dealReplyContent}</li>
			</ul>
		</div>
		<div class="commentbtn">
			<button type="button" class="mybtn1">신고</button>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</div>
</c:forEach>