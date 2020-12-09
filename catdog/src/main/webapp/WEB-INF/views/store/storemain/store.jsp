<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storemain.css">

<style type="text/css">

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.slider').bxSlider({
		auto: true,
		autoControls: true,
		stopAutoOnClick: true,
		pager: true,
		slideWidth: 600
	});
});
</script>

</head>
<body>
<div align="center" style="width: 100%; height: 150px; background: red;"><p>헤더</p></div>
<br>

<div style="width: 500px; margin: 20px auto;">
	<ul class="slider" style="margin: 0;">
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img1.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img2.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img3.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img1.jpg"></a></li>
	</ul>
</div>

<br>
<div align="center" style="width: 100%; height: 150px; background: red;"><p>이벤트배너</p></div>
<br>
<br>
<div class="menu">
<div align="center">강아지</div>
<div align="center">고양이</div>

</div>

  <div class="submenu">
    	<ul>
    		<li><a href="#">신상품</a></li>
    		<li><a href="#">베스트상품</a></li>
    		<li><a href="#">사료</a></li>
    		<li><a href="#">옷</a></li>
    		<li><a href="#">간식</a></li>
    		<li><a href="#">장난감</a></li>
    		<li><a href="#">기타</a></li>
    		
    	</ul>
  </div>
  
<p align="center">신상품</p>
<div  align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>

<br>
<p align="center">베스트 상품</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<br>
<p align="center">사료</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<br>
<p align="center">옷</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center">간식</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center">장난감</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center">기타</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<br>

<div align="center" style="width: 100%; height: 150px; background: red;"><p>풋더</p></div>
</body>
</html>