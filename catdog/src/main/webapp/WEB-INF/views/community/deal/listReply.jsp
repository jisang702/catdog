<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="dto" items="${listReply}">
<div class="commentlist">
		<c:choose>
			<c:when test="${dto.dealReplySecret==1 && sessionScope.member.userId!=dto.userId 
								&& sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.writeUser}">
				<div style="padding: 10px 0px 10px 5px">
					<i class="fas fa-lock"></i> 비밀댓글입니다.
				</div>
			</c:when>
			<c:otherwise>
		<div class="profile">
			<ul>
				<li>
					<p><c:if test="${dto.dealReplySecret==1}">
						<i class="fas fa-lock"></i>
						</c:if>
						<c:if test="${dto.dealReplySecret==0}">
						<i class="far fa-comment-dots"></i>
						</c:if>
						 ${dto.userNick}</p>
				</li>
				<li>${dto.dealReplyCreated}</li>
				<li>&nbsp;
					<c:if test="${sessionScope.member.userId==dto.userId}">				 
						<button type="button" class="mybtn1 updateReplybtn" data-replyNum="${dto.dealReplyNum}" data-page="${page}" data-secret="${dto.dealReplySecret}">수정</button>
					</c:if>
					<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> 			      
						<button type="button" class="mybtn1 deleteReply" data-replyNum="${dto.dealReplyNum}" data-page="${page}">삭제</button>
					</c:if>
				</li>
			</ul>
		</div>
		<div class="commentwrap">
			<ul>
				<li style="position: relative;">${dto.dealReplyContent}</li>
			</ul>
		</div>
		</c:otherwise>
		</c:choose>
		<div class="commentbtn">
			<button type="button" id="replybtn" class="mybtn1" data-replyNum="${dto.dealReplyNum}">답글(${dto.answerCount})</button>
			<button type="button" class="mybtn1">신고</button>
		</div>
		<div class="reply">
			<div id="listAnswerReply${dto.dealReplyNum}" class="replylist"></div>
			<div class="replyinput">
				<ul>
					<li>
						<textarea rows="3" cols="95" maxlength="100"></textarea>
						<button type="button" class="mybtn2 sendReplyAnswer" data-replyNum="${dto.dealReplyNum}" data-secret="${dto.dealReplySecret}">등록하기</button>
					</li>
				</ul>
			</div>
		</div>
</div>
</c:forEach>
<div>
	<p>${replyCount==0?"":paging}</p>
</div>