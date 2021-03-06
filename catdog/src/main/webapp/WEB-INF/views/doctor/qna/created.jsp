<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.fas fa-info-circle {
	background-color: #E4F7BA;
}
</style>
<script type="text/javascript">
function sendOk() {
	var f= document.qnaForm;
	
	var str = f.qnaSubject.value;
	if(!str) {
		alert("제목을 입력하세요.");
		return;
	}
	
	str = f.qnaContent.value;
	if(!str) {
		alert("내용을 입력하세요.");
		f.qnaContent.focus();
		return;
	}
	
	f.action="${pageContext.request.contextPath}/doctor/qna/${mode}";
	
	f.submit();
}

</script>

<div class="body-container boxText" style="width: 860px; margin-top: 70px; margin-bottom:50px; align:center; " >   	
	<div class="alert-info">
	    <i class="fas fa-info-circle"></i>
	         질문과 답변을 할 수 있는 공간입니다.
	</div>
	
	<form name="qnaForm" method="post" enctype="multipart/form-data">
	  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	  <tr align="left" height="55" style="border-top: 1px solid #71DA65; border-bottom: 1px solid #E4F7BA;"> 
	      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">유&nbsp;&nbsp;&nbsp;&nbsp;형</td>
	      <td style="padding-left:10px;"> 
	        <select name="qnaCategoryNum" class="selectField" ${(mode=="update" && not empty dto.qnaAnc) || mode=="answer" ? "disabled='disabled'":"" }>
	        	<c:forEach var="vo" items="${listCategory}">
	        		<option value="${vo.qnaCategoryNum}" ${vo.qnaCategoryNum==dto.qnaCategoryNum?"selected='selected'":""}>${vo.qnaCategoryName}</option>
	        	</c:forEach>
	        </select>
	        
	        <c:if test="${(mode=='update' && not empty dto.qnaAnc) || mode=='answer'}">
	        	<input type="hidden" name="qnaCategoryNum" value="${dto.qnaCategoryNum}">
	        </c:if>
	      </td>
	  </tr>
	
	  <tr align="left" height="50" style="border-bottom: 1px solid #E4F7BA;">
	      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
	      <td style="padding-left:10px;"> 
	        <input type="text" name="qnaSubject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.qnaSubject}"
	               ${(mode=="update" && not empty dto.qnaAnc) || mode=="answer" ? "readonly='readonly'":"" }>
	      </td>
	  </tr>
	
	  <tr align="left" height="50" style="border-bottom: 1px solid #E4F7BA;"> 
	      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">작성자</td>
	      <td style="padding-left:10px;"> 
	          ${sessionScope.member.userName}
	      </td>
	  </tr>
	
	  <tr align="left" height="50" style="border-bottom: 1px solid #E4F7BA;">
	      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">공개여부</td>
	      <td style="padding-left:10px;">
	        <input type="radio" name="qnaSecret" value="0" ${empty dto || dto.qnaSecret==0?"checked='checked'":"" }> 공개&nbsp;
	        <input type="radio" name=qnaSecret value="1" ${dto.qnaSecret==1?"checked='checked'":"" }> 비공개
	      </td>
	  </tr>
	
	  <tr align="left" style="border-bottom: 1px solid #71DA65;"> 
	      <td width="100" bgcolor="#E4F7BA" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
	      <td valign="top" style="padding:5px 0px 5px 10px;"> 
	        <textarea name="qnaContent" rows="12" class="boxTA" style="width: 95%;">${dto.qnaContent}</textarea>
	      </td>
	  </tr>
	  
	  </table>
	
	  <table style="width: 100%; margin: 20px auto; border-spacing: 0px;">
	     <tr height="45"> 
	      <td align="center" >
		        <button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="qnaNum" value="${dto.qnaNum}">
		         	  <input type="hidden" name="rows" value="${rows}">
		        	 <input type="hidden" name="page" value="${page}">
		        </c:if>
		        <c:if test="${mode=='answer'}">
		        	<input type="hidden" name="qnaAnc" value="${dto.qnaNum}">
		        	 <input type="hidden" name="rows" value="${rows}">
		        	<input type="hidden" name="page" value="${page}">
		        </c:if>
	      </td>
	    </tr>
	  </table>
	</form>
</div>