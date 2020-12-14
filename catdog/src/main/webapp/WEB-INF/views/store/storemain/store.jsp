<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slider/css/slider/jquery.bxslider.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storemain.css">


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/slider/js/jquery.bxslider.min.js"></script>

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



<div style="width: 500px; margin: 20px auto;">
	<ul class="slider" style="margin: 0;">
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dog1.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dog1.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dog1.jpg"></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/dog1.jpg"></a></li>
	</ul>
</div>

<br>
<div align="center" style="width: 100%; height: 150px; background: red;"><p>이벤트배너</p></div>
<br>
<br>
<div class="menu10">
<div align="center">강아지</div>
<div align="center">고양이</div>

</div>


  
<p align="center" style="margin-top: 30px">신상품</p>
<div  align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>

<br>
<p align="center" style="margin-top: 30px">베스트 상품</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<br>
<p align="center" style="margin-top: 30px">사료</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<br>
<p align="center" style="margin-top: 30px">옷</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center" style="margin-top: 30px">간식</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center" style="margin-top: 30px">장난감</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<p align="center" style="margin-top: 30px">기타</p>
<div align="center">
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
<a href="#"><img class="big" src="img1.jpg"> </a>
</div>
<div align="center" style="width: 100%; height: 150px; background: red; margin-top: 30px;"><p>이벤트배너</p></div>
