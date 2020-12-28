<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

</script>
<div class="body-container">
    <div class="board">
    	<div class="boardtitle">
			<ul class="listtitle">
			</ul>
		</div>
		<div class="fleaLayout">
			<c:forEach var="dto" items="${list}">
			<div class="fleamarket">
				<div>
					<div class="fleamarket-img">
						<a href="#photoModal1" rel="modal:open">
							<img src="${pageContext.request.contextPath}/uploads/photo/${dto.photoImgSavename}">
						</a>
					</div>
				</div>
				<div>
					<ul>
						<li style="font-weight: bold; font-size: 20px;">
						<a style="vertical-align: middle;" href="${pageContext.request.contextPath}/community/photo/article?page=${page}&photoNum=${dto.photoNum}">${dto.photoSubject}</a>
						</li>
					</ul>
					<ul>
						<li class="photoCreated" style="color:#a2a2a2;">
							${dto.photoCreated}
						</li>
					</ul>
					<ul class="fleaprice">
						<li>
							<i class="far fa-eye"><span class=""> ${dto.photoHitCount} </span> </i>
							<i class="far fa-comments"><span class="">  </span> </i>
						</li>
					</ul>
				</div>
			</div>
			</c:forEach>
		</div>
		<div>
			<p> ${dataCount==0?"등록된 게시물이 없습니다.":paging} </p>
		</div>
		<div class="fleabtn listfooter" style="margin-top: 30px;">
			<a type="button" class="mybtn1" href="javascript:location.href='${pageContext.request.contextPath}/community/photo/list'">새로고침</a>
			<form name="searchForm" action="${pageContext.request.contextPath}/community/photo/list" method="post">
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
			<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/photo/created">글쓰기</a>
		</div>
    </div>
</div>

<div id="photoModal1" class="modal">
	<div>
		<ul>
			<li>사진</li>
		</ul>
	</div>
</div>