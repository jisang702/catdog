<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(function() {
	$("body").on("click", "ul.mytab li", function() {
		$(".mytab li").removeClass("active");
        $(this).addClass('active');
	});
});
</script>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage2">
			<div class="mypagetab">
				<p>문의내역</p>
			</div>
			<div class="qnatab">
				<ul class="mytab">
					<li class="active"><a>수의사</a></li>
					<li><a>고객센터</a></li>
				</ul>
				<table class="listtable1" style="width: 100%; height: 600px; margin-top:20;">
					<thead>
						<tr>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
       				<c:forEach var="dto" items="${listQnA}">
					<tr> 
       				    <td width="20%"> ${dto.qnaCategoryName} </td>
       					<td width="25%">
					<a href="${pageContext.request.contextPath}/doctor/qna/article?qnaNum=${dto.qnaNum}&page=1&rows=10">
       					 ${dto.qnaSubject}</a></td>
       					<td width="15%"> ${dto.userName}  </td>
       					<td width="20%"> ${dto.qnaCreated}  </td>
       					<td width="20%"> ${dto.isAnswer==1?"답변완료":"답변대기"} </td>
					</tr>
       				</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagenum">
				<c:if test="${listQnA.size()>=5}">
   					<td style="border: none; text-align: right; font-size: 11px;">
   						<a href="${pageContext.request.contextPath}/doctor/qna/list">더 많은 답변 하기</a>
   					</td>
   				</c:if>
			</div>
		</div>
	</div>
</div>
