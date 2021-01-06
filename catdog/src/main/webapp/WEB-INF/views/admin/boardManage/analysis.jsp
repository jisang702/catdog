<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.chart-container {
	width: 800px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	margin: 10px auto;
	text-align: center;
}

.chart-container2 {
	width: 400px;
	box-sizing: border-box;
	padding: 20px;
	height: 420px;
	margin: 20px auto 0px;
	text-align: center;
	border: 1px solid #dadada;
	border-radius: 10px;
	font-weight: 700;
}
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
		
		Highcharts.chart('chart-container1', {
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

$(function(){
	var url="${pageContext.request.contextPath}/admin/boardManage/boardAgeAnalysis";
	
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
		        text: '<b>연령대별 게시글 작성</b>'
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
	     <div class="mypage2" style="width: 100%">
	     	<div class="mypagetab">
	     		<p>게시물 통계</p>
	     	</div>
	     	
	     	<div id="chart-container1" class="chart-container">
	     	
	     	</div>
	     	<div class="box" style="width: 40%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
    		<div>
        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;">게시판별 통계</p>
        		<p style="float: right; font-size: 10px;"><br><br>
        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/boardManage/listArticle'">  + 더보기</span>
        		</p>
        	</div>
    		<table class="listtable1" style="width: 100%">
	    	 <thead>
	               <tr align="center"  height="20" style="padding: 0"> 
				      <th style="width: 120px; color: #787878;" >유형</th>
				      <th style="width: 150px; color: #787878;">게시글</th>
				      <th style="width: 120px; color: #787878;">댓글</th>
				  </tr>
			 </thead>
			 <tbody class="board-list">
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">자유</td>
				      <td style="padding: 0;">${freeCount} (<fmt:formatNumber value="${(freeCount/totalCount)*100}" pattern=".0"/>%)</td>
				      <td style="padding: 0;">${freeReplyCount} (<fmt:formatNumber value="${(freeReplyCount/totalReplyCount)*100}" pattern=".0"/>%)</td>
				  </tr>
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">중고</td>
				      <td style="padding: 0;">${dealCount} (<fmt:formatNumber value="${(dealCount/totalCount)*100}" pattern=".0"/>%)</td>
				      <td style="padding: 0;">${dealReplyCount} (<fmt:formatNumber value="${(dealReplyCount/totalReplyCount)*100}" pattern=".0"/>%)</td>
				  </tr>
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">포토</td>
				      <td style="padding: 0;">${photoCount} (<fmt:formatNumber value="${(photoCount/totalCount)*100}" pattern=".0"/>%)</td>
				      <td style="padding: 0;">${photoReplyCount} (<fmt:formatNumber value="${(photoReplyCount/totalReplyCount)*100}" pattern=".0"/>%)</td>
				  </tr>
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">실종</td>
				      <td style="padding: 0;">${missCount} (<fmt:formatNumber value="${(missCount/totalCount)*100}" pattern=".0"/>%)</td>
				      <td style="padding: 0;">${missReplyCount} (<fmt:formatNumber value="${(missReplyCount/totalReplyCount)*100}" pattern=".0"/>%)</td>
				  </tr>
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">비디오</td>
				      <td style="padding: 0;">${vidCount} (<fmt:formatNumber value="${(vidCount/totalCount)*100}" pattern=".0"/>%)</td>
				      <td style="padding: 0;">${vidReplyCount} (<fmt:formatNumber value="${(vidReplyCount/totalReplyCount)*100}" pattern=".0"/>%)</td>
				  </tr>
			 </tbody>
    		</table>
    	</div>
	     	<div id="chart-container2" class="chart-container2" style="display: inline-block;">
	     	
	     	</div>
	     </div>
	     
	     
	</div>
</div>

