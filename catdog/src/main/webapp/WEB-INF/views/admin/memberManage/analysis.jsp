<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#chart-container {
	width: 476px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	border: 1px solid #ccc;
	margin: 10px auto;
	text-align: center;
}
</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">

$(function(){
	var url="${pageContext.request.contextPath}/admin/memberManage/ageAnalysis";
	
	$.getJSON(url, function(data){
		var titles=[];
		var values=[];
		
		for(var i=0; i<data.list.length; i++){
			titles.push(data.list[i].section);
			values.push(data.list[i].count);
		}
		
		var arr=[];
		for(var i=0; i<data.list.length; i++){
			var a=[data.list[i].section, data.list[i].count];
			arr.push(a);
		}
		
		Highcharts.chart('chart-container', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '연령대별 일반 회원 수'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            showInLegend: true
		        }
		    },
		    series: [{
		        name: '인원(명)',
		        colorByPoint: true,
		        data: arr
		    }]
		});
	});
});

</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
	     <div class="body-title">
	         <h3><i class="fas fa-user"></i>&nbsp;회원 분석 </h3>
	     </div>
	     
	     <div>
	     	<div id="chart-container"></div>
	     </div>
	     
	</div>
</div>

