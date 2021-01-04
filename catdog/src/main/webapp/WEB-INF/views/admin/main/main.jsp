<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String time = sdf.format(date);
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/jquery.simplyscroll.css" media="all" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Signika:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">

<style type="text/css">
.box{
	border: 1px solid #dadada;
	border-radius: 10px;
	padding: 10px;
}

.box p{
	font-size: 16px;
    float: left;
    font-weight: bold;
}
</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
$(function(){
	Highcharts.chart('chart-container', {
	    chart: {
	        type: 'area'
	    },
	    title: {
	        text: '방문자 요약'
	    },
	    xAxis: {
	        allowDecimals: false,
	        labels: {
	            formatter: function () {
	                return this.value; // clean, unformatted number for year
	            }
	        },
	        accessibility: {
	            rangeDescription: 'Range: 1940 to 2017.'
	        }
	    },
	    yAxis: {
	        title: {
	            text: 'Nuclear weapon states'
	        },
	        labels: {
	            formatter: function () {
	                return this.value / 1000 + 'k';
	            }
	        }
	    },
	    tooltip: {
	        pointFormat: '{series.name} had stockpiled <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
	    },
	    plotOptions: {
	        area: {
	            pointStart: 1940,
	            marker: {
	                enabled: false,
	                symbol: 'circle',
	                radius: 2,
	                states: {
	                    hover: {
	                        enabled: true
	                    }
	                }
	            }
	        }
	    },
	    series: [{
	        name: '방문자수',
	        data: [
	            null, null, null, null, null, 6, 11, 32, 110, 235,
	            369, 640, 1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468,
	            20434, 24126, 27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342,
	            26662, 26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
	            24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586, 22380,
	            21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950, 10871, 10824,
	            10577, 10527, 10475, 10421, 10358, 10295, 10104, 9914, 9620, 9326,
	            5113, 5113, 4954, 4804, 4761, 4717, 4368, 4018
	        ]
	    }, {
	        name: '페이지뷰수',
	        data: [null, null, null, null, null, null, null, null, null, null,
	            5, 25, 50, 120, 150, 200, 426, 660, 869, 1060,
	            1605, 2471, 3322, 4238, 5221, 6129, 7089, 8339, 9399, 10538,
	            11643, 13092, 14478, 15915, 17385, 19055, 21205, 23044, 25393, 27935,
	            30062, 32049, 33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000,
	            37000, 35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
	            21000, 20000, 19000, 18000, 18000, 17000, 16000, 15537, 14162, 12787,
	            12600, 11400, 5500, 4512, 4502, 4502, 4500, 4500
	        ]
	    }]
	});
});
</script>

<div class="body-container">
    <div style="margin: 70px auto; width: 100%">
    	<div class="box" style="width: 70%; height: 280px; display: inline-block;"> 		
    		<p style="font-size: 20px; font-weight: bold; margin: 10px 20px;">오늘자 통계</p>
    		<table class="listtable1">
    			<tr>
    				<th>현재 사용자 수</th>
	    			<th>오늘 방문자 수</th>
	    			<th>현재 가입자 수</th>
    			</tr>
    			<tr>
    				<td style="border: none;">${currentCount}</td>
    				<td style="border: none;">${todayCount}</td>
    				<td style="border: none;">${todayNewUserCount}</td>
    			</tr>
    			<tr>
    				<td>&nbsp;</td>
    				<td style="font-size: 12px;">
    					어제 방문자 수 : ${yesterdayCount}<br>
    					&emsp;&emsp;총 방문자 수    : ${totalCount}
    				</td>
    				<td style="font-size: 12px;">
    					누적 가입자 수 : ${totalUserCount}<br> 
    					&emsp;&emsp;
    				</td>
    			</tr>    			
    		</table>
 			<p style="float:right; font-weight: 400; font-size: 12px; margin-top: 10px;"><%=time%> 기준</p>
    	</div>
    	<div class="box" style="width: 25%; height: 280px; display: inline-block;">
    		<div id="chart-container">
    				
    		</div>
    	</div>
    	<div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
    			
    	</div>
        <div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
        
        </div>
        <div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
        
        </div>
    </div>
</div>