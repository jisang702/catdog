<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

</style>

<script type="text/javascript">
function sendOk(mode, page){
	var f = document.faqForm;
	
	var faqCateNum=f.faqCateNum.value;
	if(! faqCateNum){
		alert("카테고리를 선택하세요.");
		f.faqCateNum.focus();
		return;
	}
	
	var faqQuestion=f.faqQuestion.value;
	if(! faqQuestion){
		alert("질문을 입력하세요.");
		f.faqQuestion.focus();
		return;
	}
	
	var faqAnswer=f.faqAnswer.value;
	if(! faqAnswer){
		alert("답변을 입력하세요.");
		f.faqAnswer.focus();
		return;
	}
	
	var url="${pageContext.request.contextPath}/customer/faq/${mode}";
	var query=$("form[name=faqForm]").serialize();
	
	var fn = function(data){
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
	
	ajaxJSON(url, "post", query, fn);
}
</script>

<script type="text/javascript">

$(function(){
	//카테고리 수정 대화상자
	$("body").on("click", ".btnCategoryUpdate", function(){
		$("form[name=categoryForm]").each(function(){
			this.reset();
		});
		
		$("#category-dialog").dialog({
			modal:true,
			height:500,
			width:500,
			title:'카테고리 수정',
			open:function(){
				var url="${pageContext.request.contextPath}/customer/faq/listAllCategory?tmp="+(new Date()).getTime();
				$(".category-list").load(url);
			}
		});
	});
});

</script>

<form name="faqForm" method="post">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">유&nbsp;&nbsp;&nbsp;&nbsp;형</td>
      		<td style="padding-left:10px;">
      			<select name="faqCateNum" class="selectField">
      				<c:forEach var="vo" items="${listCategory}">
      					<option value="${vo.faqCateNum}" ${vo.faqCateNum==dto.faqCateNum ? "selected='selected' ":""}>${vo.faqCateName}</option>
      				</c:forEach>
      			</select>
      			
      			<button type="button" class="mybtn btnCategoryUpdate">변경</button>
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
      		<td style="padding-left:10px;">
      			<input type="text" name="faqQuestion" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.faqQuestion}">
      		</td>
		</tr>
		
		<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			<td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			<td style="padding-left:10px;">
				${sessionScope.member.userNick}
			</td>
		</tr>
		
		<tr align="left" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		      	<textarea name="faqAnswer" rows="12" class="boxTA" style="width: 95%;">${dto.faqAnswer}</textarea>
		      </td>
		</tr>
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="45">
			<td align="center">
				<button type="button" class="btn" onclick="sendOk('${mode}','${page}');">${mode=='update'?'수정하기':'등록하기'}</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="sendCancel('${page}');">${mode=='update' ? '수정취소':'등록취소' }</button>
				 <c:if test="${mode=='update' }">
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
				<tr align="center" bgcolor="#eeeeee" height="35">
					<td width="170" style="color: #787878">카테고리</td>
					<td width="90" style="color: #787878">활성</td>
					<td width="80" style="color: #787878">출력순서</td>
					<td style="color: #787878">변경</td>
				</tr>
			</thead>
			<tbody class="category-input">
				<tr align="center" height="30" bgcolor="#fff">
					<td><input type="text" name="faqCateName"> </td>
					<td>
						<select name="faqEnabled">
							<option value="1">활성</option>
							<option value="0">비활성</option>
						</select>
					</td>
					<td><input type="text" name="faqOrderNum"> </td>
					<td><button type="button" class="btnCategorySend">등록하기</button> </td>
				</tr>
			</tbody>
			<tfoot class="category-list">
			</tfoot>
		</table>
	</form>
</div>
