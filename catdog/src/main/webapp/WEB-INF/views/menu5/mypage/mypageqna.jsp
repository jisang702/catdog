<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypagemenu">
			<ul>
				<li>My Pet</li>
				<li>글목록</li>
				<li>등급/포인트 내역</li>
				<li>장바구니/주문현황</li>
				<li>문의내역</li>
				<li>회원정보수정</li>
			</ul>
		</div>
		<div class="mypage2">
			<div class="mypagetab">
				<p>문의내역</p>
				<button type="button" class="mybtn1">1:1문의</button>
				<button type="button" class="mybtn1">수의사 QnA</button>
			</div>
			<div class="mypagelist">
				<ul id="listtab">					
					<li class="td1">카테고리</li>
					<li class="td2">제목</li>
					<li class="td3">작성자</li>
					<li class="td1">작성일</li>
					<li class="td3">조회수</li>
				</ul>
				<ul class="qnalist">					
					<li class="td1">[회원정보]</li>
					<li class="td2">정보수정어떻게~~..</li>
					<li class="td3">가가가</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">1</li>
				</ul>
				<ul class="qnalist">					
					<li class="td1">[회원정보]</li>
					<li class="td2">└ re:정보수정어떻게~~..</li>
					<li class="td3">관리자</li>
					<li class="td1">2020-10-11</li>
					<li class="td3">1</li>
				</ul>
				<ul class="qnalist">					
					<li class="td1">[회원탈퇴]</li>
					<li class="td2">제목</li>
					<li class="td3">작성자</li>
					<li class="td1">작성일</li>
					<li class="td3">조회수</li>
				</ul>
				<ul class="qnalist">					
					<li class="td1">[회원탈퇴]</li>
					<li class="td2">제목</li>
					<li class="td3">작성자</li>
					<li class="td1">작성일</li>
					<li class="td3">조회수</li>
				</ul>
				<ul class="qnalist">					
					<li class="td1">[교환/환불]</li>
					<li class="td2">제목</li>
					<li class="td3">작성자</li>
					<li class="td1">작성일</li>
					<li class="td3">조회수</li>
				</ul>
			</div>
			<div class="pagenum">
				1 2 3
			</div>
		</div>
	</div>
</div>
