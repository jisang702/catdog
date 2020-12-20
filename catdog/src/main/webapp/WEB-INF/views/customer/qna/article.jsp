<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
  .questionQ{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #787878;
	text-align: center;
  }
  .questionSubject{
    display: inline-block;
    position:absolute;
    width:850px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #787878;
  }
  .answerA{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #71DA65;
	text-align: center;
  }
  .answerSubject{
    display: inline-block;
    position:absolute;
    width:850px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #71DA65;
  }
</style>

<div class="alert-info">
    <i class="fas fa-info-circle"></i>
         질문과 답변을 할 수 있는 공간입니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35">
		<td colspan="2" align="left">
		   <span class="questionQ">Q</span><span class="questionSubject">[${qdto.qnaCategoryName}] ${qdto.qnaSubject}</span>
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
		<td width="50%" align="left" style="padding-left: 5px;">
			작성자 : ${qdto.userNick}
		</td>
		<td width="50%" align="right" style="padding-right: 5px;">
			문의일자 : ${qdto.qnaCreated}
		</td>
	</tr>
	
	<tr style="border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			${qdto.qnaContent}
		</td>
	</tr>
	
	<c:forEach var="vo" items="${qlistFile}">
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px;">
				<a href="${pageContext.request.contextPath}/customer/qna/download?qnaFileNum=${vo.qnaFileNum}">${vo.qnaOriginalFileName}</a>
				(<fmt:formatNumber value="${vo.qnaFileSize/1024}" pattern="0.00"/> KByte)
			</td>
		</tr>
	</c:forEach>
</table>
	
	<c:if test="${not empty adto}">
	<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35">
			<td colspan="2" align="left">
				<span class="answerA">A</span><span class="answerSubject">[RE] ${adto.qnaSubject}</span>
			</td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    	<td width="50%" align="left" style="padding-left: 5px;">
			담당자 : ${adto.userNick}
			</td>
			<td width="50%" align="right" style="padding-left: 5px;">
			답변일자 : ${adto.qnaCreated}
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
				${adto.qnaContent}
			</td>
		</tr>
		<c:forEach var="vo" items="${alistFile}">
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px;">
				<a href="${pageContext.request.contextPath}/customer/qna/download?qnaFileNum=${vo.qnaFileNum}">${vo.qnaOriginalFileName}</a>
				(<fmt:formatNumber value="${vo.qnaFileSize/1024}" pattern="0.00"/> KByte)
			</td>
		</tr>
	</c:forEach>
	</table>
	</c:if>
	
<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding-left: 5px;">
		이전글 : 
			<c:if test="${not empty preReadDto}">
				<c:choose>
					<c:when test="${preReadDto.qnaSecret==1}">
						<i class="fa fa-lock" title="공개여부" style="color: #333333"></i>
						<c:if test="${sessionScope.member.userId==preReadDto.userId || sessionScope.member.userType == 0 }">
							<a href="javascript:articleBoard('${preReadDto.qnaNum}','${page}');">${preReadDto.qnaSubject}</a>
						</c:if>
						<c:if test="${sessionScope.member.userId!=preReadDto.userId && sessionScope.member.userType != 0 }">
							${preReadDto.qnaSubject}
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:articleBoard('${preReadDto.qnaNum}','${page}');">${preReadDto.qnaSubject}</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="left" style="padding-left: 5px;">
		다음글 : 
			<c:if test="${not empty nextReadDto}">
				<c:choose>
					<c:when test="${nextReadDto.qnaSecret==1}">
						<i class="fa fa-lock" title="공개여부" style="color: #333333"></i>
						<c:if test="${sessionScope.member.userId==nextReadDto.userId || sessionScope.member.userType == 0 }">
							<a href="javascript:articleBoard('${nextReadDto.qnaNum}','${page}');">${nextReadDto.qnaSubject}</a>
						</c:if>
						<c:if test="${sessionScope.member.userId!=nextReadDto.userId && sessionScope.member.userType != 0 }">
							${nextReadDto.qnaSubject}
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:articleBoard('${nextReadDto.qnaNum}','${page}');">${nextReadDto.qnaSubject}</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
</table>

<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	<tr height="45">
		<td width="300" align="left">
			<c:if test="${sessionScope.member.userId == qdto.userId}"> 
				<button type="button" class="btn" onclick="updateForm('${qdto.qnaNum}','${page}');">수정</button>
			</c:if>
			<c:if test="${sessionScope.member.userId == qdto.userId || sessionScope.member.userType==0}"> 
				<button type="button" class="btn" onclick="deleteBoard('${qdto.qnaNum}','${page}','question');">질문삭제</button>
			</c:if>
			<c:if test="${sessionScope.member.userType==0 && empty adto}"> 
				<button type="button" class="btn" onclick="replyForm('${qdto.qnaNum}','${page}');">답변</button>
			</c:if>
			<c:if test="${not empty adto && sessionScope.member.userType==0}"> 
				<button type="button" class="btn" onclick="updateForm('${adto.qnaNum}','${page}');">답변수정</button>
			</c:if>
			<c:if test="${not empty adto && sessionScope.member.userType==0}"> 
				<button type="button" class="btn" onclick="deleteBoard('${adto.qnaNum}','${page}','answer');">답변삭제</button>
			</c:if>
		</td>
		
		<td align="right">
			<button type="button" class="btn" onclick="listPage('${page}')">리스트</button>
		</td>
	</tr>
</table>