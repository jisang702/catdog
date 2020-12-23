<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">

<style type="text/css">

.body-title h2{
	font-size: 35px;
	font-family: 'Nanum Gothic', sans-serif;
	margin-bottom: 20px;
}

.imgLayout{
	width: 280px;
	height: 300px;
	padding: 10px 5px 10px;
	margin: 5px;
	border: 5px solid #F6F6F6;
	background-color: #F6F6F6;
	cursor: pointer;
	border-radius: 10px;
	
}
.subject {
	width: 250px;
	height: 100px;
	line-height:25px;
	margin:10px auto;
	border-top: 1px solid #DAD9FF;
	display: inline-block;
	white-space:nowrap;
	overflow:hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	text-align: left;
}
.selectField {
	border: 
}
.sendBtn {
	border: 2px solid #71DA65;
	border-radius: 10px;
	background: #E6F8E0;
	height: 40px;
	width: 80px;
}
 .selectField{
 	height: 40px;
 }
 .searchBtn {
 	height: 40px;
 	width: 70px; 
 }
</style>

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

<div class="body-container" style="width: 850px; margin-top: 30px; margin-bottom:50px;">
    <div class="body-title" >
	  	<img src="${pageContext.request.contextPath}/resources/css/img/doctor.jpg" style="width: 150px; height: 120px;">
      <h2> '전문가가 알려주는 이야기' </h2>
    </div>
        
    <div>		
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
	   <tr height="35">
	      <td align="left" width="50%">
	    	  &nbsp;&nbsp;<i class="fas fa-video"></i>&nbsp;${dataCount}개&nbsp;(${page}/${total_page} PAGES)
	      </td>
	      <td align="right">
	          
	      </td>
	   </tr>
	</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td width="210" align="center">
			        <div class="imgLayout">
			             <img src="${pageContext.request.contextPath}/uploads/doctor/video/${dto.vidThumb}" width="280" 
			                   height="230" border="0" style="border-radius:10px;" onclick="javascript:article('${dto.vidNum}');">
			             <div class="subject" onclick="javascript:article('${dto.vidNum}');"  >
			                 	<div> ${dto.vidSubject}</div>
					         	<div style="float: left;"><i class="far fa-comment-dots">&nbsp;&nbsp;</i>${dto.vidReplyCount}	</div>	                  
					         	<div style="float: right"> <i class="far fa-eye"></i>&nbsp;&nbsp;${dto.vidHitCount} </div>
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

		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
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