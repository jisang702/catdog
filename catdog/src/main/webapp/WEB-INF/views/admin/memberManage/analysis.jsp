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

#chart-container2 {
	width: 400px;
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
	var url="${pageContext.request.contextPath}/admin/memberManage/memberAnalysis";
	
	$.getJSON(url, function(data){
		var ctitles=[];
		
		var cvalues=[];
		var vvalues=[];	
		var svalues=[];
		
		for(var i=0; i<data.com.length; i++){
			ctitles.push(data.com[i].section);
			cvalues.push(data.com[i].count);
			vvalues.push(data.vet[i].count);
			svalues.push(data.sell[i].count);
		}
		
		Highcharts.chart('chart-container', {
		    chart: {
		        type: 'area'
		    },
		    title: {
		        text: ''
		    },
		    xAxis: {
		        categories: ctitles
		    },
		    credits: {
		        enabled: false
		    },
		    series: [
		    {
			    name: '일반',
			    data: cvalues
			 },
		    {
		        name: '수의사',
		        data: vvalues
		    },
		    {
		    	name: '판매자',
		    	data: svalues
		    }
		    ]
		});
	});
});

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
		
		Highcharts.chart('chart-container2', {
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
	     <div class="mypage2">
	     	<div class="mypagetab">
	     		<p>회원 분석</p>
	     	</div>
	     	
	     	<div id="chart-container">
	     	
	     	</div>
	     	
	     	<div id="chart-container2">
	     	
	     	</div>
	     	
	     	<div style="margin-top: 30px;">
	     		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px; text-align: left;">| 회원 유형별 통계</p>
	     		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
	               <thead>
		               <tr align="center" bgcolor="#ccc" height="35" style="border-bottom: 1px solid #222;"> 
					      <th style="width: 100px; color: #222; padding: 10px;">유형</th>
					      <th style="width: 100px; color: #222; padding: 10px;">회원수</th>
					      <th style="width: 100px; color: #222; padding: 10px;">비율</th>
					      <th style="color: #222; padding: 10px;">그래프</th>      
					  </tr>
				 </thead>
				 
				 <tbody class="board-list">
					  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
					      <td>일반</td>
					      <td>${comDataCount}</td>
					      <td><fmt:formatNumber value="${(comDataCount/totalDataCount)*100}" pattern=".0"/>%</td>
					      <td></td>	      
					  </tr>
					  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
					      <td>수의사</td>
					      <td>${vetDataCount}</td>
					      <td><fmt:formatNumber value="${(vetDataCount/totalDataCount)*100}" pattern=".0"/>%</td>
					      <td>&nbsp;</td>	      
					  </tr>
					  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
					      <td>판매자</td>
					      <td>${sellDataCount}</td>
					      <td><fmt:formatNumber value="${(vetDataCount/totalDataCount)*100}" pattern=".0"/>%</td>
					      <td>&nbsp;</td>	      
					  </tr>
				</tbody>
			</table>
	     	</div>
	     </div>
	     
	</div>
</div>

