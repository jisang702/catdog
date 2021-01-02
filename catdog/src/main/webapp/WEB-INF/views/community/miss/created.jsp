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

$(function() {
	 $("input:radio[name=dealWay]").click(function(){
		 
	        if($("input[name=dealWay]:checked").val()=="1"){
	            $("select[name=dealZone]").attr("disabled",false);
	            $("input:hidden[name=dealZone]").attr("disabled",true);
	 
	        } else if($("input[name=dealWay]:checked").val()=="2"){
	              $("select[name=dealZone]").attr("disabled",true);
				  $("input:hidden[name=dealZone]").attr("disabled",false);
	        }
	    });
});
</script>

<div class="body-container">
    <div class="board">
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table class="comtable" style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left"> 
			      <td>
			      	<select name="dealType" ${mode=='update'?"disabled='true'":""}>
			      		<option value="1">팝니다</option>
			      		<option value="2">삽니다</option>
			      	</select>
			      </td>
			      <td style="padding-left:10px;"> 
			        <input style="width: 90%;" type="text" name="dealSubject" maxlength="20" value="${dto.dealSubject}" placeholder="제목을 입력하세요">
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
			      	<input style="width: 20%;" type="text" id="dealPrice" name="dealPrice" onkeyup="commas(this)" value="${dto.dealPrice}"> 원(￦)
			      </td> 
			  </tr>
			  
			  <tr align="left">
			      <td>거래방법</td>
			      <td style="padding-left:10px;">
			      	<input type="radio" name="dealWay" value="1" ${dto.dealWay=="1"?"checked='checked'":""}> 직거래
			      	<select name="dealZone">
			      		<option value="">선택</option>
			      		<option value="서울" ${dto.dealZone=="서울"?"selected='selected'":""}>서울</option>
			      		<option value="경기" ${dto.dealZone=="경기"?"selected='selected'":""}>경기</option>
			      		<option value="인천" ${dto.dealZone=="인천"?"selected='selected'":""}>인천</option>
			      		<option value="전주" ${dto.dealZone=="전주"?"selected='selected'":""}>전주</option>
			      		<option value="부산" ${dto.dealZone=="부산"?"selected='selected'":""}>부산</option>
			      	</select>
			      	<input type="radio" name="dealWay" value="2" ${dto.dealWay=="2"?"checked='checked'":""}> 택배
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td width="100"style="padding-top:5px;" valign="top">상세정보
			      	<span style="font-size: 11px"><br>* 맨 처음 첨부한 이미지가 상품 대표 이미지로 설정됩니다.</span>
			      </td>
			      <td valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="dealContent" id="content" style="width:95%; height: 270px;">${dto.dealContent}</textarea>
			      </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="mybtn2" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="mybtn1">다시입력</button>
			        <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/deal/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         	<input type="hidden" name="dealZone" value="0">
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="dealNum" value="${dto.dealNum}">
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