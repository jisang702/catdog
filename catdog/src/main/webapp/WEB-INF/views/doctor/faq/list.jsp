<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Signika:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/doctor.css">

<style type="text/css">
.body-container {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
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

setInterval(function(){
	  $(".blinkEle").toggle();
	}, 1000);
</script>

	<div class="body-container boxText" style="width: 900px; margin-top: 70px; margin-bottom:50px; align:center; " >
		<h2><i class="fas fa-question"></i>&nbsp;자주 하는 질문&nbsp;</h2>
		<p>궁금한 내용을 검색해보세요</p>
  
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
    
    <table style="width: 100%; margin: 50px auto 0px; border-spacing: 0px; margin-bottom: 8px;">
		<tr height="35" style="margin-bottom: 30px;">
			<td align="left" width="50%">
			<p>	${dataCount}개(${page}/${total_page} PAGE) </p> </td>
			<td align="right">&nbsp;</td>
			<td align="right">
				<button type="button" class="sendBtn" 
				onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/qna/list';"><b class="blinkEle"> 1:1 문의하기 </b></button>
			</td>
		</tr>
	</table>    
		
	
	<table style="width: 100%; height: 100%; border-spacing: 0px; border-collapse: collapse;">
			<c:forEach var="dto" items="${list}">
			<tr height="55" class="question">
				<td width="150" style="padding-left: 5px; border:1px solid #E4F7BA; border-right:none; background-color: #E4F7BA;">
					<h3>${dto.faqCategoryName}</h3>
				</td>
				<td align="left" class="question-subject" style="padding-right: 5px; border:1px solid #E4F7BA; border-left:none; font-size: 15px;">
					&nbsp;&nbsp;&nbsp;<b><i class="fab fa-quora" style="color:#71DA65;"></i></b>&nbsp;&nbsp;<a href="#">${dto.faqQuestion}</a>
				</td>
			</tr>
			<tr height="55" class="answer">
				<td colspan="2" style="padding: 30px; border:1px solid #E4F7BA; border-top:none;" align="left" >
					<div style="min-height: 50px;">
						 &nbsp;&nbsp; ${dto.faqAnswer}</div>
						<c:if test="${sessionScope.member.userId=='admin'}">
							<div style="padding-top: 5px; text-align: right;">
								<a onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/faq/update?faqNum=${dto.faqNum}&page=${page}';">
								<b><i class="far fa-edit" style="color:#71DA65;" ></i></b></a> &nbsp;&nbsp;|&nbsp;&nbsp;
								<a onclick="deleteFaq('${dto.faqNum}', '${page}');"><i class="far fa-trash-alt" style="color:#71DA65;"></i></a>
							</div>
						</c:if>
				</td>
			</tr>
			<tr height="3">
				<td colspan="2"></td>
			</tr>
		</c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 20px auto; border-spacing: 0px;">
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
		          <button type="button" class="sendBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/faq/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
	</div>

