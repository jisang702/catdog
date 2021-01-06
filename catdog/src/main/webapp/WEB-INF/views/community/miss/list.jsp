<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function searchList() {
	var f=document.searchForm;
	f.submit();
}

function whereList(f) {
	f.action="${pageContext.request.contextPath}/community/miss/list";
	f.submit();
}

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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

$(function() {
	var area0 = ["전국","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];

	$("select[name^=where]").each(function() {
		  $selsido = $(this);
		  $.each(eval(area0), function() {
		   $selsido.append("<option value='"+this+"'>"+this+"</option>");
		  });
	});
})
</script>
<div class="body-container">
    <div class="board">
    	<div class="boardtitle">
			<ul class="listtitle">
				<li>
					실종게시판
				</li>
			</ul>
		</div>
		<div class="missBody">
			<div class="selectMiss">
				<ul>
					<li>
						<form action="whereForm" action="${pageContext.request.contextPath}/community/miss/list" method="post">
							<select name="where" onchange="whereList(this.form);">
							</select>
						</form>
					</li>
				</ul>
			</div>
			<c:forEach var="dto" items="${list}">
			<div class="missList">
				<ul>
					<li style="width: 5%;">${dto.num}</li>
					<li><img src="${pageContext.request.contextPath}/uploads/miss/${dto.petImg}"></li>
					<li style="width: 65%;">
						<div class="missPetInfo">
							<ul><li style="font-size: 16px;">
								<a href="${pageContext.request.contextPath}/community/miss/article?page=${page}&missNum=${dto.missNum}">
									${dto.missSubject}
								</a><span style="color: #71da65; font-weight: bold;"> [${dto.replyCount}]</span>
							</li></ul>
							<ul>
								<li>${dto.petName}</li>
								<li>(${dto.petAge}) / </li>
								<li>${dto.petGender}</li>
							</ul>
							<ul>
								<li><i class="fas fa-map-marker-alt"></i> ${dto.missWhere} |</li>
								<li>${dto.missWhen} 실종</li>
							</ul>
						</div>
					</li>
					<li style="width: 10%;">${dto.missCreated}</li>
					<li style="width: 5%;">${dto.missHitCount}</li>
				</ul>
			</div>
			</c:forEach>
		</div>		
		<div style="margin: 20px;">
			<p> ${dataCount==0?"<p style=\"margin: 100px;\">등록된 게시물이 없습니다.</p>":paging} </p>
		</div>
		<div class="fleabtn listfooter" style="margin-top: 30px;">
			<a type="button" class="mybtn1" href="javascript:location.href='${pageContext.request.contextPath}/community/miss/list'">새로고침</a>
			<form name="searchForm" action="${pageContext.request.contextPath}/community/miss/list" method="post">
				<span>
					<select name="condition">
						<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
						<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
						<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
					</select>
					<input type="text" name="keyword" value="${keyword}">
					<button type="button" class="mybtn1" onclick="searchList();">검색</button>
				</span>
			</form>
			<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/miss/created">글쓰기</a>
		</div>
    </div>
</div>