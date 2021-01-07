<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<style type="text/css">
.ui-widget-header {
	background: none;
	border: none;
	height:35px;
	line-height:35px;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
}

.category-table input {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#ffffff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.category-table button {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#ffffff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.category-table input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.category-table select {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#ffffff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.category-table select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnSpanIcon {
	cursor: pointer;
}
</style>


<script type="text/javascript">
function sendOk() {
    var f = document.faqForm;

    if(! f.faqCategoryNum.value) {
        alert("카테고리를 선택하세요. ");
        f.faqCategoryNum.focus();
        return false;
    }
    
	var str = f.faqQuestion.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.faqQuestion.focus();
        return false;
    }

	var str = f.faqAnswer.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.faqAnswer.focus();
        return false;
    }
    
    f.action="${pageContext.request.contextPath}/doctor/faq/${mode}";
    return true;
}


function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return false;
			}	
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxJSON(url, method, query, fn) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

$(function(){
//카테고리 수정 모달창 띄우기
$("body").on("click", ".btnCategoryUpdate", function(){
	$("form[name=categoryForm]").each(function(){
		this.reset();
	});
	
	$("#category-dialog").dialog({
		  modal: true,
		  height: 500,
		  width: 500,
		  title: '카테고리 수정',
		  open : function(){
			var url="${pageContext.request.contextPath}/doctor/faq/listAllCategory?tmp="+(new Date()).getTime();
			$(".faqCategory-list").load(url);  
		  },
		  close: function(event, ui) {
			  $("form[name=faqForm] select[name=faqCategoryNum]").find('option').remove();

			  var url="${pageContext.request.contextPath}/doctor/faq/listCategory";
			  var query="mode=faqEnabled";
				
			  var fn=function(data) {
					$.each(data.faqCategoryName, function(index, item){
						var faqCategoryNum = item.faqCategoryNum;
						var faqCategoryName = item.faqCategoryName;
						var s = "<option value='"+faqCategoryNum+"'>"+faqCategoryName+"</option>";
						$("form[name=faqForm] select[name=faqCategoryNum]").append(s);
					});
					
					var mode="${mode}";
					if(mode=="update") {
						$("form[name=faqForm] select[name=faqCategoryNum]").val("${dto.faqCategoryNum}");
					}
			  };
			  ajaxJSON(url, "get", query, fn);				  

		  }
	});
});

//카테고리 등록하기
$("body").on("click", ".btnCategorySend", function(){	
	var $tr=$(this).closest("tr");
	var faqCategoryName = $tr.find("input[name=faqCategoryName]").val().trim();
	var faqEnabled = $tr.find("select[name=faqEnabled]").val().trim();
	var faqOrderNum = $tr.find("input[name=faqOrderNum]").val().trim();
	
	if(! faqCategoryName) {
		$tr.find("input[name=faqCategoryName]").focus();
		return false;
	}
	
	if(! /^[0-9]+$/.test(faqOrderNum)) {
		$tr.find("input[name=faqOrderNum]").focus();
		return false;
	}
	
	faqCategoryName = encodeURIComponent(faqCategoryName);
	var url="${pageContext.request.contextPath}/doctor/faq/insertCategory";
	var query="faqCategoryName="+faqCategoryName+"&faqEnabled="+faqEnabled+"&faqOrderNum="+faqOrderNum;
	
	var fn = function(data){
		// var state=data.state;
		$("form[name=categoryForm]").each(function(){
			this.reset();
		});
		
		url="${pageContext.request.contextPath}/doctor/faq/listAllCategory?tmp="+(new Date()).getTime();
		$(".faqCategory-list").load(url); 
	};
	
	ajaxJSON(url, "post", query, fn);
});

//카테고리 수정
$("body").on("click", ".btnUpdateIcon", function(){	
	var $tr=$(this).closest("tr");
	$tr.find("input").prop("disabled", false);
	$tr.find("select").prop("disabled", false);
	
	$tr.find(".btnUpdateIcon").hide();
	$tr.find(".btnDeleteIcon").hide();

	$tr.find(".btnUpdateOkIcon").show();
	$tr.find(".btnUpdateCancelIcon").show();
});

// 카테고리 수정 완료
$("body").on("click", ".btnUpdateOkIcon", function(){	
	var $tr=$(this).closest("tr");
	var faqCategoryNum = $tr.find("input[name=faqCategoryNum]").val();
	var faqCategoryName = $tr.find("input[name=faqCategoryName]").val().trim();
	var faqEnabled = $tr.find("select[name=faqEnabled]").val().trim();
	var faqOrderNum = $tr.find("input[name=faqOrderNum]").val().trim();
	
	if(! faqCategoryName) {
		$tr.find("input[name=faqCategoryName]").focus();
		return false;
	}
	
	if(! /^[0-9]+$/.test(faqOrderNum)) {
		$tr.find("input[name=faqOrderNum]").focus();
		return false;
	}
	
	faqCategoryName = encodeURIComponent(faqCategoryName);
	var url="${pageContext.request.contextPath}/doctor/faq/updateCategory";
	var query="faqCategoryNum="+faqCategoryNum+"&faqCategoryName="+faqCategoryName+"&faqEnabled="+faqEnabled+"&faqOrderNum="+faqOrderNum;
	
	var fn = function(data){
		var state=data.state;
		if(state=="false") {
			alert("카테고리 삭제가 불가능합니다.");
			return false;
		}
		
		url="${pageContext.request.contextPath}/doctor/faq/listAllCategory?tmp="+(new Date()).getTime();
		$(".faqCategory-list").load(url); 
	};
	
	ajaxJSON(url, "post", query, fn);
});


//카테고리 수정 취소
$("body").on("click", ".btnUpdateCancelIcon", function(){	
	var $tr=$(this).closest("tr");
	$tr.find("input").prop("disabled", true);
	$tr.find("select").prop("disabled", true);
	
	$tr.find(".btnUpdateOkIcon").hide();
	$tr.find(".btnUpdateCancelIcon").hide();

	$tr.find(".btnUpdateIcon").show();
	$tr.find(".btnDeleteIcon").show();
});

//카테고리 삭제
	$("body").on("click", ".btnDeleteIcon", function(){	
		var $tr=$(this).closest("tr");
		var faqCategoryNum = $tr.find("input[name=faqCategoryNum]").val();
		
		var url="${pageContext.request.contextPath}/doctor/faq/deleteCategory";
		var query="faqCategoryNum="+faqCategoryNum;
		
		var fn = function(data){
			url="${pageContext.request.contextPath}/doctor/faq/listAllCategory?tmp="+(new Date()).getTime();
			$(".faqCategory-list").load(url); 
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});




</script>

<div class="body-container boxText" style="width: 860px; margin-top: 70px; margin-bottom:50px; align:center; " >   

    <div>
		<form name="faqForm" method="post" onsubmit="return submitContents(this);">
		  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		
		  <tr align="left" height="50" style="border-top: 1px solid #71DA65; border-bottom: 1px solid #E4F7BA;"> 
		      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">카테고리</td>
		      <td style="padding-left:10px;"> 
		        <select name=faqCategoryNum class="selectField">
		        	<c:forEach var="vo" items="${listCategory}">
		        		<option value="${vo.faqCategoryNum}" ${dto.faqCategoryNum==vo.faqCategoryNum?"selected='selected'":""}>${vo.faqCategoryName}</option>
		        	</c:forEach>
		        </select>
		        
		        <button type="button" class="btn btnCategoryUpdate"> 변경 </button>
		      </td>
		  </tr>
		
		  <tr align="left" height="45" style="border-top: 1px solid #E4F7BA; border-bottom: 1px solid #E4F7BA;"> 
		      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		      <td style="padding-left:10px;"> 
		        <input type="text" name="faqQuestion" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.faqQuestion}">
		      </td>
		  </tr>
		
		  <tr align="left" height="45" style="border-bottom: 1px solid #E4F7BA;"> 
		      <td width="100" bgcolor="#E4F7BA" style="text-align: center;">작성자</td>
		      <td style="padding-left:10px;"> 
		          ${sessionScope.member.userName}
		      </td>
		  </tr>
		
		  <tr align="left" style="border-bottom: 1px solid #71DA65;"> 
		      <td width="100" bgcolor="#E4F7BA" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		        <textarea name="faqAnswer" id="faqAnswer" rows="12" class="boxTA" style="width: 95%;">${dto.faqAnswer}</textarea>
		      </td>
		  </tr>
		  </table>
		
		  <table style="width: 100%; margin: 25px auto; border-spacing: 0px; ">
		     <tr height="45"> 
		      <td align="center" >
		        <p style="float: left;"><button type="reset" class="btn">새로고침</button>
		         <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/faq/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		        </p>
		        <p style="float: right;" >
		        <button type="submit" class="btn">${mode=='update'?'수정완료':'등록하기'}</button>
		        </p>
		        
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="faqNum" value="${dto.faqNum}">
		        	 <input type="hidden" name="page" value="${page}">
		        </c:if>
		      </td>
		    </tr>
		  </table>
		</form>
		
	
		<div id="category-dialog" style="display: none;">
			<form name="categoryForm" method="post">
				<table class="category-table" style="width: 100%; margin: 0px auto; border-spacing: 1px; background:#999; ">
				  <thead>
					  <tr align="center" bgcolor="#71DA65" height="50"> 
					      <th width="170" style="color: #787878;">카테고리</th>
					      <th width="90" style="color: #787878;">활성</th>
					      <th width="80" style="color: #787878;">출력순서</th>
					      <th style="color: #787878;">변경</th>
					  </tr>
				  </thead>
				  <tbody class="category-input">
					  <tr align="center" height="40" bgcolor="#fff">
					  	<td> <input type="text" name="faqCategoryName"> </td>
					  	<td>
					  		<select name="faqEnabled">
					  			<option value="1">활성</option>
					  			<option value="0">비활성</option>
					  		</select>
					  	</td>
					  	<td> <input type="text" name="faqOrderNum"> </td>
					  	<td> <button type="button" class="btnCategorySend">등록하기</button> </td>
					  </tr>
				  </tbody>
				  <tfoot class="faqCategory-list">
				  </tfoot>
				</table>
			</form>
		</div>
		
	</div>
</div>	



<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "faqAnswer",
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
	oEditors.getById["faqAnswer"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["faqAnswer"].getIR();
	alert(sHTML);
}

function submitContents(elClickedObj) {
	oEditors.getById["faqAnswer"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		// elClickedObj.form.submit();
		return sendOk();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["faqAnswer"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
