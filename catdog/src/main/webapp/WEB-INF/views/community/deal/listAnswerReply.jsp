<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="dto" items="${listAnswerReply}">
<div class="answerReplylist">
	<div class="profile">
	<ul>
		<li><p><i class="fas fa-angle-double-right"></i> ${dto.userNick}</p></li>
		<li>${dto.freeReplyCreated}</li>
		<li>&nbsp;
			<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				 
				<button type="button" class="mybtn1 deleteAnswerReply"  data-replyNum="${dto.freeReplyNum}" data-replyType="${dto.freeReplyType}">삭제</button>
			</c:if>
		</li>
	</ul>
		<c:if test="${dto.likeUser==1}">
			<button type="button" class="replyunlikebtn" data-replyNum="${dto.freeReplyNum}"><i class="far fa-heart like"><span class="replyLikeCount"> ${dto.replyLikeCount} </span> </i></button>
		</c:if>
		<c:if test="${dto.likeUser!=1}">
			<button type="button" class="replylikebtn" data-replyNum="${dto.freeReplyNum}"><i class="far fa-heart unlike"><span class="replyLikeCount"> ${dto.replyLikeCount} </span> </i></button>
		</c:if>
	</div>
	<div style="display: flex; justify-content: space-between;">
		<div class="commentwrap">
			<ul>
				<li>${dto.freeReplyContent}</li>
			</ul>
		</div>
		<div class="commentbtn">
			<button type="button" class="mybtn1">신고</button>
		</div>
	</div>
</div>
</c:forEach>