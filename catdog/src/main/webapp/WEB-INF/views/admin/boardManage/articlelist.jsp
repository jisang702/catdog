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
	f.action="${pageContext.request.contextPath}/admin/boardManage/listArticle";
	f.submit();
}




</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
     <div class="body-title">
         <h2><i class="fas fa-user"></i>&nbsp;게시물 통합 관리 </h2>
     </div>
     
     <div>
	     <div class="tab-content" style="clear: both; padding: 10px 10px 10px;">
	     	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${articleCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
					  <button class="mybtn2" type="button" style="background: black; color: white">&nbsp;신고&nbsp;</button>      	
			          <select id="selectBoardType" class="selectField" onchange="searchList();">
			          		<option value="" ${boardType=="" ? "selected='selected'":""}>::게시판::</option>
			          		<option value="free" ${boardType=="free" ? "selected='selected'":""}>자유게시판</option>
			          		<option value="deal" ${boardType=="deal" ? "selected='selected'":""}>중고거래</option>
			          </select>
			      </td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <thead>
	               <tr align="center" bgcolor="#B7F0B1" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				      <th style="width: 60px; color: #787878;">번호</th>
				      <th style="width: 60px; color: #787878;">게시판</th>
				      <th style="width: 100px; color: #787878;">글제목</th>
				      <th style="width: 100px; color: #787878;">아이디</th>
				      <th style="width: 100px; color: #787878;">작성일</th>
				      <th style="width: 60px; color: #787878;">신고</th>			      
				  </tr>
			 </thead>
			 
			 <tbody class="board-list">
			 <c:forEach var="dto" items="${list}">
				  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
				      onclick="detailMember('${dto.userId}');"> 
				      <td>${dto.listNum}</td>
				      <td>${dto.boardType=="free" ? "자유" : (dto.boardType=="deal" ? "중고거래" : "실종") } </td>
				      <td>${dto.subject}</td>
				      <td>${dto.userId}</td>
				      <td>${dto.created}</td>
				      <td></td>		      
				  </tr>
			</c:forEach>
			</tbody>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					${articleCount==0?"등록된 자료가 없습니다.":paging} 
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
<div id="member-dialog" style="display: none;">

</div>