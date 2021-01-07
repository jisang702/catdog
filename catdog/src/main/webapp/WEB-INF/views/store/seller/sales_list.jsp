<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
* {
	margin:0px;
	padding:0px;
}
body {
	font-size: 12px;
	font-family:맑은 고딕, 돋움;
}

.container {
	margin: 30px auto;
	width: 700px;
	
}
.container .box-container {
}
.box-container .box {
	display: inline-block;
	box-sizing: border-box;
	padding: 20px;
	width: 500px;
	height: 400px;
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
</style>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">

$(function(){
	var url="${pageContext.request.contextPath}/store/seller/line1";
	
	// $.getJSON() : AJAX 처리결과를 json으로 반환 받는 함수
	$.getJSON(url, function(data){
		// console.log(data);
		
		Highcharts.chart("lineContainer1", {
			title:{
				text:"월별 매출"
			},
			xAxis : {
				categories:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
			},
			yAxis : {
				title:{
					text:"매출(단위:백만원)"
				}
			},
			series:data.series
		});
	});
});

$(function(){
	var url="${pageContext.request.contextPath}/store/seller/pie3d";
	
	$.getJSON(url, function(data){
		// console.log(data);
		Highcharts.chart("pie3dContainer", {
			chart:{
				type:"pie",
				options3d:{
					enabled:true,
					alpha:45
				}
			},
			title:{
				text:"카테고리별 판매량"
			},
			plotOptions:{
				pie:{
					innerSize:100,
					depth:45
				}
			},
			series:data
		});
	});

});

</script>
</head>
<body>

<br>
<br><br>
<h1 align="center">판매 현황</h1>
<br>

<div class="container">
	<h2 align="center">최근 12개월 매출</h2>
	<div class="box-container" style="margin-top: 15px;">
		<div id="lineContainer1" class="box"></div>
	</div>
	
	<br>
	
	<h2 align="center">카테고리 판매 현황</h2>
	<div class="box-container">
	    <div id="pie3dContainer" class="box"></div>
	</div>
</div>

</body>
</html>