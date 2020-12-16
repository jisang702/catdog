<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
<c:if test="${mode=='update'}">
	function deleteFile(noFileNum){
		var url="${pageContext.request.contextPath}/customer/notice/deleteFile";
		$.post(url, {noFileNum:noFileNum}, function(data){
			$("#f"+noFileNum).remove();
		}, "json");
	}
</c:if>
</script>

<form name="noticeForm" method="post" enctype="multipart/form-data">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tbody id="tb">
		  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		      <td style="padding-left:10px;"> 
		        <input type="text" name="noSubject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.noSubject}">
		      </td>
		  </tr>
		
		  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">공지여부</td>
		      <td style="padding-left:10px;"> 
		            <input type="checkbox" name="noType" value="1" ${dto.noType==1 ? "checked='checked' ":"" } > 공지
		      </td>
		  </tr>
		
		  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
		      <td style="padding-left:10px;"> 
		          ${sessionScope.member.userNick}
		      </td>
		  </tr>
		
		  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		        <textarea name="noContent" id="noContent" rows="12" class="boxTA" style="width: 95%;">${dto.noContent}</textarea>
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
		  		<tr id="f${vo.noFileNum}" height="40" style="border-bottom: 1px solid #cccccc;">
		  			<td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
		  			<td style="padding-left: 10px; text-align: left;">
		  				<a href="javascript:deleteFile('${vo.noFileNum}');"><i class="far fa-trash-alt"></i></a>
		  				${vo.noOriginalFileName}
		  			</td>
		  		</tr>
		  	</c:forEach>
		  </c:if>
		</tbody>	
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0">
		<tr height="45">
			<td align="center">
				<button type="button" class="btn" onclick="sendNotice();">${mode=='update' ? '수정완료':'등록하기' }</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="sendCancel('${page}');">${mode=='update' ? '수정취소':'등록취소' }</button>
				 <c:if test="${mode=='update' }">
				 	<input type="hidden" name="noNum" value="${dto.noNum}">
				 	<input type="hidden" name="page" value="${page}">
				 </c:if>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "noContent",
	sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["noContent"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["noContent"].getIR();
	alert(sHTML);
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["noContent"].setDefaultFont(sDefaultFont, nFontSize);
}

function sendNotice(){
	oEditors.getById["noContent"].exec("UPDATE_CONTENTS_FIELD",[]);
	
	var f = document.noticeForm;
	
	if(! f.noSubject.value.trim()){
		alert("제목을 입력하세요.");
		f.noSubject.focus();
		return false;
	}
	
	var str=f.noContent.value;
	if(! str || str=="<p>&nbsp;</p>"){
		alert("내용을 입력하세요.");
		f.noContent.focus();
		return false;
	}
	
	var mode="${mode}";
	var url="${pageContext.request.contextPath}/customer/notice/"+mode;
	var query=new FormData(f);
	var page="${page}";
	
	var fn=function(data){
		var state=data.state;
		console.log(state);
		
		if(state=="false"){
			alert("게시물을 추가(수정)하지 못했습니다.");
		}
		
		if(page==undefined || page==""){
			page="1";
		}
		
		if(mode=="created"){
			reloadBoard();
		}else{
			listPage(page);
		}
	};
	
	ajaxFileJSON(url, "post", query, fn);
}
</script>