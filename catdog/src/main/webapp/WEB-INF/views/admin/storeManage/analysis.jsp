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
	var url="${pageContext.request.contextPath}/admin/storeManage/ordAnalysis";
	
	$.getJSON(url, function(data){
		var otitles=[];
		
		var ovalues=[];
		var avalues=[];	
		
		for(var i=0; i<data.listOrd.length; i++){
			otitles.push(data.listOrd[i].section);
			ovalues.push(data.listOrd[i].count);
			avalues.push(data.listAmount[i].count);
		}
		
		Highcharts.chart('chart-container', {
		    chart: {
		        zoomType: 'xy'
		    },
		    title: {
		        text: '<b>스토어 매출 통계</b>'
		    },
		    xAxis: [{
		        categories: otitles,
		        crosshair: true
		    }],
		    yAxis: [{ // Primary yAxis
		        labels: {
		            format: '{value} 원',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        },
		        title: {
		            text: '금액',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        }
		    }, { // Secondary yAxis
		        title: {
		            text: '주문 건수',
		            style: {
		                color: Highcharts.getOptions().colors[0]
		            }
		        },
		        labels: {
		            format: '{value} 건',
		            style: {
		                color: Highcharts.getOptions().colors[0]
		            }
		        },
		        opposite: true
		    }],
		    tooltip: {
		        shared: true
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'left',
		        x: 120,
		        verticalAlign: 'top',
		        y: 100,
		        floating: true,
		        backgroundColor:
		            Highcharts.defaultOptions.legend.backgroundColor || // theme
		            'rgba(255,255,255,0.25)'
		    },
		    series: [{
		        name: '주문',
		        type: 'column',
		        yAxis: 1,
		        data: ovalues,
		        tooltip: {
		            valueSuffix: ' 건'
		        }

		    }, {
		        name: '금액',
		        type: 'spline',
		        data: avalues,
		        tooltip: {
		            valueSuffix: '원'
		        }
		    }]
		});
	});
});

</script>

<div class="body-container">
    <div style="margin: 70px auto; width: 100%">
    	<div class="box" style="width: 70%; height: 280px; padding: 10px 30px;"> 		
    		<p style="font-size: 20px; font-weight: bold; margin: 10px 20px;">오늘자 스토어 통계</p>
    		<table class="listtable1">
    			<tr>
    				<th>방문자 수</th>
    				<th>주문건 수 </th>
	    			<th>주문금액</th>
	    			<th>신규상품</th>
    			</tr>
    			<tr>
    				<td style="border: none;">${todayCount}</td>
    				<td style="border: none;">${todayOrderCount}</td>
    				<td style="border: none;">${todayOrderPriceSum}</td>
    				<td style="border: none;">${todayProductCount}</td>
    			</tr>
    			<tr>
    				<td>&nbsp;</td>
    				<td style="font-size: 12px;">
    					&nbsp;어제 주문건 수 : 300건<br>
    					&emsp;&emsp;총 주문건 수 : ${totalOrderCount}건
    				</td>
    				<td style="font-size: 12px;">
    					누적 주문금액 : ${totalOrderPriceSum}원<br> 
    					&emsp;&emsp;
    				</td>
    				<td style="font-size: 12px;">
    					누적 상품갯수 : ${totalProductCount}개<br> 
    					&emsp;&emsp;
    				</td>
    			</tr>    			
    		</table>
 			<p style="float:right; font-weight: 400; font-size: 12px; margin-top: 10px;"><%=time%> 기준</p>
    	</div>
    	
    	<div class="box" style="width: 810px; margin-top: 10px;">
	    	<div id="chart-container">
		     	
		    </div>
        </div>
    </div>
</div>