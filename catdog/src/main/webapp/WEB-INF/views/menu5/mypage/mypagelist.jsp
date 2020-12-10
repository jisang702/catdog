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
				<p>내 게시글</p>
				<select>
					<option>자유게시판</option>
					<option>포토갤러리</option>
					<option>실종게시판</option>
					<option>중고거래</option>
				</select>
			</div>
			<div class="mypagelist">
				<ul id="listtab">
					<li class="td1">게시판</li>
					<li class="td2">제목</li>
					<li class="td1">작성일</li>
					<li class="td3">조회수</li>
					<li class="td3">추천수</li>
				</ul>
				<ul>
					<li class="td1">[중고거래]</li>
					<li class="td2">@@@@팝니다</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">3</li>
					<li class="td3">1</li>
				</ul>
				<ul>
					<li class="td1">[자유게시판]</li>
					<li class="td2">!@#$^(@*^@*)</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">3</li>
					<li class="td3">1</li>
				</ul>
				<ul>
					<li class="td1">[중고거래]</li>
					<li class="td2">@@@@팝니다</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">3</li>
					<li class="td3">1</li>
				</ul>
				<ul>
					<li class="td1">[중고거래]</li>
					<li class="td2">@@@@팝니다</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">3</li>
					<li class="td3">1</li>
				</ul>
				<ul>
					<li class="td1">[중고거래]</li>
					<li class="td2">@@@@팝니다</li>
					<li class="td1">2020-10-10</li>
					<li class="td3">3</li>
					<li class="td3">1</li>
				</ul>
			</div>
			<div class="pagenum">
				1 2 3
			</div>
		</div>
	</div>
</div>
