<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form name="faqForm" method="post">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tbody id="tb">
		<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">유&nbsp;&nbsp;&nbsp;&nbsp;형</td>
      		<td style="padding-left:10px;">
      			<select name="faqCateNum" class="selectField" ${mode=="update" ? "disabled='disabled' " :"" }>
      				<c:forEach var="vo" items="${listCategory}">
      					<option value="${vo.qnaCateNum}" ${vo.qnaCateNum==dto.qnaCateNum ? "selected='selected' ":""}>${vo.qnaCateName}</option>
      				</c:forEach>
      			</select>
      			
      			<c:if test="${mode=='update'}">
      				<input type="hidden" name="qnaCateNum" value="${dto.qnaCateNum}">
      			</c:if>
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
      		<td style="padding-left:10px;">
      			<input type="text" name="faqQuestion" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.faqQuestion}"
      				${mode=='update'  ? "readonly='readonly' ":""}>
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			<td style="padding-left:10px;">
				${sessionScope.member.userNick}
			</td>
		</tr>
		
		<tr align="left" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		      	<textarea name="faqAnswer" rows="12" class="boxTA" style="width: 95%;">${dto.faqAnswer}</textarea>
		      </td>
		</tr>
		
		</tbody>
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="45">
			<td align="center">
				<button type="button" class="btn" onclick="sendOk('${mode}',${page});">${mode=='update'?'수정하기':'등록하기'}</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="sendCancel('${page}');">${mode=='update' ? '수정취소':'등록취소' }</button>
				 <c:if test="${mode=='update' }">
				 	<input type="hidden" name="faqNum" value="${dto.faqNum}">
				 	<input type="hidden" name="page" value="${page}">
				 </c:if>
			</td>
		</tr>
	</table>
	
</form>
