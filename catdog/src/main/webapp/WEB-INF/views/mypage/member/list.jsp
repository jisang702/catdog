<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function selectList(f) {
	f.action="${pageContext.request.contextPath}/mypage/list";
	f.submit();
}

function article(boardType, num){
	var url = "${pageContext.request.contextPath}";
	if(boardType == "free"){
		url+="/community/board/article?freeNum="+num;		
	}else if(boardType == "deal"){
		url+="/community/deal/article?dealNum="+num;		
	}else if(boardType == "photo"){
		url+="/community/photo/article?photoNum="+num;		
	}else if(boardType == "miss"){
		url+="/community/article?missNum="+num;		
	}
	
	location.href=url;
}

function controll(boardType, type, num){
	var url = "${pageContext.request.contextPath}";
	if(boardType == "free"){
		url+="/community/board/"+type+"?freeNum="+num;		
	}else if(boardType == "deal"){
		url+="/community/deal/"+type+"?dealNum="+num;		
	}else if(boardType == "photo"){
		url+="/community/photo/"+type+"?photoNum="+num;		
	}else if(boardType == "miss"){
		url+="/community/miss/"+type+"?missNum="+num;		
	}
	
	location.href=url;
}


</script>
<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage2">
			<div class="mypagetab">
				<p>내 게시글</p>
				<form action="selectForm" action="${pageContext.request.contextPath}/mypage/list" method="post">
					<select name="boardType" onchange="selectList(this.form);">
						<option value="">전체게시판</option>
						<option value="free" ${boardType=="free"?"selected='selected'":""}>자유게시판</option>
						<option value="photo" ${boardType=="photo"?"selected='selected'":""}>포토갤러리</option>
						<option value="miss" ${boardType=="miss"?"selected='selected'":""}>찾아주세요</option>
						<option value="deal" ${boardType=="deal"?"selected='selected'":""}>중고장터</option>
						<option>PetCare 새소식</option>
						<option>PetCare 비디오</option>
					</select>
				</form>
			</div>
			<table class="listtable1">
				<thead>
					<tr>
						<th>게시판</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>
								<c:choose>
									<c:when test="${dto.boardType=='free'}">[자유게시판]</c:when>
									<c:when test="${dto.boardType=='photo'}">[포토갤러리]</c:when>
									<c:when test="${dto.boardType=='miss'}">[찾아주세요]</c:when>
									<c:when test="${dto.boardType=='deal'}">[중고장터]</c:when>
								</c:choose>
							</td>
							<td><a onclick="article('${dto.boardType}','${dto.num}');">${dto.subject}</a></td>
							<td>${dto.created}</td>
							<td>${dto.hitCount}</td>
							<td>
								<button type="button" onclick="controll('${dto.boardType}','update','${dto.num}');" class="mybtn1">수정</button>
								<button type="button" onclick="controll('${dto.boardType}','delete','${dto.num}');" class="mybtn1">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<span style="margin: 20px;">${dataCount==0?"<p style=\"margin: 100px;\">등록된 게시글이 없습니다.</p>":paging}</span>
			</div>			
		</div>
	</div>
</div>
