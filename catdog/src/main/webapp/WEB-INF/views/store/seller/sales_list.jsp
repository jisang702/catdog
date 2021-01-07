<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#chart-container {
	width: 476px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	border: 1px solid #ccc;
	margin: 10px auto;
	text-align: center;
}

body{
	margin-left: 150px;
	margin-right: 30px;
}
.box{
	border-radius: 10px;
    border-color: rgba(176, 176, 176, 0.5);
    font-size: 15px;
    height: 40px;
    padding: 5px 0 5px 5px;
    min-width: 120px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: none;
    position: relative;
    z-index: 1;
    margin-bottom: 30px;
}
.pi{
	width: 300px;
	height: 150px;
	display: inline-block;
}
ul{
	list-style: none;
}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">

$(function(){
	var url="${pageContext.request.contextPath}/store/seller/sales_list";
	
	$getJSON(url, function(data){
		Highcharts.chart("", {
			
		});
	})
});

$(function(){
	var url="${pageContext.request.contextPath}/store/seller/categorySection";
	
	$.getJSON(url, function(data){
		console.log(data);
	});
});

</script>

<br>
<br><br>
<h1 align="center">판매 현황</h1>
<br>

<div class="container">
	<h2>카테고리 판매 현황</h2>
	
	<div class="box-container" style="margin-top: 15px;">
		<div id="lineContainer1" class="box"></div>
		<
	</div>
</div>
