<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/simplyscroll.css" media="all" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Signika:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.simplyscroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.simplyscroll.min.js"></script>
<script type="text/javascript">
(function($) {
	$(function() { //on DOM ready 
    		$("#scroller").simplyScroll(); 
	});
 })(jQuery);	
</script>

		<div style="width: 100%;">
		   <div style="height: 700px;">
		       <div class="box1" style="float:left; width:50%;">
		           <div class="boxText" style="height: 700px;">       
		           		<h2>양배추스트링 어쩌고</h2>
		           		<h2>후기후기</h2>
		           </div>
		       </div>
		       <div class="box2 " style="float:left; width:50%;">
		           <div class="boxText" style="height: 700px;">			          
		           		<h2>겨울철 길냥이</h2>
		           		<h2>따뜻하게 겨울나기</h2>
		           </div>
		           
		           <!-- <div class="box2p2" style="height: 250px;"></div> -->
		       </div>
		   </div>
	    </div>

	   <div class="banner" style="float:left; width:100%;">
           <div class="banner" style="height: 100px;">
			<ul>
				<li class="bn1"> <img  src="${pageContext.request.contextPath}/img/banner3.jpg" alt="광고1"> </li>
				<li class="bn2"> <img  src="${pageContext.request.contextPath}/img/banner4.jpg" alt="광고2"> </li>
			</ul>
           </div>
      </div>  
	     
	
		<article class="mainArticle">
		
		<div class="boardContainer" style="clear: both;">
		       <div style="width:38%;float:left">
		           <div class="box3">
                   	 <h2>BEST</h2>
                        <ul class="tab-menu">
                            <li>주간</li>
                            <li class="active">월간</li>
                        </ul>
                        <div class="Boardlayout">
                    	 <dl style=" float:left; width: 35%; clear:both;">
                        	<dt style="height:200px; sborder-radius: 10px 10px 0 0;">1등 이미지
                        		<img src="${pageContext.request.contextPath}/img/ico_first.png" alt="1등">
                        	</dt>
                        	<dt style="height:100px; border-radius: 0 0 10px 10px;">1등 정보</dt>	                        
                        </dl>	                             
                        <dl style=" float:left; width: 35%;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">2등 이미지
                        		<img src="${pageContext.request.contextPath}/img/ico_second.png" alt="2등" >
                        	</dt>
                        	<dt style="height:100px; border-radius: 0 0 10px 10px;">2등 정보</dt>	                        
                        </dl>	                             
					      <dl> <dt style="clear:both; height:100px;  width: 82%; border-radius: 10px;">3등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">4등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">5등</dt> </dl>
					   </div>
		           </div>
		     </div>
		       <div style="float:left; width:38%;">
		           <div class="box3">
                     <h2>BEST</h2>
                        <ul class="tab-menu">
                            <li>주간</li>
                            <li class="active">월간</li>
                        </ul>
                        <div class="Boardlayout">
                    	 <dl style=" float:left; width: 35%;  clear:both;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">1등 이미지
                        		<img src="${pageContext.request.contextPath}/img/ico_first.png" alt="1등">
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px;">1등 정보</dt>	                        
                        </dl>	                             
                        <dl style=" float:left; width: 35%;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">2등 이미지
                        		<img src="${pageContext.request.contextPath}/img/ico_second.png" alt="2등" >
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px;">2등 정보</dt>	                        
                        </dl>	                             
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px; clear:both;">3등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">4등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">5등</dt> </dl>
					   </div>
		           </div>
		       </div>
		    </div> 

       
		<div>
  			<div class="box4">
				<h1>추천상품</h1>
       			<div class="box4p1"></div>
		      	<div class="box4p2"></div>
           		<div class="box4p3"></div>
       		</div>
		</div>	
		
		
		 <div class="content_box" style="clear: both;">
		 		<p>회원들이 좋아하는</p> 
				<h2>WEEKLY BEST PHOTO</h2>
			<ul id="scroller">
			    <li><img src="${pageContext.request.contextPath}/img/cat1.jpg" alt="photo1"></li>
			    <li><img src="${pageContext.request.contextPath}/img/cat2.png" alt="photo2"></li>
			    <li><img src="${pageContext.request.contextPath}/img/pet1.jpg" alt="photo3"></li>
			    <li><img src="${pageContext.request.contextPath}/img/dob.jpg" alt="photo4"></li>
			    <li><img src="${pageContext.request.contextPath}/img/wen.jpg" alt="photo5"></li>
			</ul>	            
        </div>
		
	<div class="topMove">
		<a href="#"><img src="${pageContext.request.contextPath}/img/topScroll.png" title="상단이동"></a>
	</div>

	</article>
	

