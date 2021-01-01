<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <c:forEach var="vo" items="${list}">
	  <tr align="center" height="30" bgcolor="#fff">
	  	<td> <input type="text" name="prdCategoryName" disabled="disabled" value="${vo.prdCategoryName}"> </td>
	  	<td>
	  		<select name="enabled" class="selectField" disabled="disabled">
	  			<option value="1" ${vo.enabled==1?"selected=selected":"" }>활성</option>
	  			<option value="0" ${vo.enabled==0?"selected=selected":"" }>비활성</option>
	  		</select>
	  	</td>
	  	<td> <input type="text" name="orderNo" disabled="disabled" value="${vo.orderNo}"> </td>
	  	<td>
	  		<input type="hidden" name="prdCategoryNum" value="${vo.prdCategoryNum}">
	  		<span class="btnSpanIcon btnUpdateIcon" title="수정"><i class="far fa-edit"></i></span>
	  		<span class="btnSpanIcon btnDeleteIcon" title="삭제"><i class="far fa-trash-alt"></i></span>
	  		<span class="btnSpanIcon btnUpdateOkIcon" title="수정완료" style="display: none;"><i class="fas fa-check-circle"></i></span>
	  		<span class="btnSpanIcon btnUpdateCancelIcon" title="수정취소" style="display: none;"><i class="fas fa-undo"></i></span>
	  	</td>
	  </tr>
  </c:forEach>
