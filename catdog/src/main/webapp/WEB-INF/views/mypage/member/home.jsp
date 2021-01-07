<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage">
			<div class="mypagetab">
					<p>${userName}님의 MyPage</p>
			</div>
			<div class="mypagesub1">
				<ul class="mypagesub2">
					<li>등급</li>
					<li>포인트</li>
					<li>주문내역</li>
					<li>문의내역</li>
				</ul>
				<ul>
					<li>level 1</li>
					<li>${pointSum} P</li>
					<li>10</li>
					<li>${QnaCount}</li>
				</ul>
			</div>
		</div>
		<div class="mypage1">
			<div class="mypagetab">
				<p>My Pet</p>
				<button type="button" class="mybtn1" onclick="location.href='${pageContext.request.contextPath}/mypage/mypet';">더보기</button>	
			</div>
			<div class="mypagelist">
				<div>
					<ul class="petphoto" style="text-align: left;">
						<c:forEach var="vo" items="${petlist}">
						<li><a href="#">
								<img style="width: 170px; height: 170px;" src="${pageContext.request.contextPath}/uploads/pet/${vo.petImgName}">							
						</a></li>
					</c:forEach>
					</ul>	
				</div>		
			</div>
		</div>
		<div class="mypage1">
			<div class="mypagetab">
				<p>게시글</p>
				<button type="button" class="mybtn1" onclick="location.href='${pageContext.request.contextPath}/mypage/list';">더보기</button>	
			</div>
			<div class="mypagelist">
				<c:forEach var="dto" items="${list}">
				<ul class="mypageBoard">
					<li style="color: #71da65; font-weight: bold;">
					<c:choose>
						<c:when test="${dto.boardType=='free'}">[자유게시판]</c:when>
						<c:when test="${dto.boardType=='photo'}">[포토갤러리]</c:when>
						<c:when test="${dto.boardType=='miss'}">[찾아주세요]</c:when>
						<c:when test="${dto.boardType=='deal'}">[중고장터]</c:when>
					</c:choose>
					</li>
					<li style="color: #353535; font-weight: 100;">${dto.subject}
					</li>
					<li style="font-size: 12px;">${dto.created}</li>
				</ul>
				</c:forEach>
			</div>
		</div>
		<div class="mypage1">
			<div class="mypagetab">
				<p>문의내역</p>
				<button type="button" class="mybtn1" onclick="location.href='${pageContext.request.contextPath}/mypage/qna';">더보기</button>	
			</div>
			<div class="mypagelist">
				<c:forEach var="dto" items="${listQna}">
				<ul class="mypageBoard">
					<li style="color: #71da65; font-weight: bold;">
						[${dto.boardType}]
					</li>
					<li style="color: #353535; font-weight: 100;">${dto.subject}
					</li>
					<li style="font-size: 12px;">${dto.created}</li>
				</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
