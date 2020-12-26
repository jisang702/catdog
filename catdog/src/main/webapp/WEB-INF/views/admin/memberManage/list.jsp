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
$(function(){
	$("#tab-${group}").addClass("active");
		
	$("ul.tabs li").click(function(){
		tab=$(this).attr("data-tab");
			
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
			
		$("#tab-"+tab).addClass("active");
		
		var url="${pageContext.request.contextPath}/admin/memberManage/list?group="+tab;
		location.href=url;
	});
});

function searchList(){
	var f = document.searchForm;
	f.userEnabled.value=$("#selectEnabled").val();
	f.action="${pageContext.request.contextPath}/admin/memberManage/list";
	f.submit();
}

</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
     <div class="body-title">
         <h3><i class="fas fa-user"></i>&nbsp;회원 관리 </h3>
     </div>
     
     <div>
     
	     <div style="clear: both;">
	     	<ul class="tabs">
	     		<li id="tab-com" data-tab="comMember">일반회원</li>
	     		<li id="tab-vet" data-tab="vetMember">수의사회원</li>
	     		<li id="tab-sell" data-tab="sellMember">판매자회원</li>
	     	</ul>
	     </div>
	     <div class="tab-content" style="clear: both; padding: 40px 0px 0px;">
	     	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${dataCount}명(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
					  <button class="mybtn2" type="button" style="background: black; color: white">&nbsp;블랙&nbsp;</button>      	
			          <select id="selectEnabled" class="selectField" onchange="searchList();">
			          		<option value="" ${userEnabled=="" ? "selected='selected'":""}>::계정상태::</option>
			          		<option value="0" ${userEnabled=="0" ? "selected='selected'":""}>잠금 계정</option>
			          		<option value="1" ${userEnabled=="1" ? "selected='selected'":""}>활성 계정</option>
			          </select>
			      </td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <thead>
	               <tr align="center" bgcolor="#B7F0B1" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				      <th style="width: 60px; color: #787878;">번호</th>
				      <th style="width: 60px; color: #787878;">유형</th>
				      <th style="width: 100px; color: #787878;">아이디</th>
				      <th style="width: 100px; color: #787878;">닉네임</th>
				      <th style="width: 100px; color: #787878;">생년월일</th>
				      <th style="width: 120px; color: #787878;">전화번호</th>
				      <th style="color: #787878;">이메일</th>
				      <th style="width: 60px; color: #787878;">상태</th>
				      <th style="width: 60px; color: #787878;">신고</th>				      
				  </tr>
			 </thead>
			 
			 <tbody class="board-list">
			 <c:forEach var="dto" items="${list}">
				  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
				      onclick="detailMember('${dto.userNum}');"> 
				      <td>${dto.listNum}</td>
				      <td>일반</td>
				      <td>${dto.userId}</td>
				      <td>${dto.userNick}</td>
				      <td>${dto.userBirth}</td>
				      <td>${dto.userTel}</td>
				      <td>${dto.userEmail}</td>
				      <td>${dto.userEnabled==1 ? "활성" : "잠금"}</td>
				      <td>${dto.userReported}</td>				      
				  </tr>
			</c:forEach>
			</tbody>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					${dataCount==0?"등록된 자료가 없습니다.":paging} 
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/memberManage/list';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="userNick"   ${condition=="userNick" ? "selected='selected'":""}>닉네임</option>
			                  <option value="userEmail"  ${condition=="userEmail" ? "selected='selected'":""}>이메일</option>
			                  <option value="userTel"    ${condition=="userTel" ? "selected='selected'":""}>전화번호</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="userEnabled" value="${userEnabled}">
			            <input type="hidden" name="page" value="1">
			            <input type="hidden" name="group" value="${group}">
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