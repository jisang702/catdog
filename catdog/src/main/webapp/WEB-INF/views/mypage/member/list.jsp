<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypageBody">
	<div class="mypageLayout">
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
			<table class="listtable1">
				<thead>
					<tr>
						<th>게시판</th>
						<th>제목</th>
						<th>작성일</th>
						<th>추천수</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>[<span>중고거래</span>]</td>
						<td>@@@팝니다</td>
						<td>2020-10-10</td>
						<td>3</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			<div class="pagenum">
				1 2 3
			</div>			
		</div>
	</div>
</div>
