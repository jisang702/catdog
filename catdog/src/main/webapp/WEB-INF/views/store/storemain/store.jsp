<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storemain.css">


<div style="width: 800px; margin: 20px auto;">
	<ul>
		<li><img style="margin: 0; width: 100%; height: 500px;" src="${pageContext.request.contextPath}/resources/css/img/cat1.jpg"></li>
	</ul>
</div>

<br>

<img style="width: 100%; height: 150px;" src="${pageContext.request.contextPath}/resources/css/img/banner1.png">
<br>
<br>
<div class="menu10">
<div align="center"><img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg"></div>
<div align="center"><img src="${pageContext.request.contextPath}/resources/css/images/cat.jpeg"></div>

</div>


  
<p align="center" style="margin-top: 30px; font-weight: bold; font-size: 20px;">신상품</p>
<div  align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>

<br>
<p align="center" style="margin-top: 30px;  font-weight: bold; font-size: 20px;">베스트 상품</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<br>
<p align="center" style="margin-top: 30px; font-weight: bold; font-size: 20px;">사료</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<br>
<p align="center" style="margin-top: 30px;  font-weight: bold; font-size: 20px;">옷</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<p align="center" style="margin-top: 30px;  font-weight: bold; font-size: 20px;">간식</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<p align="center" style="margin-top: 30px;  font-weight: bold; font-size: 20px;">장난감</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<p align="center" style="margin-top: 30px;  font-weight: bold; font-size: 20px;">기타</p>
<div align="center">
<c:forEach begin="1" end="4">
<a href="#"><img class="big" src="img1.jpg"> </a>
</c:forEach>
</div>
<img style="width: 100%; height: 150px;" src="${pageContext.request.contextPath}/resources/css/img/banner1.png">