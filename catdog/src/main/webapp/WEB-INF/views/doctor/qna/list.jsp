<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}

function qnalist() {
	var f=document.qnaListForm;
	f.submit();
}
</script>

<div class="body-container" style="width: 1000px; margin-top: 50px;" >
    <div class="body-title">
        <h3><i class="fas fa-chalkboard-teacher"></i> QnA게시판 </h3>
    </div>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
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
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		       <th width="60" style="color: #787878;">번호</th>
		      <th width="100" style="color: #787878;">유형</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">문의일자</th>
		      <th width="80" style="color: #787878;">처리결과</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
	  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
	      <td>${dto.listNum}</td>
	      <td>${dto.qnaCategoryName}</td>
	      <td align="left" style="padding-left: 10px;">
	      	<c:choose>
	      		<c:when test="${dto.qnaSecret==1}">
	      			<i class="fa fa-lock" title="공개여부" style="color: #333333;"></i>
	      			<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
	      				<a href="${articleUrl}&qnaNum=${dto.qnaNum}">${dto.qnaSubject}</a>
	      			</c:if>
	      			<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userId!='admin'}">
	      				${dto.qnaSubject}
	      			</c:if>
	      		</c:when>
	      		<c:otherwise>
	      			<a href="${articleUrl}&qnaNum=${dto.qnaNum}">${dto.qnaSubject}</a>
	      		</c:otherwise>
	      	</c:choose>
	      </td>
	      <td>${dto.userName}</td>
	      <td>${dto.qnaCreated}</td>
	      <td>${dto.isAnswer==1?"답변완료":"답변대기"}</td>
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
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>