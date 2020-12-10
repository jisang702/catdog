<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage">
			<div class="mypagetab">
					<p>My Pet</p>
			</div>
			<div class="mypagesub1">
				
			</div>
		</div>
		<div class="mypage1">
			<div class="petlist">
				<div>
					<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">
				</div>
				<div>
					<ul>
						<li>슈슈슈</li>
						<li>3살</li>
						<li>말티즈</li>
					</ul>
				</div>				
			</div>
			<div>
				<button type="button">반려동물 추가</button>
			</div>
		</div>
	</div>
</div>
