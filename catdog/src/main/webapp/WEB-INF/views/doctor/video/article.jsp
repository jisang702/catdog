<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function deleteVideo() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	var q= "vidNum=${dto.vidNum}&${query}";
	var url= "${pageContext.request.contextPath}/doctor/video/delete?" +q;
	
	if(confirm("위 자료를 삭제 하시겠습니까? "))
		location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	alert("게시물을 삭제할수 없습니다.");
</c:if>
}

function updateVideo(){
<c:if test="${sessionScope.member.userId==dto.userId}">
	var q="vidNum=${dto.vidNum}&page=${page}";
	var url="${pageContext.request.contextPath}/doctor/video/update?"+ q;
	
	location.href=url;
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정 할수 없습니다.");
</c:if>
}
</script>

<script type="text/javascript">

function ajaxJSON(url, method, query, fn) {
	$.ajax ({
		type:method
		,url: url
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
		,beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		}
		,error:function(jqXHR) {
			if(jqXHR.status===403) {
				login()
				return false;
			}
			console.log(jqXHR.responseText);
		}
	
	});
}

$(function(){
	$(".btnSendVideoLike").click(function(){
		if(! confirm("게시물에 공감 하시겠습니까? ")){
			return false;		
		}
		
		var url="${pageContext.request.contextPath}/doctor/video/insertVideoLike";
		var vidNum="${dto.vidNum}";
		var query="vidNum="+vidNum;
		
		var fn =  function(data){
			var state=data.state;
			if(state==="true") {
				var count= data.videoLikeCount;
				$("#videoLikeCount").text(count);
			}else if (state==="false") {
				alert("좋아요한 한번만 가능합니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});	
	
});
$(function(){
	listPage(1);
});

function listPage(page) {
	var url= "${pageContext.request.contextPath}/doctor/video/listReply";
	var query = "vidNum=${dto.vidNum}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
}

//댓글등록
$(function(){
	$(".btnSendReply").click(function(){
		var vidNum ="${dto.vidNum}";
		var $tb = $(this).closest("table");
		var vidReplyContent=$tb.find("textarea").val().trim();
		if(! vidReplyContent) {
			$tb.find("textarea").focus();
			return false;
		}
		
		vidReplyContent = encodeURIComponent(vidReplyContent);
		
		var url="${pageContext.request.contextPath}/doctor/video/insertReply";
		var query="vidNum="+vidNum+"&vidReplyContent="+vidReplyContent+"&vidReplyType=0";
		
		var fn= function(data) {
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못하였습니다.");
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

//댓글삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("댓글을 삭제 하시겠습니까? ")) {
			return false;
		}
		
		var vidReplyNum=$(this).attr("data-vidReplyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/doctor/video/deleteReply";
		var query ="vidReplyNum="+vidReplyNum+"&mode=reply";
		
		var fn= function(data){
			listPage(page);
		};
		ajaxJSON(url, "post", query, fn);

	});	
});

//댓글의 좋아요
$(function() {
	$("body").on("click", ".btnSendReplyLike", function(){
		var vidReplyNum=$(this).attr("data-vidReplyNum");
		var vidReplyLike=$(this).attr("data-vidReplyLike");
		var $btn = $(this);
		var msg="게시글에 공감하십니까 ?";
		
		if(! confirm(msg)) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/doctor/video/insertReplyLike";
		var query="vidReplyNum="+vidReplyNum+"&vidReplyLike="+vidReplyLike;

		var fn = function(data) {
			var state=data.state;
			if(state==="true") {
				var likeCount=data.likeCount;
				
				$btn.parent("td").children().eq(0).find("span").html(likeCount);
			} else if (state==="false") {
				alert("게시글 공감 여부는 한번만 가능 합니다 .");
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

// 댓글별 답글 리스트
function listReplyAnswer(vidReplyType) {
	var url="${pageContext.request.contextPath}/doctor/video/listReplyAnswer";
	var query="vidReplyType="+vidReplyType;
	var selector="#listReplyAnswer"+vidReplyType;

	ajaxHTML(url, "get", query, selector);
}

//댓글별 답글 개수
function replyAnswerCount(vidReplyType) {
	var url="${pageContext.request.contextPath}/doctor/video/replyAnswerCount";
	var query="vidReplyType="+vidReplyType;
	
	var fn= function(data) {
		var count=data.count;
		var vid="#answerCount"+vidReplyType;
		$(vid).html(count);
	};
	ajaxJSON(url, "post", query, fn);
}

//답글 버튼(등록 폼 및 리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function() {
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var vidReplyNum =$(this).attr("data-vidReplyNum");
		
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
		
			listReplyAnswer(vidReplyNum);
			replyAnswerCount(vidReplyNum);
		}
	});
});

//댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var vidNum="${dto.vidNum}";
		var vidReplyNum=$(this).attr("data-vidReplyNum");
		var $td=$(this).closest("td");
		
		var vidReplyContent=$td.find("textarea").val().trim();
		if(! vidReplyContent) {
			$td.find("textarea").focus();
			return false;
		}
		vidReplyContent= encodeURIComponent(vidReplyContent);
		
		var url="${pageContext.request.contextPath}/doctor/video/insertReply";
		var query="vidNum="+vidNum+"&vidReplyContent="+vidReplyContent+"&vidReplyType="+vidReplyNum;
	
		var fn =function(data) {
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(vidReplyNum);
				replyAnswerCount(vidReplyNum);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});	
});
//답댓글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까?")) {
			return;
		}
		
		var vidReplyNum=$(this).attr("data-vidReplyNum");
		var vidReplyType=$(this).attr("data-vidReplyType");
		
		var url="${pageContext.request.contextPath}/doctor/video/deleteReply";
		var query="vidReplyNum="+vidReplyNum+"&mode=answer";
		
		var fn=function(data) {
			listReplyAnswer(vidReplyType);
			replyAnswerCount(vidReplyType);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
</script>

	<div class="body-container boxText" style="width: 860px; margin-top: 70px; margin-bottom:50px; align:center; " >
   		 <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr class="alert-info" style="background-color: #FFBB00; color: #ffffff; border: 1px solid #FFBB00;" height="50">
		    <td colspan="2" align="center">
				 <h2>${dto.vidSubject}</h2>
			    </td>
			</tr>
			
			<tr  height="50" style="border-bottom: 2px solid #FFBB00;">
		    <td align="center" style="padding-left:10px;">
			   <b><i class="fas fa-paw" style="color: #FFBB00;">;&nbsp;&nbsp;</i>${dto.userName}&nbsp;&nbsp; 수의사 님</b>
		       <i class="fas fa-chevron-left" style="color: #9FC93C;"></i>
		       &nbsp;&nbsp;${dto.vidCreated}&nbsp;&nbsp;
		       <i class="fas fa-chevron-right" style="color: #9FC93C;"></i>에
		       &nbsp;&nbsp;업로드 된 유익한 영상입니다 
		       <i class="fas fa-paw" style="color: #FFBB00;"></i>
			 </td>
			 <td align="right" style="width:100%;">
		    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;">
			      <img src="${pageContext.request.contextPath}/uploads/doctor/video/${dto.vidThumb}" style="max-width:200px; height:auto; resize:both;">
			   </td>
			</tr>			
		   <tr>
			   <td width="50%" align="center"  style="padding-right: 5px;" >
			        <iframe width="800" height="520" src="${dto.vidUrl}"></iframe>
			    </td>
			</tr>
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="50">
			      ${dto.vidContent}
			   </td>
			</tr>
			
			<tr style="border-bottom: 3px solid #FFBB00;">
				<td colspan="2" height="60" style="padding-bottom: 15px;" align="center">
					<button type="button" class="btn btnSendVideoLike" title="좋아요" style="border: none;">
					<h1><i class="fas fa-heart" style="color: #FF0000;"></i></h1><br>
						<p id="videoLikeCount" style="border-bottom: 2px dotted #FFBB00; ">${dto.videoLikeCount}</p></button>
				</td>
			</tr>
			
			<tr height="55" style="border-bottom: 1px solid #FFBB00;">
			    <td colspan="2" align="left" style="padding-left: 15px;">
			     <b>이전글&nbsp;&nbsp;<i class="fas fa-caret-up" style="color:#FFBB00;"></i></b>&nbsp;&nbsp;&nbsp;
		             <c:if test="${not empty preReadVideo}">
			              <a href="${pageContext.request.contextPath}/doctor/video/article?${query}&vidNum=${preReadVideo.vidNum}">${preReadVideo.vidSubject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="50" style="border-bottom: 3px solid #FFBB00;">
		 	   <td colspan="2" align="left" style="padding-left: 15px;">
			      <b>다음글&nbsp;&nbsp;<i class="fas fa-caret-down" style="color:#FFBB00;"></i></b>&nbsp;&nbsp;&nbsp;
		          	<c:if test="${not empty nextReadVideo}">
			              <a href="${pageContext.request.contextPath}/doctor/video/article?${query}&vidNum=${nextReadVideo.vidNum}">${nextReadVideo.vidSubject}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 860px; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="50">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="btn" onclick="updateVideo();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" onclick="deleteVideo();">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/video/list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>

     <div>
		<table style='width: 860px; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='50'> 
				 <td align='left'>
				 	<span style='font-weight: bold;' >&nbsp;<h3>댓글쓰기 <i class="far fa-comment-dots" style="color: #FFBB00;">&nbsp;</i></h3></span>
				 	<span>타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding:5px 5px 0px;'>
					<textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
			    </td>
			</tr>
			<tr>
			   <td align='right'>
			        <button type='button' class='btn btnSendReply' style='padding:10px 20px; background-color: #FFBB00; color: #FFF; border:2px soild #FFF;'><b>댓글 등록</b></button>
			    </td>
			 </tr>
		</table>
		     
		<div id="listReply">
		</div>   
    </div>  
</div>