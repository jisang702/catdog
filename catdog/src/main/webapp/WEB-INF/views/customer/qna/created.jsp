<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
<c:if test="${mode=='update'}">
	function deleteFile(qnaFileNum){
		var url="${pageContext.request.contextPath}/customer/qna/deleteFile";
		$.post(url, {qnaFileNum:qnaFileNum}, function(data){
			$("#f"+qnaFileNum).remove();
		}, "json");
	}
</c:if>
</script>

<div class="alert-info">
  <i class="fas fa-info-circle"></i>
    질문과 답변을 할 수 있는 공간입니다.
</div>

<form name="boardForm" method="post" enctype="multipart/form-data">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tbody id="tb">
		<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">유&nbsp;&nbsp;&nbsp;&nbsp;형</td>
      		<td style="padding-left:10px;">
      			<select name="qnaCategoryNum" class="selectField" ${(mode=="update" && not empty dto.qnaParent) || mode=="answer" ? "disabled='disabled' " :"" }>
      				<c:forEach var="vo" items="${listCategory}">
      					<option value="${vo.qnaCategoryNum}" ${vo.qnaCategoryNum==dto.qnaCategoryNum ? "selected='selected' ":""}>${vo.qnaCategoryName}</option>
      				</c:forEach>
      			</select>
      			
      			<c:if test="${(mode=='update' &&  not empty dto.qnaParent) || mode=='answer' }">
      				<input type="hidden" name="qnaCategoryNum" value="${dto.qnaCategoryNum}">
      			</c:if>
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      		<td style="padding-left:10px;">
      			<input type="text" name="qnaSubject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.qnaSubject}"
      				${(mode=='update' && not empty dto.qnaParent) || mode=="answer" ? "readonly='readonly' ":""}>
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			<td style="padding-left:10px;">
				${sessionScope.member.userNick}
			</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			 <td width="100" bgcolor="#eeeeee" style="text-align: center;">공개여부</td>
			 <td style="padding-left:10px;">
			 	<input type="radio" name="qnaSecret" value="0" ${empty dto || dto.qnaSecret==0 ? "checked='checked' ":"" }>공개
			 	<input type="radio" name="qnaSecret" value="1" ${dto.qnaSecret==1 ? "checked='checked' ":"" }>비공개
			 </td>
		</tr>
		
		<tr align="left" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		      	<textarea name="qnaContent" rows="12" class="boxTA" style="width: 95%;">${dto.qnaContent}</textarea>
		      </td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
		      <td style="padding-left:10px;"> 
		          <input type="file" name="upload" multiple="multiple" class="boxTF" size="53" style="width: 95%; height: 25px;">
		       </td>
		  </tr>
		  
		  <c:if test="${mode=='update'}">
		  	<c:forEach var="vo" items="${listFile}">
		  		<tr id="f${vo.qnaFileNum}" height="40" style="border-bottom: 1px solid #cccccc;">
		  			<td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
		  			<td style="padding-left: 10px; text-align: left;">
		  				<a href="javascript:deleteFile('${vo.qnaFileNum}');"><i class="far fa-trash-alt"></i></a>
		  				${vo.qnaOriginalFileName}
		  			</td>
		  		</tr>
		  	</c:forEach>
		  </c:if>
		</tbody>
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="45">
			<td align="center">
				<button type="button" class="btn" onclick="sendOk('${mode}',${page});">${mode=='update'?'수정하기':'등록하기'}</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="sendCancel('${page}');">${mode=='update' ? '수정취소':'등록취소' }</button>
				 <c:if test="${mode=='update' }">
				 	<input type="hidden" name="qnaNum" value="${dto.qnaNum}">
				 	<input type="hidden" name="page" value="${page}">
				 </c:if>
				 <c:if test="${mode=='answer' }">
				 	<input type="hidden" name="parent" value="${dto.qnaNum}">
				 	<input type="hidden" name="page" value="${page}">
				 </c:if>
			</td>
		</tr>
	</table>
	
</form>

