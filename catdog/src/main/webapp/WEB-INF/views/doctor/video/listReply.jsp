<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style='width: 860px; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>댓글 ${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='45' style='background: #9FC93C;'>
	       <td width='50%' style='padding:5px 15px; border:1px solid #9FC93C; border-right:none;' align="left">
	           <span><b>${vo.userName}</b> 님</span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #9FC93C; border-left:none;' align='right'>
	           <span>${vo.vidReplyCreated}</span> |
	           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
	                <span class="deleteReply" style="cursor: pointer;" data-vidReplyNum='${vo.vidReplyNum}' data-pageNo='${pageNo}'>삭제</span>
	           	</c:if>
	           <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }">
	           		<span class="notifyReply">신고</span>
	           	</c:if>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;' align="left">
	              ${vo.vidReplyContent}
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;' align="left">
	            <button type='button' class='btn btnReplyAnswerLayout' data-vidReplyNum='${vo.vidReplyNum}'>답글 <span id="answerCount${vo.vidReplyNum}">${vo.answerCount}</span></button>
	        </td>
	        <td style='padding:7px 5px;' align='right'>
                <button type='button' class='btn btnSendReplyLike' data-vidReplyNum='${vo.vidReplyNum}' data-vidReplyLike='1' title="좋아요"><i class="fas fa-heart" style="color: #FF0000;"></i>&nbsp;<span>${vo.likeCount}</span></button>	        
	        </td>
	    </tr>
	
	    <tr class='replyAnswer' style='display: none;' align="left">
	        <td colspan='2'>
	            <div id='listReplyAnswer${vo.vidReplyNum}' class='answerList' style='border-top: 1px solid #cccccc;'></div>
	            <div style='clear: both; padding: 10px 10px;'>
	                <div style='float: left; width: 5%;'>┗</div>
	                <div style='float: left; width:95%'>
	                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
	                 </div>
	            </div>
	             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn btnSendReplyAnswer' style="background-color: #9FC93C; color: #FFF; border:2px soild #FFF;" data-vidReplyNum='${vo.vidReplyNum}'>답글 등록</button>
	            </div>
	        
	        </td>
	    </tr>
	</c:forEach>
	</tbody>
	
	<tfoot id='listReplyFooter'>
		<tr height='50' align="center">
            <td colspan='2' >
              ${paging}
            </td>
           </tr>
	</tfoot>
</table>
