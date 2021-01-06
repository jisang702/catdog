<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth() > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	 
	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
	
	$("body").on("click", ".week", function() {
		$("input[type=date]").val(yyyy+"-"+mm+"-"+dd-7);
	});
});

$(function() {
	$("body").on("click", "input[name=sortType]", function() {
		var sortType=$(this).val();
		var url="${pageContext.request.contextPath}/mypage/mypoint";
		var query="?page=1&sortType="+sortType;
		
		location.href=url+query;
	});
	
	$("input[name=pointType]:checked").next("span").attr("class", "sortchecked");
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
				<li class="td"><span>${pointSum}</span> P</li>
			</ul>
		</div>
		<div class="settingdate">
			<div class="settingbtn">
				<form name="search" action="${pageContext.request.contextPath}/mypage/mypoint" method="post">					
					<div>		
						<button class="active d-7">1주일</button>
						<button class="m-1">1개월</button>
						<button class="m-3">3개월</button>
						<button class="m-6">6개월</button>
					</div>
				</form>
			</div>
			<div class="datebox">
				<input type="date" class="searchday1"> - <input type="date" class="searchday2">
			<button id="searchbtn" type="submit">조회</button>
			</div>
		</div>
		<div class="pointlist">
			<div class="pointlist-top">
				<div class="list-info">
					총 <span>${pointCount}</span>건
				</div>
				<div class="list-sort">
					<form action="arrayForm" action="${pageContext.request.contextPath}/mypage/mypoint" method="post">					
						<label><input type="radio" name="sortType" value="all" ${sortType=="all"?"checked='checked'":""}><span>전체</span></label>
						<label><input type="radio" name="sortType" value="1" ${sortType=="1"?"checked='checked'":""}><span>적립</span></label>
						<label><input type="radio" name="sortType" value="2" ${sortType=="2"?"checked='checked'":""}><span>사용</span></label>
						<label><input type="radio" name="sortType" value="3" ${sortType=="3"?"checked='checked'":""}><span>소멸</span></label>
					</form>
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
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.pointCreated}</td>
							<td>${dto.pointContent}</td>
							<td>
								<c:if test="${dto.pointType==1}">적립</c:if>
								<c:if test="${dto.pointType==2}">사용</c:if>
								<c:if test="${dto.pointType==3}">소멸</c:if>
							</td>
							<td>${dto.pointQuantity} P</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr style="margin: 20px;">
						<td colspan="4" style="border: none;"> ${pointCount==0?"<p style=\"margin: 100px;\">포인트 내역이 없습니다.</p>":paging} </td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>