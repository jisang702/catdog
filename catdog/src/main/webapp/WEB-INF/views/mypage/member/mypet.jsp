<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage3">
			<div class="mypagetab">
					<p>My Pet</p>	
			</div>
		</div>
		<div class="mypage1">
			<div class="mypetlist">
				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>슈슈슈</li>
						<li class="petbtn1"><button type="button">자세히 보기</button></li>
					</ul>		
				</div>				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>슈슈슈</li>
						<li class="petbtn1"><button type="button">자세히 보기</button></li>

					</ul>		
				</div>
				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>슈슈슈</li>
						<li class="petbtn1"><button type="button">자세히 보기</button></li>
					</ul>		
				</div>
			</div>
			<div class="petbtn2">
				<button type="button">반려동물 추가</button>
			</div>
		</div>
	</div>
</div>
