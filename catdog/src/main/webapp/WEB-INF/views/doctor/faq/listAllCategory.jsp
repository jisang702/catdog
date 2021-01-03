<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <c:forEach var="vo" items="${listAllCategory}">
	  <tr align="center" height="30" bgcolor="#fff">
	  	<td> <input type="text" name="faqCategoryName" disabled="disabled" value="${vo.faqCategoryName}"> </td>
	  	<td>
	  		<select name="faqEnabled" class="selectField" disabled="disabled">
	  			<option value="1" ${vo.faqEnabled==1?"selected=selected":"" }>활성</option>
	  			<option value="0" ${vo.faqEnabled==0?"selected=selected":"" }>비활성</option>
	  		</select>
	  	</td>
	  	<td> <input type="text" name="faqOrderNum" disabled="disabled" value="${vo.faqOrderNum}"> </td>
	  	<td>
	  		<input type="hidden" name=faqCategoryNum value="${vo.faqCategoryNum}">
	  		<span class="btnSpanIcon btnUpdateIcon" title="수정"><i class="far fa-edit"></i></span>
	  		<span class="btnSpanIcon btnDeleteIcon" title="삭제"><i class="far fa-trash-alt"></i></span>
	  		<span class="btnSpanIcon btnUpdateOkIcon" title="수정완료" style="display: none;"><i class="fas fa-check-circle"></i></span>
	  		<span class="btnSpanIcon btnUpdateCancelIcon" title="수정취소" style="display: none;"><i class="fas fa-undo"></i></span>
	  	</td>
	  </tr>
  </c:forEach>
