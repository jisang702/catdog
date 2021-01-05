<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.boxTF  {
	border: 1px solid #FFFFFF;
}
.boxTA {
	border: 1px solid #FFFFFF;
}
.btn {
	height: 40px;
	border-radius: 10px;
}

.btn:hover {
	border: 2px solid #71DA65;
	background:#E6F8E0;
}	
 

</style>
<script type="text/javascript">
function sendOk() {
	var f = document.videoForm;
	
	var str = f.vidSubject.value;
	if(!str) {
		alert("제목을 입력하세요.");
		f.vidSubject.focus();
		return;
	}
	str = f.vidContent.value;
	if(!str) {
		alert("내용을 입력하세요.");
		f.vidContent.focus();
		return;
	}

	
	f.action="${pageContext.request.contextPath}/doctor/video/${mode}";
	
	f.submit();
	
}

</script>

<div class="body-container boxText" style="width: 900px; margin-top: 70px; margin-bottom:50px; align:center; " >
   <div class="body-title"  >
	   <div><img src="${pageContext.request.contextPath}/resources/css/img/doctor01.jpg" style="width: 100px; height: 80px;"> </div>
	   <div><h4> 유익한 영상을 공유 해주세요</h4></div>    
	</div>
  
   <div>
		<form name="videoForm" method="post" enctype="multipart/form-data">
		  <table style="width: 100%; height:550px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse; border: 1px solid #71da65; font-size: 15px;">
		  <tr align="left" height="60" style="border-top: 1px solid #71da65; border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		      <td style="padding-left:10px;"> 
		        <input type="text" name="vidSubject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.vidSubject}">
		      </td>
		  </tr>
		
		  <tr align="left" height="60" style="border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center;">작성자</td>
		      <td style="padding-left:10px;"> 
		         ${sessionScope.member.userName}
		      </td>
		  </tr>
		
		  <tr align="left" style="border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center; padding-top:5px;" valign="middle" >내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		        <textarea name="vidContent" rows="12" class="boxTA" style="width: 95%;">${dto.vidContent}</textarea>
		      </td>
		  </tr>

		  <tr align="left" height="60" style="border-bottom: 1px solid #71da65;">
		      <td width="100" bgcolor="#71da65" style="text-align: center;">썸&nbsp;네&nbsp;일</td>
		      <td style="padding-left:10px;"> 
		          <input type="file" name="upload" class="boxTF btnfile" size="53" accept="image/*" style="height: 25px;">
		       </td>
		  </tr>
		  
		  <tr align="left" height="60" style="border-bottom: 1px solid #71da65;">
		      <td width="100" bgcolor="#71da65" style="text-align: center;"> URL&nbsp;링크</td>
		      <td style="padding-left:10px;"> 
		          <input type="text" name="vidUrl" class="boxTF" size="53" style="height: 25px;" value="${dto.vidUrl}">
		       </td>
		  </tr>

		  </table>
		
		  <table style="width: 100%; margin: 0px auto; border-spacing: 0px; margin: 35px auto;">
		     <tr height="60"> 
		      <td align="center" >
		        <button type="reset" class="btn">다시 입력</button>
		        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/video/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		      <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="vidNum" value="${dto.vidNum}">
		         	 <input type="hidden" name="vidThumb" value="${dto.vidThumb}">
		        	 <input type="hidden" name="page" value="${page}">
		      </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>