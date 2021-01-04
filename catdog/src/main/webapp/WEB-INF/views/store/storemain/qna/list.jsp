<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		
		    <tr height='35' style='background: #eeeeee;'>
		       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
		           <span><b>${dto.userName}</b></span>
		        </td>
		       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
		           <span>
		              ${dto.qnaCategory==1?"상품문의" : (dto.qnaCategory==2?"배송문의":"교환/환불")}
		           </span> |
		           <span>${dto.qnaCreated}</span> 
		        </td>
		    </tr>
		    <tr>
		        <td colspan='2' valign='top' style='padding:5px 5px;'>
		             	${dto.qnaContent}
		        </td>
		    </tr>
		    <c:if test="${not empty qnaansContent }">
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