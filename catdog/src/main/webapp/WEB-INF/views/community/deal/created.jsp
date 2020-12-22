<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function commas(t) {
	var x = t.value;		
    x = x.replace(/,/gi, '');

    var regexp = /^[0-9]*$/;
    if(!regexp.test(x)){ 
    	$(t).val(""); 
    	alert("숫자만 입력 가능합니다.");
    } else {
    	x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
    	$(t).val(x);			
    }
}

function removeComma(n) {
	if ( typeof n == "undefined" || n == null || n == "" ) {
        return "";
	}
    var txtNumber = '' + n;
    return txtNumber.replace(/(,)/g, "");
}
</script>

<div class="body-container">
    <div class="board">
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table class="dealtable" style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left"> 
			      <td>
			      	<select name="dealType">
			      		<option value="1">팝니다</option>
			      		<option value="2">삽니다</option>
			      	</select>
			      </td>
			      <td style="padding-left:10px;"> 
			        <input style="width: 90%;" type="text" name="dealSubject" maxlength="100" value="${dto.subject}" placeholder="제목을 입력하세요">
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td>작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userNick}
			      </td>
			  </tr>
			  
			  <tr align="left">
				  <td>가격</td>
			      <td style="padding-left:10px;">
			      	<input style="width: 20%;" type="text" id="dealPrice" name="dealPrice" onkeyup="commas(this)"> 원(￦)
			      </td> 
			  </tr>
			  
			  <tr align="left">
			      <td>거래방법</td>
			      <td style="padding-left:10px;">
			      	<input type="radio" name="dealWay" value="1"> 직거래
			      	<input type="radio" name="dealWay" value="2"> 택배
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td width="100"style="padding-top:5px;" valign="top">상세설명</td>
			      <td valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="dealContent" id="content" style="width:95%; height: 270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			  <tr align="left">
			      <td width="100">파일첨부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="width: 97%; height: 25px;">
			       </td>
			  </tr>
			  
			  <c:if test="${mode=='update' }">
				  <tr align="left">
				      <td width="100">첨부된파일</td>
				      <td style="padding-left:10px;">
				          <c:if test="${not empty dto.saveFilename}">
				          		<a href="${pageContext.request.contextPath}/bbs/deleteFile?num=${dto.num}&page=${page}"><i class="far fa-trash-alt"></i></a>
				          </c:if>
						  ${dto.originalFilename}
				       </td>
				  </tr>
			  </c:if>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="mybtn2" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="mybtn1">다시입력</button>
			        <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/deal/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}">
			         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
			         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
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