<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
$(function(){
	$(".answer").hide();
	$(".question").each(function(index){
		$(this).click(function(){
			var isHidden = $(".answer").eq(index).is(':hidden');
			$(".answer").hide();
			
			if(isHidden) {
				$(".answer").eq(index).show();
			} else {
				$(".answer").eq(index).hide();
			}
		});
	});
});

<c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
function deleteFaq(faqNum) {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="${pageContext.request.contextPath}/doctor/faq/delete?faqNum="+faqNum+"&page=1";
		location.href=url;
	}
}
</c:if>

function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>

<div class="body-container" style="width: 800px; margin-top: 50px;" >
    <div class="body-title">
        <h3><i class="fas fa-exclamation-triangle"></i> 자주하는 질문 </h3>
    </div>

    
    <c:forEach var="vo" items="${listAllCategory}">
	  <tr align="center" height="30" bgcolor="#fff">
	  	<td> <input type="text" name="faqCategoryName" disabled="disabled" value="${vo.faqCategoryName}"> </td>
	  	<td>
	  		<select name="faqEnabled" class="selectField" disabled="disabled">
	  			<option value="1" ${vo.enabled==1?"selected=selected":"" }>활성</option>
	  			<option value="0" ${vo.enabled==0?"selected=selected":"" }>비활성</option>
	  		</select>
	  	</td>
	  	<td> <input type="text" name="faqOrderNum" disabled="disabled" value="${vo.faqOrderNum}"> </td>
	  	<td>
	  		<input type="hidden" name="faqCategoryNum" value="${vo.faqCategoryNum}">
	  		<span class="btnSpanIcon btnUpdateIcon" title="수정"><i class="far fa-edit"></i></span>
	  		<span class="btnSpanIcon btnDeleteIcon" title="삭제"><i class="far fa-trash-alt"></i></span>
	  		<span class="btnSpanIcon btnUpdateOkIcon" title="수정완료" style="display: none;"><i class="fas fa-check-circle"></i></span>
	  		<span class="btnSpanIcon btnUpdateCancelIcon" title="수정취소" style="display: none;"><i class="fas fa-undo"></i></span>
	  	</td>
	  </tr>
  </c:forEach>
    
	<div>    
		<table style="width: 100%; margin: 20px auto 0; border-spacing: 0px; border-collapse: collapse;">
		 
		<c:forEach var="dto" items="${list}">
			<tr height="35" class="question" bgcolor="#eeeeee">
				<td width="120" style="padding-left: 5px; border:1px solid #cccccc; border-right:none;">
					${dto.faqCategoryName}
				</td>
				<td align="left" class="question-subject" style="padding-right: 5px; border:1px solid #cccccc; border-left:none;">
					| <a href="#">${dto.faqQuestion}</a>
				</td>
			</tr>
			<tr height="50" class="answer">
				<td colspan="2" style="padding: 5px; border:1px solid #cccccc; border-top:none;" align="left">
					<div style="min-height: 50px;">${dto.faqAnswer}</div>
						<c:if test="${sessionScope.member.userId=='admin'}">
							<div style="padding-top: 5px; text-align: right;">
								<a onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/faq/update?faqNum=${dto.faqNum}&page=${page}';">수정</a>&nbsp;|
								<a onclick="deleteFaq('${dto.faqNum}', '${page}');">삭제</a>
							</div>
						</c:if>
				</td>
			</tr>
			<tr height="3">
				<td colspan="2"></td>
			</tr>
		</c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="reloadFaQ();">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="" method="post">
		              <select id="condition" name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="faqQuestion" ${condition=="faqQuestion"?"selected='selected'":""}>제목</option>
		                  <option value="faqAnswer" ${condition=="faqAnswer"?"selected='selected'":""}>내용</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <input type="hidden" name="rows" value="${rows}">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		      	<c:if test="${sessionScope.member.userType==2}">
		        </c:if>
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/faq/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
	</div>
</div>
