<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/doctor.css">

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

	<div class="body-container boxText" style="width: 900px; margin-top: 70px; margin-bottom:50px; align:center; " >
		<h2><i class="fas fa-bell" style="color: #ffc107;"></i>&nbsp;새 소식&nbsp;<i class="fas fa-bell"  style="color: #ffc107;"></i></h2>
		<p>알아두면 쓸모있는 지식들을 만나보세요</p>

	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		<tr height="35" >
			<td align="left" width="50%">
			<p>	${dataCount}개(${page}/${total_page} PAGE) </p> </td>
			<td align="right">&nbsp;</td>
		</tr>
	</table>
	
	<table style="width: 100%; height: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-bottom: 3px solid #71da65;">
		<tr align="center" bgcolor="#eeeeee" height="50"
			style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc; background-color: #71da65; color:#ffffff;">
			<th width="60" style="color: #787878;">번호</th>
			<th style="color: #787878;">제목</th>
			<th width="100" style="color: #787878;">작성자</th>
			<th width="80" style="color: #787878;">작성일</th>
			<th width="60" style="color: #787878;">첨부</th>
			<th width="60" style="color: #787878;">조회수</th>
		</tr>
	
		<c:forEach var="dto" items="${newsList}">
			<tr align="center" bgcolor="#ffffff" height="45"
				style="border-bottom: 1px solid #cccccc;">
				<td><span
					style="display: inline-block; padding: 1px 3px; background: #ED4C00; color: #FFFFFF">공지</span></td>
				<td align="left" style="padding-left: 10px;"><a href="${articleUrl}&newsNum=${dto.newsNum}">${dto.newsSubject}</a>
				</td>
				<td>${dto.userName}</td>
				<td>${dto.newsCreated}</td>
				<td>
					<c:if test="${dto.fileCount > 0}">
						<a href="${pageContext.request.contextPath}/doctor/news/zipdownload?newsNum=${dto.newsNum}"><i class="far fa-file-archive"></i></a>
					</c:if>
				</td>
				<td>${dto.newsHitCount}</td>
			</tr>
		</c:forEach>
	
		<c:forEach var="dto" items="${list}">
			<tr align="center" bgcolor="#ffffff" height="45"
				style="border-bottom: 1px solid #cccccc;">
				<td>${dto.listNum}</td>
				<td align="left" style="padding-left: 10px;"><a href="${articleUrl}&newsNum=${dto.newsNum}">${dto.newsSubject}</a>
					<c:if test="${dto.gap < 1}">
						<img src='${pageContext.request.contextPath}/resources/images/new.gif'>
					</c:if></td>
				<td>${dto.userName}</td>
				<td>${dto.newsCreated}</td>
				<td><c:if test="${dto.fileCount !=0}">
						<a href="${pageContext.request.contextPath}/doctor/news/zipdownload?newsNum=${dto.newsNum}"><i class="far fa-file-archive"></i></a>
					</c:if></td>
	
				<td>${dto.newsHitCount}</td>
			</tr>
		</c:forEach>
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}</td>
		</tr>
	</table>
	
	<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		<tr height="40">
			<td align="left" width="100">
				<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/news/list?${query}';">새로고침</button>
			</td>
			<td align="center">
				<form name="searchForm" action="${pageContext.request.contextPath}/doctor/news/list" method="post">
					<select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="newsSubject" ${condition=="newsSubject"?"selected='selected'":""}>제목</option>
		                  <option value="newsContent" ${condition=="newsContent"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		                  <option value="newsCreated" ${condition=="newsCreated"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
			</td>
			<td align="right" width="100">
				<c:if test="${sessionScope.member.userType==3}">
				</c:if>
				<button type="button" class="sendBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/doctor/news/created';">글올리기</button>
			</td>
		</tr>
	</table>
</div>

