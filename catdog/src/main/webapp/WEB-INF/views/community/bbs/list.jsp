<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
	
	function arrayList(f) {
		f.action="${pageContext.request.contextPath}/community/board/list";
		f.submit();
	}
	
	
</script>

<div class="body-container">
	<div class="board">
		<div class="boardtitle">
			<ul class="listtitle">
				<li>자유게시판</li>
			</ul>
		</div>
		<div class="boardoption">
			<div>
				<form action="arrayForm" action="${pageContext.request.contextPath}/community/board/list" method="post">
					<select name="array" onchange="arrayList(this.form);">
						<option value="news" ${array=="news"?"selected='selected'":""}>최신순</option>
						<option value="hits" ${array=="hits"?"selected='selected'":""}>조회순</option>
						<option value="likes" ${array=="likes"?"selected='selected'":""}>추천순</option>
						<option value="replys" ${array=="replys"?"selected='selected'":""}>댓글순</option>
					</select>
				</form>
			</div>
		</div>
		<div class="boardlist">
			<ul class="listheader">
				<li class="td">글번호</li>
				<li class="td1">제목</li>
				<li class="td2">글쓴이</li>
				<li class="td2">작성일</li>
				<li class="td">조회수</li>
				<li class="td">추천수</li>
			</ul>
			<c:forEach var="dto" items="${list}">
			<ul class="tr">
				<li class="td">${dto.num}</li>
				<li class="td1"><a href="${pageContext.request.contextPath}/community/board/article?page=${page}&freeNum=${dto.freeNum}">${dto.freeSubject}</a>
					<c:if test="${dto.replyCount!=0}">
						<span class="replyCnt"> [${dto.replyCount}] </span>
					</c:if>
				</li>
				<li class="td2">${dto.userNick}</li>
				<li class="td2">${dto.freeCreated}</li>
				<li class="td">${dto.freeHitCount}</li>
				<li class="td">${dto.boardLikeCount}</li>
			</ul>
			</c:forEach>
		</div>
		<div>
			<p> ${dataCount==0?"등록된 게시물이 없습니다.":paging} </p>
		</div>
		<div class="listfooter fleabtn">
			<a type="button" class="mybtn1" href="javascript:location.href='${pageContext.request.contextPath}/community/board/list'">새로고침</a>
			<form name="searchForm" action="${pageContext.request.contextPath}/community/board/list" method="post">
				<select name="condition">
					<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
					<option value="writer" ${condition=="writer"?"selected='selected'":""}>작성자</option>
					<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
					<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
				</select>
				<input type="text" name="keyword" value="${keyword}">
				<button type="button" class="mybtn1" onclick="searchList();">검색</button>
			</form>
			<a type="button" class="mybtn1 floatright" href="${pageContext.request.contextPath}/community/board/created">글쓰기</a>
		</div>
	</div>
</div>
