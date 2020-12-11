<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
body{
	margin-left: 100px;
	margin-right: 30px;
}
.box{
	border-radius: 10px;
    border-color: rgba(176, 176, 176, 0.5);
    font-size: 15px;
    height: 40px;
    padding: 5px 0 5px 5px;
    min-width: 120px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: none;
    position: relative;
    z-index: 1;
    margin-bottom: 30px;x
}
.pi{
	width: 300px;
	height: 150px;
	display: inline-block;
}
ul{
	list-style: none;
}

}
</style>
<br>
<br><br>

<h1 align="center">냥냥이 스토어</h1>
<br>
<h2 align="center">사료</h2>
<div>
	<span>
		<select class="box">
			<option >냥냥이</option>
			<option >댕댕이</option>
		</select>
	</span>

	<span>
		<select class="box">
			<option>사료</option>
			<option>옷</option>
			<option>간식</option>
			<option>기타</option>
		</select>
	</span>
	<span>
		<select class="box" style="float:right;" >
			<option>조회순</option>
			<option>가격이높은순</option>
			<option>가격이낮은순</option>
			<option>등록순</option>
			
		</select>
	</span>
</div>

<div style="display: inline-block; margin: 20px;" >
<div>
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<div>
	<ul >  
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	  
	</ul>
	</div>
</div>

<div style="display: inline-block; margin: 20px;">
<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>

<div style="display: inline-block; margin: 20px;">
<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>

<div style="display: inline-block; margin: 20px;">
	<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>

<div style="display: inline-block; margin: 20px;">
	<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>

<div style="display: inline-block; margin: 20px;">
	<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	<li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>
<div style="display: inline-block; margin: 20px;">
	<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	  <li><a href="#"><span style="font-size: 15px;">~상품이름칸~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>
<div style="display: inline-block; margin: 20px;">
	<div >
	<a href="#"><img class="pi" src="${pageContext.request.contextPath}/resources/images/cat1.jpg"></a>	
</div>
	<ul>
	  <li><a href="#"><span style="font-size: 15px;">상품이름칸~~~~~~~~~~~~~~</span></a></li>
	  <li><span style="font-size: 20px; float: right;">33000</span></li>
	  <li><a href="#"><span style="font-size: 15px;">구매:0 | 리뷰:0</span></a></li>
	</ul>
</div>



<div align="center">1 2 3</div>
