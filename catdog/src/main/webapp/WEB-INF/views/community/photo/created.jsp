<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="body-container">
    <div class="board">
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table class="phototable" style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left"> 
			      <td>
			      	<select name="photoPet" ${mode=='update'?"disabled='true'":""}>
			      		<option value="1">강아지</option>
			      		<option value="2">고양이</option>
			      	</select>
			      </td>
			      <td style="padding-left:10px;"> 
			        <input style="width: 90%;" type="text" name="photoSubject" maxlength="20" value="${dto.photoSubject}" placeholder="제목을 입력하세요">
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td>작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userNick}
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td width="100"style="padding-top:5px;" valign="top">내용</td>
			      <td valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="photoContent" id="content" style="width:95%; height: 270px;">${dto.dealContent}</textarea>
			      </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="mybtn2" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="mybtn1">다시입력</button>
			        <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/photo/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         	<input type="hidden" name="dealZone" value="0">
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="dealNum" value="${dto.photoNum}">
			         	 <input type="hidden" name="userId" value="${dto.userId}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	},
	fOnAppLoad : function(){
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function sendOk() {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	var f = document.boardForm;

    var str = f.dealSubject.value;
    if(!str) {
       alert("제목을 입력하세요. ");
       f.dealSubject.focus();
       return false;
    }
    
    str=f.dealWay.value;
    if(!str) {
    	alert("거래방식을 선택하세요.");
    	return false;
    }
    
    str = f.dealContent.value;
    if(!str || str=="<p>&nbsp;</p>") {
     	alert("내용을 입력하세요. ");
    	f.dealContent.focus();
    	return false;
    }

    str=f.dealPrice.value;
    str=removeComma(str);
    if(!str) {
    	alert("가격을 입력하세요.");	
    	f.dealPrice.focus();
    	return false;
    }
    
    f.dealPrice.value=str;
    
	f.action="${pageContext.request.contextPath}/community/deal/${mode}";
    f.submit();
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    
    
</div>