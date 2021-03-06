<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/doctor.css">

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}

function article(vidNum) {
	var url="${articleUrl}&vidNum="+vidNum;
	location.href=url;
}

</script>

<div class="body-container boxText" style="width: 900px; margin-top: 50px; margin-bottom:50px; align:center; ">
    <div class="body-title" >
	  	<img src="${pageContext.request.contextPath}/resources/css/img/doctor.jpg" style="width: 120px; height: 100px;">
      <h2> 전문가가 알려주는 이야기  </h2>
    </div>
        
    <div>		
	<table style="width: 100%; height: 100%; margin: 20px auto 0px; border-spacing: 0px;">
	   <tr height="35">
	      <td align="left" width="50%">
	      <p>	${dataCount}개(${page}/${total_page} PAGE) </p>
	      </td>
	      <td align="right">
	          
	      </td>
	   </tr>
	</table>
		
		<table style="width: 860px; margin: 5px auto; border-spacing: 0px;">
			<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td width="225" align="center">
			        <div class="imgLayout">
			        	<div style="margin-bottom: 5px;">
			        	<h3><i class="far fa-eye" style="color: #9FC93C;"></i>&nbsp;&nbsp; ${dto.vidHitCount} view</h3></div>
			             <img src="${pageContext.request.contextPath}/uploads/doctor/video/${dto.vidThumb}" width="280" 
			                   height="230" border="0" style="border-radius:10px;" onclick="javascript:article('${dto.vidNum}');">
			             <div class="subject" onclick="javascript:article('${dto.vidNum}');"  >
			                 	<div> 
			                 	<span>${dto.vidSubject}</span>
			                 	</div>
			                 	<div>
			                 	<span style="float: right;"> By.${dto.userName}</span>
			                 	</div>
					         	<div style="clear:both; float: left;"> 
					         		<b><i class="fas fa-heart" style="color: #FF0000;"></i>&nbsp;&nbsp;${dto.videoLikeCount}</b></div>	                  
					         	<div style="float: right">${dto.vidReplyCount}&nbsp;&nbsp;<i class="far fa-comment-dots">&nbsp;&nbsp;</i>	
					         	</div>
			             </div>
			            
			         </div>
			     </td>
			</c:forEach>

			<c:set var="n" value="${list.size()}"/>
			<c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			         <td width="210">
			             <div class="imgLayout">&nbsp;</div>
			         </td>
		        </c:forEach>
			</c:if>
	
			<c:if test="${n!=0}">
		       <c:out value="</tr>" escapeXml="false"/>
			</c:if>
		</table>           
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			    ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			 </td>
		   </tr>
		</table>

		
		<table style="width: 100%; margin: 15px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/video/list';"><i class="fas fa-redo-alt"></i></button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/doctor/video/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="vidSubject" ${condition=="vidSubject"?"selected='selected'":""}>제목</option>
		                  <option value="vidContent" ${condition=="vidContent"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		                  <option value="vidCreated" ${condition=="vidCreated"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn searchBtn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="sendBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/video/created';">등록하기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>