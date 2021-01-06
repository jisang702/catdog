<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d48bc298f4fa3304fff9c3eefffc2b4&libraries=services,clusterer,drawing"></script>
<script>
function deleteMiss(missNum) {
	var q = "missNum=${dto.missNum}&${query}";
	var url = "${pageContext.request.contextPath}/community/miss/delete?" + q;

	if(confirm("글을 삭제하시겠습니까?")) {
			location.href=url;
	}
}

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
	var url = "${pageContext.request.contextPath}/community/miss/listReply";
	var query = "page="+page+"&missNum=${dto.missNum}";
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

// 댓글 쓰기
$(function() {
	$(".sendreplybtn").click(function() {
		var missNum="${dto.missNum}";
		$tb=$(this).closest("div");
		var missReplyContent=$tb.find("textarea").val().trim();
		if(! missReplyContent) {
			$tb.find("textarea").focus();
			return false;
		}
		missReplyContent=encodeURIComponent(missReplyContent);
		
		var url="${pageContext.request.contextPath}/community/miss/insertReply";
		var query="missNum="+missNum+"&missReplyContent="+missReplyContent+"&missReplyType=0";
		
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
		var missReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		$tb=$(this).closest("div").next(".commentwrap").find("li");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/community/miss/updateReply";
		var query="missReplyContent="+content+"&missReplyNum="+missReplyNum;
		
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
		
		var missReplyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-page");
		
		var url="${pageContext.request.contextPath}/community/miss/deleteReply";
		var query="missNum=${dto.missNum}&missReplyNum="+missReplyNum+"&mode=reply";
		
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
		var missReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/miss/insertReplyLike";
		var query="missReplyNum="+missReplyNum;
		
		var fn=function(data) {
			var count = data.replyLikeCount;
			$btn.children().find(".replyLikeCount").html(" "+count);
		}

		ajaxJSON(url, "post", query, fn);
		
		$(this).children("i").attr("class", "far fa-heart like");
		$(this).attr("class", "replyunlikebtn");
	});
	
	
	$("body").on("click", ".replyunlikebtn", function() {
		var missReplyNum=$(this).attr("data-replyNum");
		var $btn=$(this);
		
		var url="${pageContext.request.contextPath}/community/miss/deleteReplyLike";
		var query="missReplyNum="+missReplyNum;
		
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
		var missNum="${dto.missNum}";
		var replyNum=$(this).attr("data-replyNum");
		$tb=$(this).closest("div");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content=encodeURIComponent(content);
		
		
		var url="${pageContext.request.contextPath}/community/miss/insertReply";
		var query="missNum="+missNum+"&missReplyContent="+content+"&missReplyType="+replyNum;
		
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

function listAnswerReply(missReplyType) {
	var url="${pageContext.request.contextPath}/community/miss/listAnswerReply";
	var query="missReplyType="+missReplyType;
	var selector="#listAnswerReply"+missReplyType;
	
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
		
		var missReplyNum=$(this).attr("data-replyNum");
		var missReplyType=$(this).attr("data-replyType");
		
		var url="${pageContext.request.contextPath}/community/miss/deleteReply";
		var query="missReplyNum="+missReplyNum+"&mode=answer&missReplyType="+missReplyType;
		
		var fn = function(data){
			var state=data.state;
			if(state=="true"){
				listAnswerReply(missReplyType);
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

</script>

<div class="body-container">
	<div class="board">    
    <div class="miss">
        <div class="flea-articletop">
        	<div class="miss-articleimg">
				<img src="${pageContext.request.contextPath}/uploads/miss/${dto.petImg}">
        	</div>
        	<div class="miss-title">
        		<ul>
        			<li class="title">${dto.missSubject}</li>
	    		</ul>
	    		<ul class="missInfo">
	    			<li>품종 : ${dto.petBreed}</li>
	    			<li>이름 : ${dto.petName}(${dto.petAge})</li>
	    			<li>성별 : ${dto.petGender}</li>
	    			<li style="min-height: 100px;">특징 : ${dto.petCharacter}</li>
	    		</ul>
	    		<ul>
	    		</ul>
        	</div> 	
        </div>
        <div>
	    	<div class="flea-article">
	    		<div class="missUserInfo">
	    			<ul>
	    				<li>닉네임 : ${dto.userNick}</li>
	    			</ul>
	    			<ul>
		    			<li><i class="fas fa-map-marker-alt"></i> ${dto.missWhere} | ${dto.missWhen} 실종</li>
	    			</ul>
	    		</div>
	    		<div class="flea-content">
	    			<span></span>
	    			<ul>
	    				<li>
	    					<div id="map" style="width: 850px; height: 400px;"></div>
	    				</li>
	    				<li style="min-height: 100px; padding-top: 30px;">
	    					${dto.missContent}
	    				</li>
	    			</ul>
	    		</div>
	    		<div>
	    			<ul style="text-align: left;">
		    			<li style="padding: 15px; border-bottom: 1px solid #dadada;">이전글 : <c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/community/miss/article?missNum=${preReadDto.missNum}&${query}">${preReadDto.missSubject}</a>
						</c:if></li>
						<li style="padding: 15px; border-bottom: 1px solid #dadada;">다음글 : <c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/community/miss/article?missNum=${nextReadDto.missNum}&${query}">${nextReadDto.missSubject}</a>
						</c:if></li>
	    			</ul>
	    		</div>
	    		<div class="fleaarticlebtn">
    				<div>
    					<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/miss/list">글목록</a>
    				</div>
    				<div>
		    			<c:if test="${sessionScope.member.userId==dto.userId}">				    
			          		<button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/miss/update?page=${page}&missNum=${dto.missNum}';">수정</button>
				       </c:if>
				       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
				          <button type="button" class="mybtn1" onclick="deleteMiss(${dto.missNum});">삭제</button>
				       </c:if>
    				</div>
	    		</div>
	    	</div>
	    </div>
	    <div style="margin: 10px auto; width: 900px; margin-bottom: 70px;">
	    <div class="commentLayout">
			<div class="comment">
				<ul class="commenttitle">
					<li><span id="replyCount" class="commentcount">${replyCount}</span>개의 댓글</li>
				</ul>				
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
    </div>
</div>

<script>
var lat="${dto.missWhereLat}";
var lng="${dto.missWhereLng}";
var mapContainer = document.getElementById('map'),
mapOption = { 
    center: new kakao.maps.LatLng(lat, lng),
    level: 2
};

var map = new kakao.maps.Map(mapContainer, mapOption);
 
var markerPosition  = new kakao.maps.LatLng(lat, lng); 

var marker = new kakao.maps.Marker({
position: markerPosition
});

marker.setMap(map);
</script>