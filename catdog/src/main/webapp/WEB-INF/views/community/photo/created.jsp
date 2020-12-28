<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

var sel_files=[];

$(document).ready(function() {
	$("#upload").on("change", preview);
});

function fileUpload() {
	$("#upload").trigger('click');
}

function preview(e) {
	sel_files=[];
	$("#previewImg").empty();
	
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("이미지만 업로드 가능합니다.");
			return;
		}
		sel_files.push(f);
		
		var index=1;
		var reader=new FileReader();
		reader.onload=function(e) {
			var html="<img src=\""+e.target.result+"\" data-file='"+f.name+"'></a>";
			var h="<input type=\"file\" name=upload id=\"upload\" multiple=\"multiple\" style=\"display: none;\">";
			$("#previewImg").append(html);
			index++;
		}
		reader.readAsDataURL(f);
	});
}

function sendOk() {
	var f = document.photoForm;

  	var str = f.photoSubject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.photoSubject.focus();
            return false;
        }

        str = f.photoContent.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	alert("내용을 입력하세요. ");
     		f.photoContent.focus();
        	return false;
        }
        
        str=f.upload.value;
        if(!str) {
        	alert("사진을 첨부해주세요.");
        	return false;
        }
        
        f.action="${pageContext.request.contextPath}/community/photo/${mode}";
        f.submit();
}
</script>


<div class="body-container">
    <div class="board">
			<form name="photoForm" method="post" enctype="multipart/form-data">
			  <table class="comtable" style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr> 
			      <td width="100">
			      	<select name="photoPet" ${mode=='update'?"disabled='true'":""}>
			      		<option value="1">강아지</option>
			      		<option value="2">고양이</option>
			      	</select>
			      </td>
			      <td style="padding-left:10px;"> 
			        <input style="width: 95%;" type="text" name="photoSubject" maxlength="20" value="${dto.photoSubject}" placeholder="제목을 입력하세요">
			      </td>
			  </tr>
			
			  <tr class="photocontent"> 
			      <td width="100" style="padding-top:5px;">내용</td>
			      <td valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="photoContent" id="photoContent" style="width:95%; height: 270px;">${dto.photoContent}</textarea>
			      </td>
			  </tr>
			  			  
			  <tr>
			  	<td>사진</td>
			  	<td id="preview" height="150" align="left">
			  		<span id="previewImg"></span>
			  		<span id="addImg">
			  			<input type="file" name="upload" id="upload" multiple="multiple" style="display: none;">
				  	</span>
			  		<button type="button" onclick="fileUpload();" style="width: 150px; height: 150px;"><img src="${pageContext.request.contextPath}/resources/css/images/addphoto.png"> </button>
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
</div>