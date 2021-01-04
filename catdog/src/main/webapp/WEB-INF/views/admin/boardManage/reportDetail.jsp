<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form id="detailReportForm" name="detailReportForm" method="post">
<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">번호</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.num}</span></td>
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">게시판</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.boardType=="free" ? "자유" : (dto.boardType=="deal" ? "중고거래" : (dto.boardType=="vid" ? "비디오" : "포토")) } </span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">아이디</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">신고아이디</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.report_id}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">댓글등록일</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.created}</span></td>
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">신고등록일</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.report_date}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" style="padding-right: 9px;" ><label style="font-weight: 900;">신고(코드)</label></td>
		<td align="left" colspan="3" style="padding-left: 5px;">${dto.memo}(${dto.reportCode})</td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">댓글내용</label></td>
	    <td align="left" colspan="3" style="padding-left: 5px;">
			  ${dto.content}
			  &nbsp;<span class="btn" onclick="send('${dto.boardType}', '${dto.articleNum}');" style="cursor: pointer;">이동</span>
	    </td>
	</tr>
</table>

	<input type="hidden" name="boardType" value="${dto.boardType}">
	<input type="hidden" name="num" value="${dto.num}">
</form>

