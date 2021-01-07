<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="alert-info">
  <i class="fas fa-info-circle"></i>
    중요한 일정 및 알림, 이벤트 등은 공지사항 통해 고객님께 알려 드립니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="center">
		   ${dto.noSubject}
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
		<td width="50%" align="left" style="padding-left: 5px;">
			닉네임 : ${dto.userNick}
		</td>
		<td width="50%" align="right" style="padding-right: 5px;">
			${dto.noCreated} | 조회${dto.noHitCount}
		</td>
	</tr>
	
	<tr style="border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding: 10px 5px; width: 100%" valign="top" height="200">
			${dto.noContent}
		</td>
	</tr>
	
	<c:forEach var="vo" items="${listFile}">
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px;">
				<a href="${pageContext.request.contextPath}/customer/notice/download?noFileNum=${vo.noFileNum}">${vo.noOriginalFileName}</a>
				(<fmt:formatNumber value="${vo.noFileSize/1024}" pattern="0.00"/> KByte)
			</td>
		</tr>
	</c:forEach>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding-left: 5px;">
		이전글 : 
			<c:if test="${not empty preReadDto}">
				<a href="javascript:articleBoard('${preReadDto.noNum}','${page}');">${preReadDto.noSubject}</a>
			</c:if>
		</td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding-left: 5px;">
		다음글 : 
			<c:if test="${not empty nextReadDto}">
				<a href="javascript:articleBoard('${nextReadDto.noNum}','${page}');">${nextReadDto.noSubject}</a>
			</c:if>
		</td>
	</tr>
</table>

<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	<tr height="45">
		<td width="300" align="left">
			<c:if test="${sessionScope.member.userType == 0}"> <!-- 관리자 userType=0 -->
				<button type="button" class="btn" onclick="updateForm('${dto.noNum}','${page}');">수정</button>
			</c:if>
			<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userType == 0}"> 
				<button type="button" class="btn" onclick="deleteBoard('${dto.noNum}','${page}');">삭제</button>
			</c:if>
		</td>
		
		<td align="right">
			<button type="button" class="btn" onclick="listPage('${page}')">리스트</button>
		</td>
	</tr>
</table>