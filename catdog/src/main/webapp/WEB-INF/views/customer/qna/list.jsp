<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.notice{
	border: 2px solid tomato; color: tomato; font-weight: 600
}
</style>

<div class="alert-info" style="background: #c6f3c0; color: #397233; border: 1px solid #6FA869">
  <i class="fas fa-info-circle"></i>
    질문과 답변을 할 수 있는 공간입니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
	<tr height="35">
		<td align="left" width="50%">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
		<td align="right">
			&nbsp;
		</td>
	</tr>
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr align="center" bgcolor="#71DA65" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #ffffff;">번호</th>
      <th width="100" style="color: #ffffff;">유형</th>
      <th style="color: #ffffff;">제목</th>
      <th width="100" style="color: #ffffff;">작성자</th>
      <th width="80" style="color: #ffffff;">문의일자</th>
      <th width="80" style="color: #ffffff;">처리결과</th>
  </tr>
  
  <c:forEach var="dto" items="${list}">
  	<tr align="center" bgcolor="#ffffff" height="40" style="border-bottom: 1px solid #cccccc;">
  		<td>${dto.listNum}</td>
  		<td>${dto.qnaCategoryName}</td>
  		<td align="left" style="padding-left: 10px;">
  			<c:choose> 
  				<c:when test="${dto.qnaSecret==1}">
  					<i class="fa fa-lock" title="공개여부" style="color: #333333"></i>
  					<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userType==0}">
  						<a href="javascript:articleBoard('${dto.qnaNum}','${page}');">${dto.qnaSubject}</a>
  					</c:if>
  					<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userType!=0}">
  						${dto.qnaSubject}
  					</c:if>
  				</c:when>
  				<c:otherwise>
  					<a href="javascript:articleBoard('${dto.qnaNum}','${page}');">${dto.qnaSubject}</a>
  				</c:otherwise>
  			</c:choose>
  		</td>
  		<td>${dto.userNick}</td>
  		<td>${dto.qnaCreated}</td>
  		<td> <c:if test="${dto.isAnswer==1}"><span class="mybtn1" style="padding: 5px 3px;" >답변완료</span> </c:if> 
  			 <c:if test="${dto.isAnswer!=1}"><span class="mybtn1 notice" style="padding: 5px 3px; ">답변대기</span> </c:if>
  		</td>
  	</tr>
  </c:forEach>
  
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
	<tr height="35">
		<td align="center">
			${dataCount==0 ? "등록된 게시물이 없습니다." : paging}
		</td>
	</tr>
</table>

<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
	<tr height="40">
		<td align="left" width="100">
			<button type="button" class="mybtn1" onclick="reloadBoard();">새로고침</button>
		</td>
		<td align="center">
			<form name="searchForm" method="post">
				<select id="condition" name="condition" class="selectField">
					<option value="all" ${condition=="all" ? "selected='selected'":"" }>모두</option>
					<option value="subject" ${condition=="subject" ? "selected='selected'":"" }>제목</option>
					<option value="content" ${condition=="content" ? "selected='selected'":"" }>내용</option>
					<option value="userNick" ${condition=="userNick" ? "selected='selected'":"" }>닉네임</option>
					<option value="created" ${condition=="created" ? "selected='selected'":"" }>작성일</option>
				</select>
				<input type="text" id="keyword" name="keyword" class="boxTF" value="${keyword}">
				<button type="button" class="mybtn1" onclick="searchList();">검색</button>
			</form>
		</td>
		<td align="right" width="100">
			<button type="button" class="mybtn2" onclick="insertForm();">글올리기</button>
		</td>
	</tr>
</table>
