<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
<c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
function deleteQna(prdNum) {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="${pageContext.request.contextPath}/list/delete?prdNum="+num+"&${query}";
		location.href=url;
	}
}
</c:if>
</script>
<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listQnaHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>문의 ${dataCount}개</span> <span>[문의 목록]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listQnaBody'>

<c:forEach var="dto" items="${list}">
	<c:choose>
		<c:when test="${dto.qnaSecret==1 && sessionScope.member.userId != dto.userId}">
			<tr height='35' style='background: #eeeeee;'>
				<td colspan="2" style='padding:5px 5px;'>비밀글입니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
		
		    <tr height='35' style='background: #eeeeee;'>
		       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
		           <span><b>${dto.userName}</b></span>
		        </td>
		       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
		           <span>
		              ${dto.qnaCategory==1?"상품문의" : (dto.qnaCategory==2?"배송문의":"교환/환불")}
		           </span> |
		           <span>${dto.qnaCreated}</span> 
		          <c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
			          		<button type="button" class="btn" onclick="deleteqna('${dto.qnaNum}');">삭제</button>
			          </c:if>
		        </td>
		    </tr>
		    <tr>
		        <td colspan='2' valign='top' style='padding:5px 5px;'>
		             	${dto.qnaContent}
		        </td>
		    </tr>
		    <c:if test="${not empty q1naansContent }">
			    <tr>
			        <td colspan='2' valign='top' style='padding:5px 5px 5px 15px;'>
			            <div style="background: #e4e4e4;">
			            	<div style='float: left; width: 5%;'>└</div>
		            		<div style='float: left; width:95%;'>
		            	    	${dto.qnaansContent}
		            		</div>
		            	</div>
			        </td>
			    </tr>
			    
			    
		</c:if>
		</c:otherwise>
	</c:choose>
	    
</c:forEach>    
	    
	</tbody>
	
	<tfoot id='listQnaFooter'>
		<tr height='40' align="center">
            <td colspan='2' >
              ${paging }
            </td>
           </tr>
	</tfoot>
</table>