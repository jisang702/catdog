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
						<li>가나다라마바사</li>
						<li class="like"><button class="unlikebtn"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></li>
					</ul>
					<ul class="tr">
						<li>가가가</li>
						<li>2020-10-10 | </li>
						<li>5 | </li>
						<li>추천 5</li>
					</ul>
				</div>
				<div class="articlecontent">
					<ul>
						<li>
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~~가~~~~~~~~~~~~~~~
						</li>
					</ul>
				</div>
				<div class="articlebtn">
					<button type="button" class="mybtn1 floatleft">글목록</button>
					<button type="button" class="mybtn1">수정</button>
					<button type="button" class="mybtn1">삭제</button>
				</div>
			</div>
			<div class="commentLayout">
				<div class="comment">
					<ul class="commenttitle">
						<li><span class="commentcount">10</span>개의 댓글</li>
					</ul>				
					<ul class="commentinput">
						<li>
							<textarea rows="3" cols="110" maxlength="150"></textarea>
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
										<textarea rows="2" cols="95" maxlength="100"></textarea>
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
										<textarea rows="2" cols="95" maxlength="100"></textarea>
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
