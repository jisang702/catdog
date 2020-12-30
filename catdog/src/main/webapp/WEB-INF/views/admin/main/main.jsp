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

<div class="body-container">
    <div style="margin: 70px auto; width: 100%">
    	<div class="box" style="width: 70%; height: 280px;"> 		
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
    	<div class="box" style="width: 40%; height: 400px;">
    			<p>현황</p>
    		
    	</div>
        
    </div>
</div>