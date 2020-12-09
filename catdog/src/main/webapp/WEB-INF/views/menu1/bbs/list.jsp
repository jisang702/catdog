<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="body-container">
		<div class="board">
			<div class="boardtitle">
				<ul class="listtitle">
					<li>자유게시판</li>
				</ul>
			</div>
			<div class="boardoption">
				<div>
					<select>
							<option>최신순</option>
							<option>조회순</option>
							<option>추천순</option>
						</select>
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
				<ul class="tr">
					<li class="td">2</li>
					<li class="td1"><a href="#">가나다라마바사</a></li>
					<li class="td2">김김김</li>
					<li class="td2">2020-10-10</li>
					<li class="td">5</li>
					<li class="td">5</li>
				</ul>
				<ul class="tr">
					<li class="td">1</li>
					<li class="td1"><a href="#">가나다라마바사</a></li>
					<li class="td2">김김김</li>
					<li class="td2">2020-10-10</li>
					<li class="td">5</li>
					<li class="td">10</li>
				</ul>
			</div>
			<div>
				<p> 1 2 3 </p>
			</div>
			<div class="listfooter">
				<select>
					<option>전체</option>
					<option>작성자</option>
					<option>제목</option>
					<option>제목+내용</option>
				</select>
				<input type="text">
				<button type="button" class="mybtn1">검색</button>
				<button type="button" class="mybtn1 floatright">글쓰기</button>
			</div>
		</div>
</div>
