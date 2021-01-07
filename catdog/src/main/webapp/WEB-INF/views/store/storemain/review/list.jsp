<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<thead id='listReviewHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>리뷰 ${dataCount}개</span> <span>[리뷰 목록]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<c:forEach var="dto" items="${list}">
	<tbody id='listReviewBody'>
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>${dto.userId }</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>${dto.reCreated}</span> 
	           
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	            ${dto.reContent}
	        </td>
	    </tr>
</c:forEach>  

	</tbody>
	
	<tfoot id='listReviewFooter'>
		<tr height='40' align="center">
            <td colspan='2' >
            ${paging}
            </td>
           </tr>
	</tfoot>
</table>