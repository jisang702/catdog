<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/doctor.css">
 
<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}

function qnalist() {
	var f=document.qnaListForm;
	f.submit();
}

setInterval(function(){
	  $(".blinkEle").toggle();
	}, 1100);
</script>

<div class="body-container boxText" style="width: 900px; margin-top: 70px; margin-bottom:50px; align:center; " >
		<h2><i class="fab fa-quora"></i>&nbsp;질문답변&nbsp;</h2>
		<p>궁금한것은 무엇이든 물어보세요</p>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		      <p>	${dataCount}개(${page}/${total_page} PAGE) </p>
		      </td>
		      <td align="right">
		          <form action="${pageContext.request.contextPath}/doctor/qna/list" name="qnaListForm" method="post">
		          		<select name="rows" class="selectField" onchange="qnalist();">
		          			<option value="10" ${rows==10?"selected='selected' ":"" }>10개씩 보기</option>
		          			<option value="20" ${rows==20?"selected='selected' ":"" }>20개씩 보기</option>
		          			<option value="30" ${rows==30?"selected='selected' ":"" }>30개씩 보기</option>
		          			<option value="40" ${rows==40?"selected='selected' ":"" }>40개씩 보기</option>
		          			<option value="50" ${rows==50?"selected='selected' ":"" }>50개씩 보기</option>
		          		</select>
		          		<input type="hidden" name="condition" value="${condition}">
		          		<input type="hidden" name="keyword" value="${keyword}">
		          </form>
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; height: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-bottom: 3px solid #71da65;">
		<tr align="center" bgcolor="#eeeeee" height="50"
			style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc; background-color: #71da65; color:#ffffff;">
		       <th width="60" style="color: #787878;">번호</th>
		      <th width="100" style="color: #787878;">유형</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">문의일자</th>
		      <th width="80" style="color: #787878;">처리결과</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
	  <tr align="center" bgcolor="#ffffff" height="45" style="border-bottom: 1px solid #cccccc;"> 
	      <td>${dto.listNum}</td>
	      <td>${dto.qnaCategoryName}</td>
	      <td align="left" style="padding-left: 10px;">
	      	<c:choose>
	      		<c:when test="${dto.qnaSecret==1}">
	      			<i class="fa fa-lock" title="공개여부" style="color: #8bc34a;"></i>
	      			<c:choose>
	      				<c:when test="${sessionScope.member.userId==dto.userId ||sessionScope.member.userId=='admin' || sessionScope.member.userType==2}">
	      				<a href="${articleUrl}&qnaNum=${dto.qnaNum}">${dto.qnaSubject}</a>
	      				</c:when>
	      				<c:otherwise>
	      					${dto.qnaSubject}
	      				</c:otherwise>
	      			</c:choose>
	      		</c:when>
	      		<c:otherwise>
	      			<a href="${articleUrl}&qnaNum=${dto.qnaNum}">${dto.qnaSubject}</a>
	      		</c:otherwise>
	      	</c:choose>
	      </td>
	      <td>${dto.userName}</td>
	      <td>${dto.qnaCreated}</td>
      	<c:if test="${dto.isAnswer==1}">
			<td width="10%" style="color: #0390f4;">답변완료</td>
		</c:if>
		<c:if test="${dto.isAnswer==0}">       					
			<td width="10%" style="color: #f75e2e;"><b class="blinkEle">답변대기</b></td>
		</c:if>
	  </tr>
	  </c:forEach>
		  
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/list';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/doctor/qna/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="qnaSubject" ${condition=="qnaSubject"?"selected='selected'":""}>제목</option>
		                  <option value="qnaContent" ${condition=="qnaContent"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		                  <option value="qnaCreated" ${condition=="qnaCreated"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <input type="hidden" name="rows" value="${rows}">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="sendBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/created';">질문하기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>