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

#chart-container {
	width: 250px;
	box-sizing: border-box;
	padding: 0px;
	height: 225px;
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

.send{
	cursor: pointer;
	color: tomato;
}


.send:hover{
	cursor: pointer;
	text-decoration: underline;
}

.board-list tr:hover{
	cursor: pointer;
	background-color: #f6f6f6;
}

.subject:hover{
	cursor: pointer;
	text-decoration: underline;
}
</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
$(function(){
	var url="${pageContext.request.contextPath}/admin/analysis";
	
	$.getJSON(url, function(data){
		
		Highcharts.chart('chart-container', {
		    chart: {
		        type: 'areaspline'
		    },
		    title: {
		        text: ''
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'left',
		        verticalAlign: 'top',
		        x: 150,
		        y: 100,
		        floating: true,
		        borderWidth: 1,
		        backgroundColor:
		            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
		    },
		    xAxis: {
		        categories: [
		            'before',
		            'today',
		        ],
		        plotBands: [{ // visualize the weekend
		            from: 4.5,
		            to: 6.5,
		            color: 'rgba(68, 170, 213, .2)'
		        }]
		    },
		    yAxis: {
		        title: {
		            text: '명(수)'
		        },
		  		min:1280,
		  		max:1330
		    },
		    tooltip: {
		        shared: true,
		        valueSuffix: ' 명'
		    },
		    credits: {
		        enabled: false
		    },
		    plotOptions: {
		        areaspline: {
		            fillOpacity: 0.5
		        }
		    },
		    series: [{
		        name: '방문자',
		        data: [data.before, data.total]
		    }]
		});
		
	});
	
	
});
</script>

<div class="body-container">
    <div style="margin: 70px auto; width: 100%">
    	<div class="box" style="width: 70%; height: 280px; display: inline-block;"> 		
    		<p style="font-size: 20px; font-weight: bold; margin: 10px 20px;"><i class="fas fa-chart-line"></i>&nbsp;오늘자 통계</p>
    		<table class="listtable1" style="height: 200px;">
    			<tr height="20">
    				<th>현재 사용자 수</th>
	    			<th>오늘 방문자 수</th>
	    			<th>현재 가입자 수</th>
    			</tr>
    			<tr height="20">
    				<td style="border: none;">${currentCount}</td>
    				<td style="border: none;">${todayCount}</td>
    				<td style="border: none;">${todayNewUserCount}</td>
    			</tr>
    			<tr>
    				<td height="20">&nbsp;</td>
    				<td height="20" style="font-size: 12px;">
    					어제 방문자 수 : ${yesterdayCount}<br>
    					&emsp;&emsp;총 방문자 수    : ${totalCount}
    				</td>
    				<td height="20" style="font-size: 12px;">
    					누적 가입자 수 : ${totalUserCount}<br> 
    					&emsp;&emsp;
    				</td>
    			</tr>    			
    		</table>
 			<p style="float:right; font-weight: 400; font-size: 12px; margin-top: 10px;"><%=time%> 기준</p>
    	</div>
    	<div class="box" style="width: 25%; height: 280px; padding-left:0; display: inline-block;">
    		<p style="font-size: 20px; font-weight: bold; margin: 15px 20px;"><i class="fas fa-shoe-prints"></i>&nbsp;방문자 요약</p>
    		<div id="chart-container">
    				
    		</div>
    	</div>
    	
    	<div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
    		<div>
        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;"><i class="fas fa-user-alt"></i>&nbsp;신규회원</p>
        		<p style="float: right; font-size: 10px;"><br><br>
        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/memberManage/list'">  + 더보기</span>
        		</p>
        	</div>
    		<table class="listtable1" style="width: 100%; height: 300px">
	    	 <thead>
	               <tr align="center"  height="20" style="padding: 0"> 
				      <th style="width: 120px; color: #787878;" >유형</th>
				      <th style="width: 250px; color: #787878;">아이디</th>
				      <th style="width: 120px; color: #787878;">닉네임</th> 
				  </tr>
			 </thead>
			 <tbody class="board-list">
			 	<c:forEach var="dto" items="${newUserList}">
				  <tr align="center" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
				      onclick="detailMember('${dto.userId}');"> 
				      <td style="padding: 0; height: 40px;">${dto.type==1 ? "일반" : (dto.type==2 ? "수의사" : "판매자" ) } </td>
				      <td style="padding: 0;">${dto.userId}</td>
				      <td style="padding: 0;">${dto.userNick}</td>      
				  </tr>
			</c:forEach>
			 </tbody>
    		</table>
    	</div>
    	
        <div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
        	<div>
        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;"><i class="far fa-window-restore"></i>&nbsp;신규게시물</p>
        		<p style="float: right; font-size: 10px;"><br><br>
        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/boardManage/listArticle'">  + 더보기</span>
        		</p>
        	</div>
    		<table class="listtable1" style="width: 100%; height: 300px">
	    	 <thead>
	               <tr align="center"  height="20" style="padding: 0"> 
				      <th style="width: 120px; color: #787878;" >게시판</th>
				      <th style="width: 250px; color: #787878;">글제목</th>
				      <th style="width: 120px; color: #787878;">아이디</th> 
				  </tr>
			 </thead>
			 <tbody class="board-list">
			 	<c:forEach var="dto" items="${newArticleList}">
				  <tr align="center" height="20" style="width:100%; border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">${dto.boardType=="free" ? "자유" : (dto.boardType=="deal" ? "중고거래" : (dto.boardType=="vid" ? "비디오" : "포토") ) } </td>
				      <td style="padding: 0;" class="subject">${dto.subject}</td>
				      <td style="padding: 0;">${dto.userId}</td>      
				  </tr>
			</c:forEach>
			 </tbody>
    		</table>
        </div>
        <div class="box" style="width: 29%; height: 380px; margin-top: 10px; padding: 20px; display: inline-block;">
        	<div>
        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;"><i class="fas fa-store"></i>&nbsp;신규상품</p>
        		<p style="float: right; font-size: 10px;"><br><br>
        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/storeManage/listProduct'">  + 더보기</span>
        		</p>
        	</div>
    		<table class="listtable1" style="width: 100%; height: 300px">
	    	 <thead>
	               <tr align="center"  height="20" style="padding: 0"> 
				      <th style="width: 120px; color: #787878;">유형</th>
				      <th style="width: 250px; color: #787878;">상품</th>
				      <th style="width: 120px; color: #787878;">아이디</th> 
				  </tr>
			 </thead>
			 <tbody class="board-list">
			 	<c:forEach var="dto" items="${newProductList}">
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px;">${dto.type==0 ? "전체" : (dto.type==1 ? "강아지" : "고양이" )}</td>
				      <td style="padding: 0;">${dto.subject}</td>
				      <td style="padding: 0;">${dto.userId}</td>      
				  </tr>
				</c:forEach>
			 </tbody>
    		</table>
        </div>
         <div class="box" style="width: 46%; height: 230px; margin-top: 10px; padding: 20px; display: inline-block;">
	         <div style="width: 100%">
	        	<div>
	        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;"><i class="fas fa-bell"></i>&nbsp;새로 올라온 문의글</p>
	        		<p style="float: right; font-size: 10px;"><br><br>
	        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/customer/qna/list'">  + 더보기</span>
	        		</p>
	        	</div>
	    		<table class="listtable1" style="width: 100%; height: 180px">
		    	 <thead>
		               <tr align="center"  height="20" style="padding: 0"> 
					      <th style="width: 120px; color: #787878;">유형</th>
					      <th style="width: 250px; color: #787878;">질문</th>
					      <th style="width: 120px; color: #787878;">아이디</th> 
					  </tr>
				 </thead>
				 <tbody class="board-list">
				 	<c:forEach var="dto" items="${newQuestionList}">
					  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
					      <td style="padding: 0; height: 40px;">${dto.category}</td>
					      <td style="padding: 0;">${dto.subject}</td>
					      <td style="padding: 0;">${dto.userId}</td>      
					  </tr>
					</c:forEach>
				 </tbody>
	    		</table>
	    	 </div>
        </div>
        
        <div class="box" style="width: 45%; height: 230px; margin-top: 10px; padding: 22px; display: inline-block;">
        	<div>
        		<p style="font-size: 20px; font-weight: bold; margin: 10px 10px 15px;"><i class="fas fa-bullhorn"></i>&nbsp;공지사항</p>
        		<p style="float: right; font-size: 10px;"><br><br>
        			<span class="send" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/customer/qna/list'">  + 더보기</span>
        		</p>
        	</div>
    		<table class="listtable1" style="width: 100%">
	    	 <thead>
	               <tr align="center"  height="20" style="padding: 0"> 
				      <th style="width: 300px; color: #787878;">제목</th>
				      <th style="width: 120px; color: #787878;">아이디</th>
				  </tr>
			 </thead>
			 <tbody class="board-list">
			 	<c:forEach var="dto" items="${newNoticeList}">
				  <tr align="center" height="20" style="border-bottom: 1px solid #cccccc;" class="hover-tr"> 
				      <td style="padding: 0; height: 40px; text-align: left;">${dto.subject}</td>
				      <td style="padding: 0;">${dto.userId}</td>
				  </tr>
				</c:forEach>
			 </tbody>
    		</table>
        </div>
    
        
    </div>
</div>