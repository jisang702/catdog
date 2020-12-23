<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function deleteBoard(freeNum) {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	var q = "freeNum=${dto.freeNum}&${query}";
	var url = "${pageContext.request.contextPath}/community/board/delete?" + q;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
</c:if>  
}
</script>

<script>
function ajaxJSON(url, method, query, fn) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

//게시글 좋아요/좋아요 취소
$(function() {
	$("body").on("click", ".boardlikebtn", function() {		
		var url="${pageContext.request.contextPath}/community/board/insertBoardLike";
		var freeNum="${dto.freeNum}";
		var query="freeNum="+freeNum;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true") {
				var count = data.boardLikeCount;
				$("#boardLikeCount").text("추천수 "+count);
			} else if(state==="false") {
				alert("본인 게시물은 추천 불가능합니다.")
			}
		};

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart like");
		$(this).attr("class", "boardunlikebtn");
	});
});

$(function() {
	$("body").on("click", ".boardunlikebtn", function() {
		var url="${pageContext.request.contextPath}/community/board/deleteBoardLike";
		var freeNum="${dto.freeNum}";
		var query="freeNum="+freeNum;
		
		var fn=function(data) {
			var count = data.boardLikeCount;
			$("#boardLikeCount").text("추천수 "+count);
		}
		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart unlike");
		$(this).attr("class", "boardlikebtn");
	});
});

$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/community/board/listReply";
	var query = "page="+page+"&freeNum=${dto.freeNum}";
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

// 댓글 쓰기
$(function() {
	$(".sendreplybtn").click(function() {
		var freeNum="${dto.freeNum}";
		$tb=$(this).closest("div");
		var freeReplyContent=$tb.find("textarea").val().trim();
		if(! freeReplyContent) {
			$tb.find("textarea").focus();
			return false;
		}
		freeReplyContent=encodeURIComponent(freeReplyContent);
		
		var url="${pageContext.request.contextPath}/community/board/insertReply";
		var query="freeNum="+freeNum+"&freeReplyContent="+freeReplyContent+"&freeReplyType=0";
		
		var fn=function(data) {
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
				var count = data.replyCount;
				$("#replyCount").text(count);
			} else if(state==="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		}

		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글 수정
$(function() {
	$("body").on("click", ".updateReplybtn" , function() {
		$tb=$(this).closest("div").next(".commentwrap").find("li");
		var content=$tb.text();
		$tb.html("<textarea>"+content+"</textarea>");
		$(this).text("완료");
		$(this).attr("class","mybtn1 updateReplySend");
		$(this).next("button").text("취소");
		$(this).next("button").attr("class","mybtn1 updateCancel");
	});
	
	$("body").on("click", ".updateReplySend", function() {
		var freeReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		$tb=$(this).closest("div").next(".commentwrap").find("li");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/community/board/updateReply";
		var query="freeReplyContent="+content+"&freeReplyNum="+freeReplyNum;
		
		var fn=function(data) {
			$tb.find("textarea").val("");
		}

		ajaxJSON(url, "post", query, fn);
		
		listPage(page);
	});
	
	$("body").on("click", ".updateCancel", function() {
		var page=$(this).attr("data-page");
		listPage(page);
	});
});

// 댓글 삭제
$(function() {
	$("body").on("click", ".deleteReply", function() {
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var freeReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		
		var url="${pageContext.request.contextPath}/community/board/deleteReply";
		var query="freeNum=${dto.freeNum}&freeReplyNum="+freeReplyNum+"&mode=reply";
		
		var fn=function(data) {
			listPage(page);
			var count = data.replyCount;
			$("#replyCount").text(count);
		}

		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글 좋아요
$(function() {
	$("body").on("click", ".replylikebtn", function() {
		var freeReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/board/insertReplyLike";
		var query="freeReplyNum="+freeReplyNum;
		
		var fn=function(data) {
			var count = data.replyLikeCount;
			$btn.children().find(".replyLikeCount").html(" "+count);
		}

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart like");
		$(this).attr("class", "replyunlikebtn");
	});
	
	
	$("body").on("click", ".replyunlikebtn", function() {
		var freeReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/board/deleteReplyLike";
		var query="freeReplyNum="+freeReplyNum;
		
		var fn=function(data) {
			var count = data.replyLikeCount;
			$btn.children().find(".replyLikeCount").html(" "+count);
		}

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart unlike");
		$(this).attr("class", "replylikebtn");
	});
})

// 댓글의 답글 쓰기
$(function() {
	$("body").on("click", ".sendReplyAnswer", function() {
		var freeNum="${dto.freeNum}";
		var replyNum=$(this).attr("data-replyNum");
		$tb=$(this).closest("div");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		
		var url="${pageContext.request.contextPath}/community/board/insertReply";
		var query="freeNum="+freeNum+"&freeReplyContent="+content+"&freeReplyType="+replyNum;
		
		var fn=function(data) {
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				var answerReplyCount=data.answerReplyCount;
				listAnswerReply(replyNum);
				$(this).parents(".replybtn").text("답글("+answerReplyCount+")");
			} 
		}

		ajaxJSON(url, "post", query, fn);
		
	});
});

function listAnswerReply(freeReplyType) {
	var url="${pageContext.request.contextPath}/community/board/listAnswerReply";
	var query="freeReplyType="+freeReplyType;
	var selector="#listAnswerReply"+freeReplyType;
	
	ajaxHTML(url, "get", query, selector);
}

// 답글 버튼 클릭시
$(function() {
	$("body").on("click", "#replybtn", function() {
		var $replyAnswer=$(this).closest("div").next();
		
		var isVisible=$replyAnswer.is(':visible');
		var replyNum=$(this).attr("data-replyNum");
		
		if(isVisible) {
			$replyAnswer.hide();
		} else {
			$replyAnswer.show();
			listAnswerReply(replyNum);
		}
	});
});

// 답글 삭제
$(function(){
	$("body").on("click", ".deleteAnswerReply", function(){
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var freeReplyNum=$(this).attr("data-replyNum");
		var freeReplyType=$(this).attr("data-replyType");
		
		var url="${pageContext.request.contextPath}/community/board/deleteReply";
		var query="freeReplyNum="+freeReplyNum+"&mode=answer&freeReplyType="+freeReplyType;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true"){
				listAnswerReply(freeReplyType);
			}
		};
		ajaxJSON(url, "post", query, fn);
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
						<li class="boardlike">
							<c:if test="${boardLikeUser==1}">
								<button type="button" class="boardunlikebtn">
									<i class="far fa-heart like"></i>
								</button>
							</c:if>
							<c:if test="${boardLikeUser==0}">
								<button type="button" class="boardlikebtn">
									<i class="far fa-heart unlike"></i>
								</button>
							</c:if>
						</li>
					</ul>
					<ul class="tr">
						<li>${dto.userNick} | </li>
						<li>${dto.freeCreated} | </li>
						<li>조회수 ${dto.freeHitCount} | </li>
						<li id="boardLikeCount">추천수 ${boardLikeCount}</li>
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
			          <button type="button" class="mybtn1" onclick="deleteBoard(${dto.freeNum});">삭제</button>
			       </c:if>
				</div>
			</div>
			<div class="commentLayout">
				<div class="comment">
					<ul class="commenttitle">
						<li><span id="replyCount" class="commentcount">${replyCount}</span>개의 댓글</li>
					</ul>				
					<ul class="commentinput">
						<li>
							<textarea name="reply" rows="4" cols="110" maxlength="300"></textarea>
							<button type="button" class="mybtn2 sendreplybtn">등록하기</button>
						</li>
					</ul>	
				</div>
			</div>
			<div id="listReply"></div>
		</div>
	</div>
</div>
