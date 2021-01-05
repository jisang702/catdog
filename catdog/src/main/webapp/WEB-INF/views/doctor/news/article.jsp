<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/doctor.css">

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



<div class="body-container boxText" style="width: 900px; margin-top: 70px; margin-bottom:50px; align:center; " >
	<div id="articleNews">
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr class="alert-info" style="background-color: #71da65; color: #ffffff;" height="60">
		    <td colspan="2" align="center">
			 <h1>${dto.newsSubject}</h1>  
		    </td>
		</tr>
		
		<tr height="50" style="border-bottom: 1px solid #cccccc;">
		    <td width="50%" align="left" style="padding-left: 5px;">
		    <b> 이름 : ${dto.userName} </b> 
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
			<tr height="50" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			      <a href="${pageContext.request.contextPath}/doctor/news/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
		          (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
			    </td>
			</tr>
		</c:forEach>
		
		<tr height="50" style="border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="left" style="padding-left: 5px;">
		       이전글 :
		        <c:if test="${not empty preReadDto}">
		        	<a href="${pageContext.request.contextPath}/doctor/news/article?${query}&newsNum=${preReadDto.newsNum}">${preReadDto.newsSubject}</a>
		        </c:if>
		    </td>
		</tr>
		
		<tr height="50" style="border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="left" style="padding-left: 5px;">
		       다음글 :
		        <c:if test="${not empty nextReadDto}">
		        	<a href="${pageContext.request.contextPath}/doctor/news/article?${query}&newsNum=${nextReadDto.newsNum}">${nextReadDto.newsSubject}</a>
				</c:if>
		     </td>
		</tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
		<tr height="50">
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