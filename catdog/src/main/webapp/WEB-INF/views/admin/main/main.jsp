<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    	<div class="box" style="width: 40%; height: 400px; display: inline-block;">
    			<p>방문자 요약</p>
 
    	</div>
    	<div class="box" style="width: 40%; height: 400px; display: inline-block;">
    			<p>현황</p>
    	</div>
        
    </div>
</div>