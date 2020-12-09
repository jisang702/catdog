<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
</head>
<body>

<div class="header">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="createdBody">
	<div class="createdLayout">
		<div class="board">
			<div class="created">
				<div>
					<ul class="createdtitle">
						<li>글쓰기</li>
					</ul>
				</div>
				<form action="" method="post">
					<div>
						<ul class="tr">
							<li class="td"><input type="text" placeholder="제목을 입력해주세요"></li>
						</ul>
						<ul class="tr">
							<li class="td"><textarea rows="15" cols="118" placeholder="내용을 입력해주세요"></textarea> </li>
						</ul>
						<ul>
							<li>
								<button type="button" class="mybtn2">등록하기</button>
								<button type="button" class="mybtn1">돌아가기</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="footer">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>


</body>
</html>