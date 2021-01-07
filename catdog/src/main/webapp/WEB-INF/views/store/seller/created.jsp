<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    function check() {
        var f = document.productForm;

    	var str = f.prdName.value;
        if(!str) {
            alert("상품명을 입력하세요. ");
            f.prdName.focus();
            return false;
        }

        str = f.prdContent.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	alert("내용을 입력하세요. ");
     		f.prdContent.focus();
        	return false;
        }

    	f.action="${pageContext.request.contextPath}/store/seller/${mode}";

        return true;
    }
</script>

<div class="body-container" style="width: 830px;">
    <div class="body-title">
        <h3><i class="fas fa-chalkboard"></i> 게시판 </h3>
    </div>
    
    <div>
			<form name="productForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="prdName" maxlength="100" class="boxTF" style="width: 97%;" value="${dto.prdName}">
			      </td>
			      
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품간단설명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="prdIntro" maxlength="100" class="boxTF" style="width: 97%;" value="${dto.prdIntro}">
			      </td>
			      
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">가격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="prdPrice" maxlength="100" class="boxTF" style="width: 30%;" value="${dto.prdPrice}">
			      </td>
			      
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">할인율</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="prdDisCount" maxlength="100" class="boxTF" style="width: 20%;" value="${dto.prdDisCount}">%
			      </td>
			      
			  </tr>
			  
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			      <td width="100"  bgcolor="#eeeeee" style="text-align: center;">
			            <label>배송방법</label>
			      </td>
			      <td style="padding-left:10px;">
			            <select name="prdShip" class="selectField">
			                <option value="">선 택</option>
			                <option value="1" ${dto.prdShip==1 ? "selected='selected'" : ""}>무료배송</option>
			                <option value="2" ${dto.prdShip==2 ? "selected='selected'" : ""}>일반배송</option>
			            </select>
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">적립금</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="prdPoint" maxlength="100" class="boxTF" style="width: 20%;" value="${dto.prdPoint}">
			      </td>
			  </tr>
			  
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			      <td width="100"  bgcolor="#eeeeee" style="text-align: center;">
			            <label>동물구분</label>
			      </td>
			      <td style="padding-left:10px;">
			            <select name="prdPet" class="selectField">
			                <option value="">선 택</option>
			                <option value="0" ${dto.prdPet==0 ? "selected='selected'" : ""}>전체</option>
			                <option value="1" ${dto.prdPet==1 ? "selected='selected'" : ""}>강아지</option>
			                <option value="2" ${dto.prdPet==2 ? "selected='selected'" : ""}>고양이</option>
			            </select>
			      </td>
			  </tr>


			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			      <td width="100"  bgcolor="#eeeeee" style="text-align: center;">
			            <label>카테고리</label>
			      </td>
			      <td style="padding-left:10px;">
			            <select name="prdCategoryNum" class="selectField">
			                <option value="">선 택</option>
			                <option value="1" ${dto.prdCategoryNum==1 ? "selected='selected'" : ""}>간식</option>
			                <option value="2" ${dto.prdCategoryNum==5 ? "selected='selected'" : ""}>사료</option>
			                <option value="3" ${dto.prdCatehoryNum==6 ? "selected='selected'" : ""}>케어</option>
			                <option value="4" ${dto.prdCatehoryNum==7 ? "selected='selected'" : ""}>리빙</option>
			                <option value="5" ${dto.prdCatehoryNum==8 ? "selected='selected'" : ""}>외출</option>
			                <option value="6" ${dto.prdCatehoryNum==9 ? "selected='selected'" : ""}>장난감</option>
			                <option value="7" ${dto.prdCatehoryNum==10 ? "selected='selected'" : ""}>패션</option>
			                <option value="8" ${dto.prdCatehoryNum==11 ? "selected='selected'" : ""}>기타</option>
			            </select>
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userName}
			      </td>
			  </tr>

			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="prdContent" id="prdContent" style="width:95%; height: 270px;">${dto.prdContent}</textarea>
			      </td>
			  </tr>
			  
  			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="width: 97%; height: 25px;">
			       </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="submit" class="btn">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/store/seller';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.prdNum}">
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
			//alert("아싸!");
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
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    
    
</div>