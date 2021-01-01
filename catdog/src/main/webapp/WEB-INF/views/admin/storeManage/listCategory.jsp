<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainht.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>

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

function ajaxFun(url, method, dataType, query, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status == 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList(){
	var f = document.searchForm;
	//f.prdPet.value=$("#selectPrdPet").val();
	//f.prdState.value=$("#selectPrdState").val();
	f.action="${pageContext.request.contextPath}/admin/storeManage/listCategory";
	f.submit();
}


function deleteArticle(num){
	var url = "${pageContext.request.contextPath}/delete/";

	if(confirm("선택한 게시물을 삭제하시겠습니까?")){
		location.href=url;
		
	}
}

$(function(){
	$("body").on("click", ".btnCategoryAdd", function(){
		$("form[name=categoryForm]").each(function(){
			this.reset();
		});
		
		$("#category-dialog").dialog({
			modal:true,
			height:500,
			width:500,
			title:'카테고리 수정',
			open: function(){
				var url="${pageContext.request.contextPath}/admin/storeManage/listAllCategory";
				$(".category-list").load(url);
			},
			close:function(event, ui){
				searchList();
			}
		});
	});
	
	//카테고리 등록
	$("body").on("click", ".btnCategorySend", function(){
		var $tr=$(this).closest("tr");
		var category=$tr.find("input[name=prdCategoryName]").val().trim();
		var enabled=$tr.find("select[name=enabled]").val().trim();
		var orderNo=$tr.find("input[name=orderNo]").val().trim();
		
		if(! category){
			$tr.find("input[name=prdCategoryName]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)){
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		var url="${pageContext.request.contextPath}/admin/storeManage/insertCategory";
		var query="prdCategoryName="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		
		var fn=function(data){
			$("form[name=categoryForm]").each(function(){
				this.reset();
			});
			
			url="${pageContext.request.contextPath}/admin/storeManage/listAllCategory";
			$(".category-list").load(url);
		};
		
		ajaxFun(url, "post", "json", query, fn);
	});
	
	//카테고리 수정
	$("body").on("click", ".btnUpdateIcon", function(){
		var $tr=$(this).closest("tr");
		$tr.find("input").prop("disabled",false);
		$tr.find("select").prop("disabled",false);
		
		$tr.find(".btnUpdateIcon").hide();
		$tr.find(".btnDeleteIcon").hide();
		
		$tr.find(".btnUpdateOkIcon").show();
		$tr.find(".btnUpdateCancelIcon").show();
	});
	
	//카테고리 수정 완료
	$("body").on("click", ".btnUpdateOkIcon", function(){
		var $tr=$(this).closest("tr");
		var categoryNum=$tr.find("input[name=prdCategoryNum]").val().trim();
		var category=$tr.find("input[name=prdCategoryName]").val().trim();
		var enabled=$tr.find("select[name=enabled]").val().trim();
		var orderNo=$tr.find("input[name=orderNo]").val().trim();
		
		if(! category){
			$tr.find("input[name=prdCategoryName]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)){
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		var url="${pageContext.request.contextPath}/admin/storeManage/updateCategory";
		var query="prdCategoryNum="+categoryNum+"&prdCategoryName="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		
		var fn=function(data){
			var state=data.state;
			if(state=="false"){
				alert("카테고리 수정이 불가능합니다.");
				return false;
			}
			
			url="${pageContext.request.contextPath}/admin/storeManage/listAllCategory";
			$(".category-list").load(url);
		};
		
		ajaxFun(url, "post", "json", query, fn);
	});
	
	//카테고리 수정 취소
	$("body").on("click", ".btnUpdateCancelIcon", function(){
		var $tr=$(this).closest("tr");
		$tr.find("input").prop("disabled",false);
		$tr.find("select").prop("disabled",false);
		
		$tr.find(".btnUpdateOkIcon").hide();
		$tr.find(".btnUpdateCancelIcon").hide();
		
		$tr.find(".btnUpdateIcon").show();
		$tr.find(".btnDeleteIcon").show();
		
	});
	
	//카테고리 삭제
	$("body").on("click", ".btnDeleteIcon", function(){
		var $tr=$(this).closest("tr");
		var categoryNum=$tr.find("input[name=prdCategoryNum]").val().trim();
		
		var url="${pageContext.request.contextPath}/admin/storeManage/deleteCategory";
		var query="prdCategoryNum="+categoryNum;
		
		var fn=function(data){
			var state=data.state;
			if(state=="false"){
				alert("카테고리 삭제가 불가능합니다.");
				return false;
			}
			
			url="${pageContext.request.contextPath}/admin/storeManage/listAllCategory";
			$(".category-list").load(url);
		};
		ajaxFun(url, "post", "json", query, fn);
	});
});
</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
	     <div class="mypage2">
	     	<div class="mypagetab">
	     		<p>상품 카테고리 관리</p>
	     	</div>
	     
     <div>
	     <div class="tab-content" style="clear: both; padding: 10px 10px 10px;">
	     	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${categoryCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
			          <button class="mybtn2 btnCategoryAdd" type="button">변경</button>
			      </td>
			   </tr>
			</table>
			
			<table class="listtable1" style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <thead>
	               <tr align="center"  height="35" style="padding: 0"> 
				      <th style="width: 40px; color: #787878; padding: 15px 25px;">출력순서</th>
				      <th style="width: 250px; color: #787878; padding: 15px 25px;">카테고리이름</th>
				      <th style="width: 40px; color: #787878; padding: 15px 25px;">상태</th>			        	    
				  </tr>
			 </thead>
			 
			 <tbody class="board-list">
			 <c:forEach var="dto" items="${list}">
				  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0;">${dto.orderNo}</td>
				      <td style="padding: 0;">${dto.prdCategoryName}</td>
				      <td style="padding: 0;">${dto.enabled=="1" ? "활성":"비활성"}</td>
				  </tr>
			</c:forEach>
			</tbody>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					${categoryCount==0?"등록된 자료가 없습니다.":paging} 
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/storeManage/listCategory';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="${pageContext.request.contextPath}/admin/storeManage/listCategory" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="subject"     ${condition=="subject" ? "selected='selected'":""}>글제목</option>
			            	  <option value="created"     ${condition=="created" ? "selected='selected'":""}>작성일</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="page" value="1">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">&nbsp;</td>
			   </tr>
			</table>
	     </div>
			
			
     </div>
     </div>
	</div>
</div>
<div id="category-dialog" style="display: none;">
	<form name="categoryForm" method="post">
		<table class="category-table" style="width: 100%; margin: 0px auto; border-spacing: 1px; background:#999; ">
			<thead>
				<tr align="center" bgcolor="#eeeeee" height="35">
					<th width="170" style="color: #787878;">카테고리</th>
					<th width="90" style="color: #787878;">활성</th>
					<th width="80" style="color: #787878;">출력순서</th>
					<th style="color: #787878;">변경</th>
				</tr>
			</thead>
			<tbody class="category-input">
				<tr align="center" height="30" bgcolor="#fff">
					<td><input type="text" name="prdCategoryName"></td>
					<td>
						<select name="enabled">
							<option value="1">활성</option>
							<option value="2">비활성</option>
						</select>
					</td>
					<td><input type="text" name="orderNo"></td>
					<td><button type="button" class="btnCategorySend">등록</button> </td>
				</tr>
			</tbody>
			<tfoot class="category-list">
			</tfoot>
		</table>
	</form>
</div>