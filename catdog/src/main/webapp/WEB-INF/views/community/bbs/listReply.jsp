<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {
	$('.reply').hide();
	$('.commentbtn #replybtn').click(function() {
		$(this).parents().next('.reply').toggle();		
	});
});
</script>
<c:forEach var="dto" items="${listReply}">
<div class="commentlist">
		<div class="profile">
			<ul>
				<li><p>${dto.userNick}</p></li>
				<li>${dto.freeReplyCreated}</li>
				<li>&nbsp;
					<c:if test="${sessionScope.member.userId==dto.userId}">				 
						<button type="button" class="mybtn1 updateReplybtn" data-replyNum="${dto.freeReplyNum}" data-page="${page}">수정</button>
					</c:if>
					<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}"> 			      
						<button type="button" class="mybtn1 deleteReply" data-replyNum="${dto.freeReplyNum}" data-page="${page}">삭제</button>
					</c:if>
				</li>
			</ul>
		</div>
		<div class="commentwrap">
			<ul>
				<li>${dto.freeReplyContent}</li>
			</ul>
		</div>
		<div class="commentbtn">
			<button type="button" id="replybtn" class="mybtn1">답글(1)</button>
			<button type="button" class="mybtn1">신고</button>
		</div>
		<div class="reply">
			<div>
				<div id="listReplyAnswer" ></div>
				<div class="replyinput">
					<ul>
						<li>
							<textarea rows="3" cols="95" maxlength="100"></textarea>
							<button type="button" class="mybtn2">등록하기</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
</div>
</c:forEach>
<div>
	<p>${replyCount==0?"등록된 게시물이 없습니다.":paging}</p>
</div>