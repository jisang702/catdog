<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
  .questionQ{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #027d87;
	text-align: center;
  }
  .questionSubject{
    display: inline-block;
    position:absolute;
    width:966px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #027d87;
  }
  .answerA{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #cc4901;
	text-align: center;
  }
  .answerSubject{
    display: inline-block;
    position:absolute;
    width:966px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #cc4901;
  }
</style>

<script type="text/javascript">
<c:if test="${not empty answerDto && sessionScope.member.userId=='admin' || sessionScope.member.userType==2}">
function deleteQnA(qnaNum, mode) {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="${pageContext.request.contextPath}/doctor/qna/delete?qnaNum="+qnaNum+"&mode="+mode+"&${query}";
		location.href=url;
	}
}
</c:if>
</script>

<div class="body-container" style="width: 1000px; margin-top: 50px;" >
    <div class="body-title">
        <h3><i class="fas fa-chalkboard-teacher"></i> QnA게시판 </h3>
    </div>
    
	<div class="alert-info">
	    <i class="fas fa-info-circle"></i>
	         질문과 답변을 할 수 있는 공간입니다.
	</div>
	
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35">
	    <td colspan="2" align="left">
	    	<span class="questionQ">Q</span><span class="questionSubject">[${questionDto.qnaCategoryName}] ${questionDto.qnaSubject}</span>
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td width="50%" align="left" style="padding-left: 5px;">
	       작성자 : ${questionDto.userName}
	    </td>
	    <td width="50%" align="right" style="padding-right: 5px;">
	     문의일자 : ${questionDto.qnaCreated}
	    </td>
	</tr>
	
	<tr>
	  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
	      ${questionDto.qnaContent}
	   </td>
	</tr>
	</table>
	
	<c:if test="${not empty answerDto}">
		<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35">
		    <td colspan="2" align="left">
	    	<span class="answerA">A</span><span class="answerSubject">[RE] ${answerDto.qnaSubject}</span>
		    </td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
		    <td width="50%" align="left" style="padding-left: 5px;">
		       담당자 : ${answerDto.userName}
		    </td>
		    <td width="50%" align="right" style="padding-right: 5px;">
		     답변일자 :  ${answerDto.qnaCreated}
		    </td>
		</tr>
		
		<tr>
		  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
		      ${answerDto.qnaContent}
		   </td>
		</tr>
		</table>
	
	</c:if>
	
	<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    <td colspan="2" align="left" style="padding-left: 5px;">
	       이전글 :
	        <c:if test="${not empty preReadDto}">
		      	<c:choose>
		      		<c:when test="${preReadDto.qnaSecret==1}">
		      			<i class="fa fa-lock" title="공개여부" style="color: #8bc34a;"></i>
		      			<c:if test="${sessionScope.member.userId==preReadDto.userId ||sessionScope.member.userType==2}">
		      			    <a href="${pageContext.request.contextPath}/doctor/qna/article?qnaNum=${preReadDto.qnaNum}&${query}">${preReadDto.qnaSubject}</a>
		      			</c:if>
		      			<c:if test="${sessionScope.member.userId!=preReadDto.userId}">
		      				${preReadDto.qnaSubject}
		      			</c:if>
		      		</c:when>
		      		<c:otherwise>
		      			 <a href="${pageContext.request.contextPath}/doctor/qna/article?qnaNum=${preReadDto.qnaNum}&${query}">${preReadDto.qnaSubject}</a>
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
		      			<i class="fa fa-lock" title="공개여부" style="color: #8bc34a;"></i>
		      			<c:if test="${sessionScope.member.userId==nextReadDto.userId || sessionScope.member.userType==2}">
		      				 <a href="${pageContext.request.contextPath}/doctor/qna/article?qnaNum=${nextReadDto.qnaNum}&${query}">${nextReadDto.qnaSubject}</a>
		      			</c:if>
		      			<c:if test="${sessionScope.member.userId!=nextReadDto.userId }">
		      				${nextReadDto.qnaSubject}
		      			</c:if>
		      		</c:when>
		      		<c:otherwise>
		      			 <a href="${pageContext.request.contextPath}/doctor/qna/article?qnaNum=${nextReadDto.qnaNum}&${query}">${nextReadDto.qnaSubject}</a>
		      		</c:otherwise>
		      	</c:choose>
	        </c:if>
	    </td>
	</tr>
	</table>
	
	<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	<tr height="45">
	    <td width="400" align="left">
	        <c:if test="${sessionScope.member.userId==questionDto.userId}">
	            <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/update?qnaNum=${questionDto.qnaNum}&page=${page}&rows=${rows}';">질문수정</button>
	        </c:if>
	        <c:if test="${sessionScope.member.userId==questionDto.userId || sessionScope.member.userId=='admin'}">
	            <button type="button" class="btn" onclick="deleteQnA('${questionDto.qnaNum}', 'question');">질문삭제</button>
	        </c:if>
	        <c:if test="${sessionScope.member.userType==2 && empty answerDto}"> 
	            <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/answer?qnaNum=${questionDto.qnaNum}&page=${page}&rows=${rows}';">답변</button>
	        </c:if>
	        <c:if test="${not empty answerDto and sessionScope.member.userType==2}">
	            <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/update?qnaNum=${answerDto.qnaNum}&page=${page}&rows=${rows}';">답변수정</button>
	        </c:if>
	        <c:if test="${not empty answerDto && sessionScope.member.userId=='admin' || sessionScope.member.userType==2}">
	            <button type="button" class="btn" onclick="deleteQnA('${answerDto.qnaNum}', 'answer');">답변삭제</button>
	        </c:if>
	    </td>
	
	    <td align="right">
	        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/list?${query}';">리스트</button>
	    </td>
	</tr>
	</table>

</div>