<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {
	$("body").on("click", "input[name=array]", function() {
		var array=$(this).val();
		var url="${pageContext.request.contextPath}/community/photo/list";
		var query="?page=1&array="+array;
		
		location.href=url+query;
	});
	
	$("input[name=array]:checked").next("span").attr("class", "arraychecked");
});

</script>
<div class="body-container">
    <div class="board">
    	<div class="boardtitle">
			<ul class="listtitle">
				<li>PHOTO</li>
			</ul>
		</div>
		<div class="photoLayout">
			<div class="photoFilter">
				<div class="floatleft">
					<p>게시물 <span>${dataCount}</span>개</p>
				</div>
				<div class="floatright">
				<form action="arrayForm" action="${pageContext.request.contextPath}/community/board/list" method="post">					
					<div>
						<label><input type="radio" name="array" value="news" ${array=="news"?"checked='checked'":""}><span>최신순</span></label>
						<label><input type="radio" name="array" value="likes" ${array=="likes"?"checked='checked'":""}><span>추천순</span></label>
						<label><input type="radio" name="array" value="hits" ${array=="hits"?"checked='checked'":""}><span>조회순</span></label>
						<label><input type="radio" name="array" value="replys" ${array=="replys"?"checked='checked'":""}><span>댓글순</span></label>
					</div>
				</form>
				</div>
			</div>
			<div id="photo-content">
				<c:forEach var="vo" items="${list}">
					<div class="photolist">
						<div>
							<div class="photolist-img">
								<a href="${pageContext.request.contextPath}/community/photo/article?page=${page}&photoNum=${vo.photoNum}">
									<img src="${pageContext.request.contextPath}/uploads/photo/${vo.photoImgSavename}">
								</a>
							</div>
						</div>
						<div class="photoInfo">
							<ul>
								<li style="font-weight: bold; font-size: 24px;">
								<a style="vertical-align: middle;" href="${pageContext.request.contextPath}/community/photo/article?page=${page}&photoNum=${vo.photoNum}">${vo.photoSubject}</a>
								</li>
							</ul>
							<ul>
								<li style="color:#a2a2a2; font-size: 13px;">
									${vo.photoCreated}
								</li>
							</ul>
							<ul class="photocm">
								<li>
									<i class="far fa-heart unlike"> <span id="photoLikeCount">${vo.photoLikeCount}</span> </i>
									<i class="far fa-eye"><span class=""> ${vo.photoHitCount} </span> </i>
									<i class="far fa-comments"><span> ${vo.replyCount} </span></i>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div>
			<p> ${dataCount==0?"등록된 게시물이 없습니다.":paging} </p>
		</div>
		<div class="fleabtn listfooter" style="margin-top: 30px;">
			<a type="button" class="mybtn1" href="javascript:location.href='${pageContext.request.contextPath}/community/photo/list'">새로고침</a>
			<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/photo/created">사진 올리기</a>
		</div>
    </div>
</div>