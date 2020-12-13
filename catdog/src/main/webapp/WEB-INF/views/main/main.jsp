<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/jquery.simplyscroll.css" media="all" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Signika:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Stylish&display=swap" rel="stylesheet">
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
		           		<h2>호두의 원픽</h2>
		           		<p>간식 후기</p>
		           </div>
		       </div>
		       <div class="box2" style="float:left; width:50%;">
		           <div class="boxText" style="height: 700px;">			          
		           		<h2>겨울철 우리댕이</h2>
		           		<p>따뜻하게 겨울나기</p>
		           </div>
		         
		       </div>
		   </div>
	    </div>

	   <div class="banner" style="float:left; width:100%;">
           <div class="banner" style="height: 100px;">
			<ul>
				<li class="bn1"> <img  src="${pageContext.request.contextPath}/resources/css/img/banner1.png" alt="광고1"> </li>
			</ul>
           </div>
      </div>  
    
		<div class="boardContainer" style="clear: both;">
		       <div style="width:38%;float:left">
		           <div class="box3">
                   	 <h2>MONTHLY</h2>
                        <ul class="tab-menu">
                            <li class="icon_cat">고양이</li>
                            <li class="icon_dog">강아지</li>
                        </ul>
                        <div class="Boardlayout">
                    	 <dl style=" float:left; width: 35%;  clear:both;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">1등 이미지                       
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_first.png" alt="1등">
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px; margin-bottom: 10px;">1등 정보</dt>	                        
                        </dl>	                             
                        <dl style=" float:left; width: 35%;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">2등 이미지
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_second.png" alt="2등" >
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px;margin-bottom: 10px;">2등 정보</dt>	                        
                        </dl>	                             
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px; margin-bottom: 10px; clear:both;">3등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px; margin-bottom: 10px;">4등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">5등</dt> </dl>
					   </div>
		           </div>
		     </div>
		       <div style="float:left; width:38%;">
		           <div class="box3">
                     <h2>WEEKLY</h2>
                        <ul class="tab-menu">
                            <li class="icon_cat">고양이</li>
                            <li class="icon_dog">강아지</li>
                      		 </ul>
                        <div class="Boardlayout">
                    	 <dl style=" float:left; width: 35%;  clear:both;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">1등 이미지
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_first.png" alt="1등">
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px; margin-bottom: 10px;">1등 정보</dt>	                        
                        </dl>	                             
                        <dl style=" float:left; width: 35%;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">2등 이미지
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_second.png" alt="2등" >
                        	</dt>
                        	<dt style="height:100px;  border-radius: 0 0 10px 10px;margin-bottom: 10px;">2등 정보</dt>	                        
                        </dl>	                             
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px; margin-bottom: 10px; clear:both;">3등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px; margin-bottom: 10px;">4등</dt> </dl>
					      <dl> <dt style="height:100px;  width: 82%; border-radius: 10px;">5등</dt> </dl>
					   </div>
		           </div>
		       </div>
		    </div> 
	     
	  <div class="rcmBox" style="clear: both;">
		<div>
	   		<h1>추천상품</h1>
	       <div style="float:left; width: 350px; padding: 20px;">
	           <div class="rcmPhoto1" style="height:300px;"></div>
	           <div class="rcminfo" style="height:100px;">
	           		<p>블랭크데이</p> 
					<P>[블랭크데이]밤 장난감</P>
				 	<h2>8000원</h2>
	           </div>
	       </div>
			<div style="float:left; width: 350px; padding: 20px;">
	           <div class="rcmPhoto2" style="height:300px;"></div>
	           <div class="rcminfo" style="height:100px;">
	           		<p>블랭크데이</p> 
					<P>[블랭크데이]밤 장난감</P>
				 	<h2>8000원</h2>
	           </div>
	       </div>
			<div style="float:left; width: 350px; padding: 20px;">
	           <div class="rcmPhoto3" style="height:300px"></div>
	           <div class="rcminfo" style="height:100px;">
	           		<p>블랭크데이</p> 
					<P>[블랭크데이]밤 장난감</P>
				 	<h2>8000원</h2>
	           </div>
	       </div>
	       <div style="float:left; width: 350px; padding: 20px;">
	           <div class="rcmPhoto4" style="height:300px;"></div>
	           <div class="rcminfo" style="height:100px;">
	           		<p>블랭크데이</p> 
					<P>[블랭크데이]밤 장난감</P>
				 	<h2>8000원</h2>
	           </div>
	       </div>
		</div>  
	   </div>
 			
		 <div class="content_box" style="clear: both;">
		 		<p>회원들이 좋아하는</p> 
				<h2>WEEKLY BEST PHOTO</h2>
			<ul id="scroller">
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/dogpupple.jpg" alt="photo1"></li>
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/catblue.JPG" alt="photo2"></li>
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/pet1.jpg" alt="photo3"></li>
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/dogpink.jpg" alt="photo4"></li>
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/cat1.jpg" alt="photo5"></li>
			</ul>	            
        </div>
   <div class="sellBoxWrap">
		<h2>최다판매</h2>
	<div class="sellBox" style="clear: both; margin: 50px auto;">			
	   <div style="height:400px; padding: 20px;">
	       <div style="float:left; width:300px; ">
	           <div class="sellboxPhoto1" style="height: 350px; border:1px solid #e4e4e4; border-radius: 20px 0 0 20px;"></div>
	       </div>
	       <div style="float:left; width:300px;">
	           <div style="height: 350px; background:#e4e4e4; border:1px solid #e4e4e4; border-radius: 0 20px 20px 0;">
		           	<p>제품설명</p>
		           	<p>제품 가격</p>
	           </div>
	       </div>
	   </div>
	   <div style="height:400px; padding: 20px;">
			<div style="float:left; width:300px;">
	           <div class="sellboxPhoto2" style="height: 350px; border:1px solid #e4e4e4; border-radius: 20px 0 0 20px;"></div>
	       </div>
	       <div style="float:left; width:300px;">
	           <div style="height: 350px; background:#e4e4e4; border:1px solid #e4e4e4; border-radius: 0 20px 20px 0;">
	           		<p>제품설명</p>
		           	<p>제품 가격</p>
	           </div>
	       </div>
	    </div>
	</div>    
  </div>    
	
	<div class="banner" style="float:left; width:100%;">
           <div class="banner" style="height: 100px;">
			<ul>
				<li class="bn2"> <img  src="${pageContext.request.contextPath}/resources/css/img/banner4.jpg" alt="광고2"> </li>				
				<li class="bn3"> <img  src="${pageContext.request.contextPath}/resources/css/img/banner3.jpg" alt="광고1"> </li>
			</ul>
           </div>
      </div> 

	<div class="topMove">
		<a href="${pageContext.request.contextPath}/commu/"><img src="${pageContext.request.contextPath}/resources/css/img/topScroll.png" title="상단이동"></a>
	</div>
	

