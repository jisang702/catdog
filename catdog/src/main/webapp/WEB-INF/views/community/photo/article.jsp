<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="body-container">
    <div class="board">
    	<div class="photoArticle">
			<div class="photoImg">
				<img src="${pageContext.request.contextPath}/uploads/photo/${dto.photoImgSavename}">
			</div>
			<div class="photoArea">
				<div class="photoprofile">
					<ul class="photoSubject">
						<li>${dto.photoSubject}</li>
					</ul>
					<ul class="photoUser">
						<li><i class="fas fa-crown">${dto.userNick}</i></li>
					</ul>
					<ul class="photoCreated" style="display: flex">
						<li>${dto.photoCreated} | 조회수 ${dto.photoHitCount}</li>
						<li>
							<button>수정</button>
							<button>삭제</button>
						</li>
					</ul>
					<ul><li style="text-align: center;">
						<button type="button" class="photobtn">
							<i class="far fa-heart unlike"> 0 </i>
						</button>				
						<button type="button" class="photobtn">
							<i class="fas fa-share"></i>
						</button>
					</li></ul>
				</div>
				<div class="photoContent">
					${dto.photoSubject}
				</div>
				<div class="photoReply">
					<ul>
						<li>댓글(0)</li>
					</ul>
					<ul style="min-height: 70px;">
						
					</ul>
					<input type="text"><button type="button" class="photoReplybtn">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>