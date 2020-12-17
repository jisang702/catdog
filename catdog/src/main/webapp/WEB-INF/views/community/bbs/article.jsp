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

$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/community/board/listReply";
	var query = "page="+page+"&freeNum=${dto.freeNum}";
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

// 댓글 및 답글 쓰기
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
		var query="freeNum="+freeNum+"&freeReplyContent="+freeReplyContent+"&freeReplyType=1";
		
		var fn=function(data) {
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
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
		var query="freeReplyNum="+freeReplyNum;
		
		var fn=function(data) {
			listPage(page);
		}

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
			          <button type="button" class="mybtn1" onclick="deleteBoard(${dto.freeNum});">삭제</button>
			       </c:if>
				</div>
			</div>
			<div class="commentLayout">
				<div class="comment">
					<ul class="commenttitle">
						<li><span class="commentcount">${replyCount}</span>개의 댓글</li>
					</ul>				
					<ul class="commentinput">
						<li>
							<textarea name="reply" rows="4" cols="110" maxlength="150"></textarea>
							<button type="button" class="mybtn2 sendreplybtn">등록하기</button>
						</li>
					</ul>	
				</div>
			</div>
			<div id="listReply"></div>
		</div>
	</div>
</div>
