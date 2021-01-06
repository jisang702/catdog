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
    					어제 주문건 수 : 1205<br>
    					&emsp;&emsp;총 주문건 수    : ${totalOrderCount}
    				</td>
    				<td style="font-size: 12px;">
    					누적 주문금액 수 : ${totalOrderPriceSum}<br> 
    					&emsp;&emsp;
    				</td>
    				<td style="font-size: 12px;">
    					누적 상품갯수 : ${totalProductCount}<br> 
    					&emsp;&emsp;
    				</td>
    			</tr>    			
    		</table>
 			<p style="float:right; font-weight: 400; font-size: 12px; margin-top: 10px;"><%=time%> 기준</p>
    	</div>
    	
        
    </div>
</div>