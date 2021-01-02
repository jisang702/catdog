<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function deletePhoto(photoNum) {
	var q = "photoNum=${dto.photoNum}&${query}&type=deletephoto";
	var url = "${pageContext.request.contextPath}/community/photo/delete?" + q;

	if(confirm("글을 삭제하시겠습니까?")) {
			location.href=url;
	}
}

$(function() {
	var saveurl=$(".photoImg ul li .Img:first").attr("data-save");
	var q="${pageContent.request.contextPath}/catdog/uploads/photo/";

	$(".photoSlide").find("img").attr("src", q+saveurl);
});

$(function() {
	$(".Img").on("click", function() {
		var saveurl=$(this).attr("data-save");
		var img=$(this).closest("div").prev("div").find("img");
		var q="${pageContent.request.contextPath}/catdog/uploads/photo/";
		img.attr("src", q+saveurl);
	});
});

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

$(function() {
	$("body").on("click", ".photoLikebtn", function() {		
		var url="${pageContext.request.contextPath}/community/photo/insertPhotoLike";
		var photoNum="${dto.photoNum}";
		var query="photoNum="+photoNum;
		
		var fn = function(data){
			var count = data.photoLikeCount;
			$("#photoLikeCount").text(count);
		};
		
		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart like");
		$(this).attr("class", "photobtn photounlikebtn");
	});
	
	$("body").on("click", ".photounlikebtn", function() {
		var url="${pageContext.request.contextPath}/community/photo/deletePhotoLike";
		var photoNum="${dto.photoNum}";
		var query="photoNum="+photoNum;
		
		var fn=function(data) {
			var count = data.photoLikeCount;
			$("#photoLikeCount").text(count);
		}
		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart unlike");
		$(this).attr("class", "photobtn photoLikebtn");
	});
});


$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/community/photo/listReply";
	var query = "page="+page+"&photoNum=${dto.photoNum}";
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

$(function() {
	$(".sendreplybtn").click(function() {
		var photoNum="${dto.photoNum}";
		$tb=$(this).closest("div");
		var photoReplyContent=$tb.find("textarea").val().trim();
		if(! photoReplyContent) {
			$tb.find("textarea").focus();
			return false;
		}
		photoReplyContent=encodeURIComponent(photoReplyContent);
		
		var url="${pageContext.request.contextPath}/community/photo/insertReply";
		var query="photoNum="+photoNum+"&photoReplyContent="+photoReplyContent+"&photoReplyType=0";
		
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
		var photoReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		$tb=$(this).closest("div").next(".commentwrap").find("li");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/community/photo/updateReply";
		var query="photoReplyContent="+content+"&photoReplyNum="+photoReplyNum;
		
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

$(function() {
	$("body").on("click", ".deleteReply", function() {
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var photoReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		
		var url="${pageContext.request.contextPath}/community/photo/deleteReply";
		var query="photoNum=${dto.photoNum}&photoReplyNum="+photoReplyNum+"&mode=reply";
		
		var fn=function(data) {
			listPage(page);
			var count = data.replyCount;
			$("#replyCount").text(count);
		}

		ajaxJSON(url, "post", query, fn);
	});
});

$(function() {
	$("body").on("click", ".replylikebtn", function() {
		var photoReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/photo/insertReplyLike";
		var query="photoReplyNum="+photoReplyNum;
		
		var fn=function(data) {
			var count = data.replyLikeCount;
			$btn.children().find(".replyLikeCount").html(" "+count);
		}

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart like");
		$(this).attr("class", "replyunlikebtn");
	});
	
	
	$("body").on("click", ".replyunlikebtn", function() {
		var photoReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/photo/deleteReplyLike";
		var query="photoReplyNum="+photoReplyNum;
		
		var fn=function(data) {
			var count = data.replyLikeCount;
			$btn.children().find(".replyLikeCount").html(" "+count);
		}

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart unlike");
		$(this).attr("class", "replylikebtn");
	});
});

$(function() {
	$("body").on("click", ".sendReplyAnswer", function() {
		var photoNum="${dto.photoNum}";
		var replyNum=$(this).attr("data-replyNum");
		$tb=$(this).closest("div");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		
		var url="${pageContext.request.contextPath}/community/photo/insertReply";
		var query="photoNum="+photoNum+"&photoReplyContent="+content+"&photoReplyType="+replyNum;
		
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

function listAnswerReply(photoReplyType) {
	var url="${pageContext.request.contextPath}/community/photo/listAnswerReply";
	var query="photoReplyType="+photoReplyType;
	var selector="#listAnswerReply"+photoReplyType;
	
	ajaxHTML(url, "get", query, selector);
}

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

$(function(){
	$("body").on("click", ".deleteAnswerReply", function(){
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var photoReplyNum=$(this).attr("data-replyNum");
		var photoReplyType=$(this).attr("data-replyType");
		
		var url="${pageContext.request.contextPath}/community/photo/deleteReply";
		var query="photoReplyNum="+photoReplyNum+"&mode=answer&photoReplyType="+photoReplyType;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true"){
				listAnswerReply(photoReplyType);
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

</script>

<div class="body-container">
    <div style="min-width:1000px; display: -webkit-box; margin-top: 100px;
    -webkit-box-pack: center;">
    	<div class="readArrow">
   			<c:if test="${not empty preReadDto}">
				<a href="${pageContext.request.contextPath}/community/photo/article?${query}&photoNum=${preReadDto.photoNum}">
				   	<i class="fas fa-chevron-left"></i>
				</a>
			</c:if>
    	</div>
    	<div>
    	<div class="photoArticle">
			<div class="photoImage">
				<div class="photoSlide">
					<img>
				</div>				
				<div class="photoImg">
					<ul>
				<c:forEach var="vo" items="${list}">
					<li><img src="${pageContext.request.contextPath}/uploads/photo/${vo.photoImgSavename}" class="Img" data-save="${vo.photoImgSavename}"></li>
				</c:forEach>
					</ul>
				</div>
			</div>
			<div class="photoArea">
				<div class="photoprofile">
					<ul class="photoSubject">
						<li>${dto.photoSubject}</li>
					</ul>
					<ul class="photoUser">
						<li><i class="fas fa-crown"> ${dto.userNick}</i></li>
					</ul>
					<ul class="photoCreated">
						<li>${dto.photoCreated} | 조회수 ${dto.photoHitCount}</li>
					</ul>
					<ul><li style="text-align: center;">
							<c:if test="${photoLikeUser==1}">
								<button type="button" class="photobtn photoLikebtn">
									<i class="far fa-heart like"> <span id="photoLikeCount">${photoLikeCount}</span> </i>
								</button>	
							</c:if>
							<c:if test="${photoLikeUser==0}">
								<button type="button" class="photobtn photoLikebtn">
									<i class="far fa-heart unlike"> <span id="photoLikeCount">${photoLikeCount}</span> </i>
								</button>	
							</c:if>			
						<button type="button" class="photobtn">
							<i class="fas fa-share"></i>
						</button>
					</li></ul>
				</div>
				<div class="photoContent">
					${dto.photoSubject}
				</div>
			</div>
		</div>
		<div style="margin: 10px;">
			<ul style="display: flex; justify-content: space-between;">
				<li><button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/photo/list?page=${page}';">목록으로</button> </li>
				<li>
					<c:if test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/photo/update?page=${page}&photoNum=${dto.photoNum}';">수정</button>
					</c:if>
					<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
						<button type="button" class="mybtn1" onclick="deletePhoto(${dto.photoNum});">삭제</button>
					</c:if>
				</li>
			</ul>
		</div>
		</div>
		<div class="readArrow">	   	
		<c:if test="${not empty nextReadDto}">
			<a href="${pageContext.request.contextPath}/community/photo/article?${query}&photoNum=${nextReadDto.photoNum}">
			   	<i class="fas fa-chevron-right"></i>
			</a>
		</c:if>
		</div>
		</div>
		<div style="margin: 10px auto; width: 900px; margin-bottom: 70px;">
		 <div class="commentLayout">
			<div class="comment">
				<ul class="commenttitle">
					<li><span id="replyCount" class="commentcount">${replyCount}</span>개의 댓글</li>				</ul>				
				<ul class="commentinput">
					<li style="position: relative;">
						<textarea name="reply" rows="4" cols="110" maxlength="300"></textarea>
						<button type="button" class="mybtn2 sendreplybtn">등록하기</button>
					</li>
				</ul>	
			</div>
		</div>
		<div id="listReply"></div>
	</div>
</div>