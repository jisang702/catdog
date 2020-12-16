<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function() {
	$('.reply').hide();
	$('.commentbtn #replybtn').click(function() {
		$(this).parents().next('.reply').toggle();		
	});
});

</script>

<div class="articleBody">
	<div class="boardLayout">
		<div class="board">
			<div class="article">
				<div>
					<ul class="articletitle">
						<li>${dto.freeSubject}</li>
						<li class="like"><button class="unlikebtn">추천</button></li>
					</ul>
					<ul class="tr">
						<li>${dto.userNick} | </li>
						<li>${dto.freeCreated} | </li>
						<li>조회수 ${dto.freeHitCount} | </li>
						<li>추천 5</li>
					</ul>
				</div>
				<div class="articlecontent">
					<ul>
						<li>
							${dto.freeContent}
						</li>
					</ul>
				</div>
				<div class="articlebtn">
					<button type="button" class="mybtn1 floatleft" onclick="javascript:location.href='${pageContext.request.contextPath}/community/board/list?page=${page}';">글목록</button>
			       <c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/board/update?page=${page}&freeNum=${dto.freeNum}';">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="mybtn1" onclick="deleteBoard();">삭제</button>
			       </c:if>
				</div>
			</div>
			<div class="commentLayout">
				<div class="comment">
					<ul class="commenttitle">
						<li><span class="commentcount">10</span>개의 댓글</li>
					</ul>				
					<ul class="commentinput">
						<li>
							<textarea rows="4" cols="110" maxlength="150"></textarea>
							<button type="button" class="mybtn2">등록하기</button>
						</li>
					</ul>	
				</div>
				<div class="commentlist">
					<div class="profile">
						<ul>
							<li><p>김김김</p></li>
							<li>2020-10-10</li>
							<li>&nbsp;
								<button type="button" class="mybtn1">수정</button>
								<button type="button" class="mybtn1">삭제</button>
							</li>
						</ul>
					</div>
					<div class="commentwrap">
						<ul>
							<li>가가가가가가가가</li>
						</ul>
					</div>
					<div class="commentbtn">
						<button type="button" id="replybtn" class="mybtn1">답글(1)</button>
						<button type="button" class="mybtn1">신고</button>
					</div>
					<div class="reply">
						<div>
							<div class="profile">
							<ul>
								<li><p>나나나</p></li>
								<li>2020-10-10</li>
								<li>&nbsp;
								<button type="button" class="mybtn1">수정</button>
								<button type="button" class="mybtn1">삭제</button>
								</li>
							</ul>
							</div>
							<div class="commentwrap">
								<ul>
									<li>가가가가가가가가</li>
								</ul>
							</div>
							<div class="commentbtn">
								<button type="button" class="mybtn1">신고</button>
							</div>
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
								<div class="commentlist">
					<div class="profile">
						<ul>
							<li><p>김김김</p></li>
							<li>2020-10-10</li>
							<li>&nbsp;
								<button type="button" class="mybtn1">수정</button>
								<button type="button" class="mybtn1">삭제</button>
							</li>
						</ul>
					</div>
					<div class="commentwrap">
						<ul>
							<li>가가가가가가가가</li>
						</ul>
					</div>
					<div class="commentbtn">
						<button type="button" id="replybtn" class="mybtn1">답글(1)</button>
						<button type="button" class="mybtn1">신고</button>
					</div>
					<div class="reply">
						<div>
							<div class="profile">
							<ul>
								<li><p>나나나</p></li>
								<li>2020-10-10</li>
								<li>&nbsp;
								<button type="button" class="mybtn1">수정</button>
								<button type="button" class="mybtn1">삭제</button>
								</li>
							</ul>
							</div>
							<div class="commentwrap">
								<ul>
									<li>가가가가가가가가</li>
								</ul>
							</div>
							<div class="commentbtn">
								<button type="button" class="mybtn1">신고</button>
							</div>
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
			</div>
		</div>
	</div>
</div>
