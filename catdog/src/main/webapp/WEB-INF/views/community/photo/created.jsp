<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(function() {
	$("body").on("change", ".image_uploads input[type=file]", function() {
		var target=$(this)[0];

		var index=0;
		
		if(target != null && index<5) {
            var fileNM = $(this).val();
 
            var ext = fileNM.slice(fileNM.lastIndexOf(".") + 1).toLowerCase();
 
            if (!(ext=="gif"||ext=="jpg"||ext=="png")) {
                alert("이미지파일만 업로드 가능합니다.");
                return false;
            }
            
            var img_div = $(this).parent();
            var fileList = target.files ;
            
            var reader = new FileReader();
            reader.readAsDataURL(fileList [0]);
            
            reader.onload = function  (e) {
            	img_div.children('label').attr('style', 'display: none;');
                img_div.children('img').attr('style', 'display: inherit;');
                img_div.children('img').attr('src', e.target.result);
            };
            
            var div = document.createElement('div');
            
            index++;
            
            if(index<4) {
                div.className = 'image_div_'+index+'';
                div.innerHTML='<label for ="upload_'+index+'"></label><img style="display: none;" id="previewImg_'+index+'">\<input type="file" name="upload" id="upload_'+index+'">';      
                $('.image_uploads').append(div);
            }
		}
	});
});
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
        
        str=f.upload_0.value;
        	if(!str) {
            	alert("사진을 첨부해주세요.");
            	return false;
            }
        
        f.action="${pageContext.request.contextPath}/community/photo/${mode}";
        f.submit();
}

function deletePhotoImg(imgNum){
	var url="${pageContext.request.contextPath}/community/photo/deletePhotoImg?type=deleteimg";
	$.post(url, {imgNum:imgNum}, function(data){
		$("#img"+imgNum).remove();
	}, "json");
}

$(function() {
	$(".image_uploads img").hover(function() {
		$(this).attr("src", "${pageContext.request.contextPath}/resources/css/images/delete.png");
	}, function() {
		$(this).attr("src", "${pageContext.request.contextPath}/uploads/photo/${vo.photoImgSavename}");
	});
});

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
			  	<td>사진 <p style="font-size: 11px;"><br>* 최대 4장</p></td>
			  	<td id="preview" height="150" align="left" style="padding-left: 30px;">
			  		<div class="image_uploads">
			  			<c:if test="${mode=='update'}">
				  			<c:forEach var="vo" items="${list}">
				  				<a id="img${vo.imgNum}" onclick="deletePhotoImg('${vo.imgNum}');">
				  					<img src="${pageContext.request.contextPath}/uploads/photo/${vo.photoImgSavename}">
				  				</a>
				  			</c:forEach>
				  		</c:if>
				  		<div class="image_div_0" style="display: inline;">
							<label for="upload_0"></label>
							<img style="display: none;" id="previewImg_0">
					  		<input type="file" name="upload" id="upload_0">
						</div>				  		
			  		</div>
			  	</td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="mybtn2" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="mybtn1">다시입력</button>
			        <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/photo/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="photoNum" value="${dto.photoNum}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
</div>