<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function deleteNews() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q= "newsNum=${dto.newsNum}&${query}";
		var url= "${pageContext.request.contextPath}/doctor/news/delete?" +q;
		
		if(confirm("게시물을 삭제 하시겠습니까?"))
			location.href=url;
	</c:if>
	<c:if test="${sessionScope.member.userId!='admin'}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
}

function updateNews() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q="newsNum=${dto.newsNum}&page=${page}";
		var url="${pageContext.request.contextPath}/doctor/news/update?" +q;
		
		location.href=url;
	</c:if>
	<c:if test="${sessionScope.member.userId!='admin'}">
	  alert("게시물을 수정 할 수  없습니다.");
	</c:if>
}

</script>

<div  class="body-container" style="width: 600px; margin-top: 50px; align:center" >
<div class="body-title">
    <h3><i class="far fa-clipboard"></i> 새소식 </h3>
</div>

<div class="alert-info">
  <i class="fas fa-info-circle"></i>
    중요한 일정 및 알림, 이벤트 등은 공지사항 통해 고객님께 알려 드립니다.
</div>

<div id="articleNews">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    <td colspan="2" align="center">
		   ${dto.newsSubject}
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td width="50%" align="left" style="padding-left: 5px;">
	       이름 : ${dto.userName}
	    </td>
	    <td width="50%" align="right" style="padding-right: 5px;">
	        ${dto.newsCreated} | 조회 ${dto.newsHitCount}
	    </td>
	</tr>
	
	<tr style="border-bottom: 1px solid #cccccc;">
	  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
	      ${dto.newsContent}
	   </td>
	</tr>
	
	<c:forEach var="vo" items="${listFile}">
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="left" style="padding-left: 5px;">
		      <a href="${pageContext.request.contextPath}/doctor/news/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
	          (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
		    </td>
		</tr>
	</c:forEach>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td colspan="2" align="left" style="padding-left: 5px;">
	       이전글 :
	        <c:if test="${not empty preReadDto}">
	        	<a href="${pageContext.request.contextPath}/doctor/news/article?${query}&newsNum=${preReadDto.newsNum}">${preReadDto.newsSubject}</a>
	        </c:if>
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td colspan="2" align="left" style="padding-left: 5px;">
	       다음글 :
	        <c:if test="${not empty nextReadDto}">
	        	<a href="${pageContext.request.contextPath}/doctor/news/article?${query}&newsNum=${nextReadDto.newsNum}">${nextReadDto.newsSubject}</a>
			</c:if>
	     </td>
	</tr>
	</table>
	
	<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	<tr height="45">
	    <td width="300" align="left">
	        <c:if test="${sessionScope.member.userId==dto.userId}">
	            <button type="button" class="btn" onclick="updateNews();">수정</button>
	        </c:if>
	        <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
	            <button type="button" class="btn" onclick="deleteNews();">삭제</button>
	        </c:if>
	    </td>
	
	    <td align="right">
	        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/news/list?${query}';">리스트</button>
	    </td>
	</tr>
	</table>
</div>

</div>