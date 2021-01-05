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
	width: 500px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	margin: 10px auto;
	text-align: center;
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
		        text: '연령대별 게시글 작성'
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
	     		<p>게시물 통계</p>
	     	</div>
	     	
	     	<div id="chart-container1" class="chart-container">
	     	
	     	</div>
	     	<div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
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
				      <th style="width: 150px; color: #787878;">게시글 수</th>
				      <th style="width: 120px; color: #787878;">댓글 수</th>
				      <th style="width: 120px; color: #787878;">비율</th> 
				  </tr>
			 </thead>
			 <tbody class="board-list">
			 	<c:forEach var="dto" items="${newUserList}">
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
				      onclick="detailMember('${dto.userId}');"> 
				      <td style="padding: 0; height: 40px;">${dto.type==1 ? "일반" : (dto.type==2 ? "수의사" : "판매자" ) } </td>
				      <td style="padding: 0;">${dto.userId}</td>
				      <td style="padding: 0;">${dto.userNick}</td>      
				  </tr>
			</c:forEach>
			 </tbody>
    		</table>
    	</div>
	     	<div id="chart-container2" class="chart-container2">
	     	
	     	</div>
	     </div>
	     
	     
	</div>
</div>

