<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	 
	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
});
</script>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage3">
			<div class="mypagetab">
					<p>포인트 현황</p>	
			</div>
		</div>
		<div class="mypoint">
			<ul>
				<li>나의 현재 등급</li>
				<li class="td">level 1</li>
			</ul>
			<ul style="border-left: 1px solid #dadada;">
				<li>총 포인트</li>
				<li class="td"><span>1010</span> P</li>
			</ul>
		</div>
		<div class="settingdate">
			<div class="settingbtn">
				<button class="active">1주일</button>
				<button>1개월</button>
				<button>3개월</button>
				<button>6개월</button>
			</div>
			<div class="datebox">
				<input type="date"> - <input type="date">
			<button id="searchbtn" type="submit">조회</button>
			</div>
		</div>
		<div class="pointlist">
			<div class="pointlist-top">
				<div class="list-info">
					총 <span>10</span>건
				</div>
				<div class="list-sort">
					<ul>
						<li><a>전체</a></li>
						<li><a>적립</a></li>
						<li><a>사용</a></li>
						<li><a>소멸</a></li>
					</ul>
				</div>
			</div>
			<table class="listtable1">
				<thead>
					<tr>
						<th>적용일자</th>
						<th>상세내역</th>
						<th>구분</th>
						<th>포인트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2020-10-10</td>
						<td>출석체크</td>
						<td>적립</td>
						<td>50P</td>
					</tr>
					<tr>
						<td>2020-10-09</td>
						<td>출석체크</td>
						<td>적립</td>
						<td>50P</td>
					</tr>
					<tr>
						<td>2020-10-05</td>
						<td>상품 리뷰작성</td>
						<td>적립</td>
						<td>500P</td>
					</tr>
					<tr>
						<td>2020-09-27</td>
						<td>구매 포인트 사용</td>
						<td>사용</td>
						<td>-800P</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>