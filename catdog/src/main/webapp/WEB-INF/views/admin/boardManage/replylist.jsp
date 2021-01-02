<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainht.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>

<style type="text/css">

a{
	text-decoration: none;
}

a .subject:hover{
	cursor: pointer;
	color: tomato;
	text-decoration: none;
}

.board-list tr:hover{
	cursor: pointer;
	background-color: #f6f6f6;
}

</style>

<script type="text/javascript">

function ajaxFun(url, method, dataType, query, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status == 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList(){
	var f = document.searchForm;
	f.boardType.value=$("#selectBoardType").val();
	console.log(f.boardType.value);
	f.action="${pageContext.request.contextPath}/admin/boardManage/listReply";
	f.submit();
}

function send(boardType, num){
	var url = "${pageContext.request.contextPath}";
	if(boardType == "free"){
		url+="/community/board/article?freeNum="+num;		
	}else if(boardType == "deal"){
		url+="/community/deal/article?dealNum="+num;		
	}else if(boardType == "vid"){
		url+="/doctor/video/article?vidNum="+num;		
	}
	
	location.href=url;
}

function deleteReply(boardType, num){
	var url = "${pageContext.request.contextPath}/admin/boardManage/delete";
	var query="";
	if(boardType == "free"){
		query="tableName=comFreeReply&numName=freeReplyNum&num="+num;	
	}else if(boardType == "deal"){
		query="tableName=comDealReply&numName=dealReplyNum&num="+num;		
	}else if(boardType == "vid"){
		query="tableName=vetVidReply&numName=vidReplyNum&num="+num;		
	}
	
	if(! confirm("선택한 댓글을 삭제하시겠습니까?")){
		return;
	}
	
	var fn=function(data){
		console.log(data.state);
		searchList();
	}
	
	ajaxFun(url, "post", "json", query, fn);

}
</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
      <div class="mypage2">
     	<div class="mypagetab">
     		<p>댓글 통합 관리</p>
     	</div>
     
     <div>
	     <div class="tab-content" style="clear: both; padding: 10px 10px 10px;">
	     	<table  style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${replyCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
					  <button class="mybtn2" type="button" style="background: black; color: white">&nbsp;신고&nbsp;</button>      	
			          <select id="selectBoardType" class="selectField" onchange="searchList();">
			          		<option value="" ${boardType=="" ? "selected='selected'":""}>::게시판::</option>
			          		<option value="free" ${boardType=="free" ? "selected='selected'":""}>자유게시판</option>
			          		<option value="deal" ${boardType=="deal" ? "selected='selected'":""}>중고거래</option>
			          		<option value="vid" ${boardType=="vid" ? "selected='selected'":""}>비디오</option>
			          </select>
			      </td>
			   </tr>
			</table>
			
			<table class="listtable1" style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <thead>
	               <tr align="center" height="35" style="padding: 0"> 
				      <th style="width: 40px; color: #787878;">번호</th>
				      <th style="width: 60px; color: #787878;">게시판</th>
				      <th style="width: 250px; color: #787878;">댓글내용</th>
				      <th style="width: 100px; color: #787878;">아이디</th>
				      <th style="width: 120px; color: #787878;">작성일</th>
				      <th style="width: 40px; color: #787878;">신고</th>			  
				      <th style="width: 40px; color: #787878;">삭제</th>	    
				  </tr>
			 </thead>
			 
			 <tbody class="board-list">
			 <c:forEach var="dto" items="${list}">
				  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc; " class="hover-tr"> 
				      <td style="padding: 0;">${dto.listNum}</td>
				      <td style="padding: 0;">${dto.boardType=="free" ? "자유" : (dto.boardType=="deal" ? "중고거래" : "비디오") } </td>
				      <td style="padding: 0; text-overflow: ellipsis;"><a class="subject" onclick="send('${dto.boardType}','${dto.num}');">${dto.content}</a></td>
				      <td style="padding: 0;">${dto.userId}</td>
				      <td style="padding: 0;">${dto.created}</td>
				      <td style="padding: 0;">0</td>
				      <td style="padding: 0;"><button class="mybtn2" onclick="deleteReply('${dto.boardType}','${dto.replyNum}')">삭제</button> </td>		      
				  </tr>
			</c:forEach>
			</tbody>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					${replyCount==0?"등록된 자료가 없습니다.":paging} 
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/boardManage/listArticle';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="${pageContext.request.contextPath}/admin/boardManage/listArticle" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="subject"     ${condition=="subject" ? "selected='selected'":""}>글제목</option>
			            	  <option value="created"     ${condition=="created" ? "selected='selected'":""}>작성일</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="boardType" value="${boardType}">
			            <input type="hidden" name="page" value="1">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">&nbsp;</td>
			   </tr>
			</table>
	     </div>
			
			
     </div>
	</div>
	</div>
</div>
<div id="member-dialog" style="display: none;">

</div>