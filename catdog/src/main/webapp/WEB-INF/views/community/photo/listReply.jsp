<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="dto" items="${listReply}">
<div class="commentlist">
		<div class="profile">
			<ul>
				<li><p><i class="far fa-comment-dots"></i> ${dto.userNick}</p></li>
				<li>${dto.photoReplyCreated}</li>
				<li>&nbsp;
					<c:if test="${sessionScope.member.userId==dto.userId}">				 
						<button type="button" class="mybtn1 updateReplybtn" data-replyNum="${dto.photoReplyNum}" data-page="${page}">수정</button>
					</c:if>
					<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> 			      
						<button type="button" class="mybtn1 deleteReply" data-replyNum="${dto.photoReplyNum}" data-page="${page}">삭제</button>
					</c:if>
				</li>
			</ul>
			<c:if test="${dto.likeUser==1}">
				<button type="button" class="replyunlikebtn" data-replyNum="${dto.photoReplyNum}"><i class="far fa-heart like"><span class="replyLikeCount"> ${dto.replyLikeCount}</span> </i></button>
			</c:if>
			<c:if test="${dto.likeUser!=1}">
				<button type="button" class="replylikebtn" data-replyNum="${dto.photoReplyNum}"><i class="far fa-heart unlike"><span class="replyLikeCount"> ${dto.replyLikeCount}</span> </i></button>
			</c:if>
		</div>
		<div class="commentwrap">
			<ul>
				<li>${dto.photoReplyContent}</li>
			</ul>
		</div>
		<div class="commentbtn">
			<button type="button" id="replybtn" class="mybtn1" data-replyNum="${dto.photoReplyNum}">답글(${dto.answerCount})</button>
			<button type="button" class="mybtn1">신고</button>
		</div>
		<div class="reply">
			<div>
				<div id="listAnswerReply${dto.photoReplyNum}" class="replylist"></div>
				<div class="replyinput">
					<ul>
						<li>
							<textarea rows="3" cols="95" maxlength="100"></textarea>
							<button type="button" class="mybtn2 sendReplyAnswer" data-replyNum="${dto.photoReplyNum}">등록하기</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
</div>
</c:forEach>
<div>
	<p>${replyCount==0?"":paging}</p>
</div>