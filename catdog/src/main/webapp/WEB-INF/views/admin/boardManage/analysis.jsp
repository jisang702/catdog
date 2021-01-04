<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#chart-container {
	width: 800px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	margin: 10px auto;
	text-align: center;
}
</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">

$(function(){
	var url="${pageContext.request.contextPath}/admin/boardManage/boardAnalysis";
	
	$.getJSON(url, function(data){
		var dtitles=[];
		
		var dvalues=[];
		var pvalues=[];	
		var fvalues=[];
		var mvalues=[];
		var vvalues=[];
		
		
		for(var i=0; i<data.deal.length; i++){
			dtitles.push(data.deal[i].section);
			dvalues.push(data.deal[i].count);
			pvalues.push(data.photo[i].count);
			fvalues.push(data.free[i].count);
			mvalues.push(data.miss[i].count);
			vvalues.push(data.video[i].count);
			
		}
		
		Highcharts.chart('chart-container', {
		    chart: {
		        type: 'area'
		    },
		    title: {
		        text: ''
		    },
		    xAxis: {
		        categories: dtitles
		    },
		    credits: {
		        enabled: false
		    },
		    series: [
		    {
			    name: '자유',
			    data: fvalues
			 },
		    {
		        name: '중고',
		        data: dvalues
		    },
		    {
		    	name: '실종',
		    	data: mvalues
		    },
		    {
		        name: '포토',
		        data: pvalues
		    },
		    {
		    	name: '비디오',
		    	data: vvalues
		    }
		    
		    ]
		});
	});
});

</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
	     <div class="mypage2">
	     	<div class="mypagetab">
	     		<p>게시물 통계</p>
	     	</div>
	     	
	     	<div id="chart-container">
	     	
	     	</div>
	     </div>
	     
	     
	</div>
</div>

