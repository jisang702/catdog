<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function commas(t) {
	var x = t.value;		
    x = x.replace(/,/gi, '');

    var regexp = /^[0-9]*$/;
    if(!regexp.test(x)){ 
    	$(t).val(""); 
    	alert("숫자만 입력 가능합니다.");
    } else {
    	x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
    	$(t).val(x);			
    }
}
</script>
<div class="body-container">
    <div class="board">
    	<div class="boardtitle">
			<ul class="listtitle">
				<li>중고거래</li>
			</ul>
		</div>
		<div class="fleaLayout">
			<c:forEach var="dto" items="${list}">
			<div class="fleamarket">
				<div>
					<div class="fleamarket-img">
						<a href="${pageContext.request.contextPath}/community/deal/article?page=${page}&dealNum=${dto.dealNum}">
						<c:choose>
							<c:when test="${not empty dto.imgFileName}">
								<img src="${dto.imgFileName}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/css/images/noimage.gif">
							</c:otherwise>
						</c:choose>
						<c:if test="${dto.dealState==3}">							
							<div class="listimg-cover">
								<div>거래완료</div>
							</div>
						</c:if>
						</a>
					</div>
				</div>
				<div>
					<ul>
						<li style="font-weight: bold; font-size: 20px;"><a href="${pageContext.request.contextPath}/community/deal/article?page=${page}&dealNum=${dto.dealNum}">${dto.dealSubject}</a></li>
					</ul>
					<ul>
						<li class="dealCreated" style="color:#a2a2a2;">
							${dto.dealCreated}
						</li>
					</ul>
					<ul class="fleaprice">
						<li>
							<i class="far fa-eye"><span class=""> ${dto.dealHitCount} </span> </i>
							<i class="far fa-comments"><span class=""> 0 </span> </i>
						</li>
						<li style="font-weight: bold; font-size:24px; color:#71da65;">${dto.dealPrice}원</li>
					</ul>
				</div>
			</div>
			</c:forEach>
		</div>
		<div>
			<p> ${dataCount==0?"등록된 게시물이 없습니다.":paging} </p>
		</div>
		<div class="fleabtn">
			<a type="button" class="mybtn1">맨위로</a>
			<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/deal/created">글쓰기</a>
		</div>
    </div>
</div>