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

<style type="text/css">
.box{
	 border-radius: 0 0 10px 10px; margin-bottom: 10px; text-overflow: ellipsis; padding: 45px 15px 10px;
}

.subject{
	font-size: 20px; font-weight: 500;  margin-top: 28px; margin-left: 0; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;
}

.subject:hover{
	cursor: pointer;
	text-decoration: underline;
}

.info{
	margin-top: 32px; margin-right: 15px; float: right;
}
</style>

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
    
		<div class="boardContainer" style="clear: both; height: 850px">
		       <div style="width:38%;float:left">
		           <div class="box3">
                   	 <h2>COMMUNITY</h2>
                        <ul class="tab-menu">
                            <li class="icon_cat">&nbsp;</li>
                            <li class="icon_dog">&nbsp;</li>
                        </ul>
                        <div class="Boardlayout">
                        
         				<c:forEach var="dto" items="${firstCommu}">
                    	 <dl style=" float:left; width: 36%;  clear:both;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">                
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_first.png" alt="1등">
                        		<a href="${pageContext.request.contextPath}/community/photo/article?photoNum=${dto.num}">
                        			<img src="${pageContext.request.contextPath}/uploads/photo/${dto.saveName}" style="width: 90%; height: 93%">
                        		</a>
                        	</dt>
                        	<dt class="box" style="height:45px;  ">
                        		<span style="font-size: 15px; font-weight: 700">${dto.subject}</span><br>
                        		<span style="float: right; margin-top: 5px;"><i class="far fa-comment-dots"></i>&nbsp;6</span>
                        		<span style="font-size: 13px; font-weight: 500; float: left; margin-top: 5px;">${dto.userNick}</span>
                        	</dt>	                        
                        </dl>
                        </c:forEach>	
                        
                        <c:forEach var="dto" items="${secondCommu}">                             
                        <dl style=" float:left; width: 36%; margin-left: 10px">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_second.png" alt="2등" >
                        		<a href="${pageContext.request.contextPath}/community/photo/article?photoNum=${dto.num}">
                        			<img src="${pageContext.request.contextPath}/uploads/photo/${dto.saveName}" style="width: 90%; height: 93%">
                        		</a>
                        	</dt>
                        	<dt class="box" style="height:45px;  ">
                        		<span style="font-size: 15px; font-weight: 700">${dto.subject}</span><br>
                        		<span style="float: right; margin-top: 5px;"><i class="far fa-comment-dots"></i>&nbsp;5</span>
                        		<span style="font-size: 13px; font-weight: 500; float: left; margin-top: 5px;">${dto.userNick}</span>
                        	</dt>                      
                        </dl>
                        </c:forEach>
                        
                          <c:forEach var="dto" items="${listCommu}" varStatus="status">                       
					      <dl> 
					      	<dt style="height:80px;  width: 80%; border-radius: 10px; margin-bottom: 10px; clear:both;">
					      		<span style="font-size: 25px; font-weight: 300; float: left; margin: 25px 25px 0 25px; ">
					      			<c:out value=" ${status.index+3}"></c:out>
					      		</span>
					      		<span class="subject" style=" float: left;">
					      			<a href="${pageContext.request.contextPath}/community/photo/article?photoNum=${dto.num}">
					      				${dto.subject}
					      			</a>
					      		</span>
					      		<span class="info" ><i class="far fa-comment-dots"></i>
					      		</span>
					      		<span class="info" >
					      			${dto.userNick}
					      		</span>
					      	</dt> 
					      </dl>
					      </c:forEach>
					      
			
					   </div>
		           </div>
		     </div>
		       <div style="float:left; width:38%;">
		           <div class="box3">
                     <h2>PETCARE</h2>
                        <ul class="tab-menu">
                            <li class="icon_cat">&nbsp;</li>
                            <li class="icon_dog">&nbsp;</li>
                      		 </ul>
                        <div class="Boardlayout">
                        
                        <c:forEach var="dto" items="${firstVideo}">
                    	 <dl style=" float:left; width: 36%;  clear:both;">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_first.png" alt="1등">
                        		<a href="${pageContext.request.contextPath}/doctor/video/article?vidNum=${dto.num}">
                        			<img src="${pageContext.request.contextPath}/uploads/doctor/video/${dto.saveName}" style="width: 90%; height: 93%">
                        		</a>
                        	</dt>
                        	<dt class="box" style="height:45px; ">
                        		<span style="font-size: 15px; font-weight: 700; text-overflow: ellipsis;">${dto.subject}</span><br>
                        		<span style="float: right; margin-top: 5px;"><i class="far fa-comment-dots"></i>&nbsp;6</span>
                        		<span style="font-size: 13px; font-weight: 500; float: left; margin-top: 5px;">${dto.userNick}</span>
                        	</dt>                     
                        </dl>
                        </c:forEach>
                        	                             
                        <c:forEach var="dto" items="${secondVideo}">                             
                        <dl style=" float:left; width: 36%; margin-left: 10px">
                        	<dt style="height:200px;  border-radius: 10px 10px 0 0;">
                        		<img src="${pageContext.request.contextPath}/resources/css/img/ico_second.png" alt="2등" >
                        		<a href="${pageContext.request.contextPath}/doctor/video/article?vidNum=${dto.num}">
                        			<img src="${pageContext.request.contextPath}/uploads/doctor/video/${dto.saveName}" style="width: 90%; height: 93%">
                        		</a>
                        	</dt>
                        	<dt class="box" style="height:45px;  ">
                        		<span style="font-size: 15px; font-weight: 700">${dto.subject}</span><br>
                        		<span style="float: right; margin-top: 5px;"><i class="far fa-comment-dots"></i>&nbsp;10</span>
                        		<span style="font-size: 13px; font-weight: 500; float: left; margin-top: 5px;">${dto.userNick}</span>
                        	</dt>                      
                        </dl>
                        </c:forEach>	  
                        
                        <c:forEach var="dto" items="${listVideo}" varStatus="status">                       
					      <dl> 
					      	<dt style="height:80px;  width: 80%; border-radius: 10px; margin-bottom: 10px; clear:both;">
					      		<span style="font-size: 25px; font-weight: 300; float: left; margin: 25px 25px 0 25px; ">
					      			<c:out value=" ${status.index+3}"></c:out>
					      		</span>
					      		<span class="subject" style="width: 250px; float: left; ">
					      			<a href="${pageContext.request.contextPath}/doctor/video/article?vidNum=${dto.num}">
					      				${dto.subject}
					      			</a>
					      		</span>
					      		<span class="info" ><i class="far fa-comment-dots"></i>
					      		</span>
					      		<span class="info" >
					      			${dto.userNick}
					      		</span>
					      	</dt> 
					      </dl>
					      </c:forEach>
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
					<P>[블랭크데이]양모볼 세트</P>
				 	<h2>9000원</h2>
	           </div>
	       </div>
	       <div style="float:left; width: 350px; padding: 20px;">
	           <div class="rcmPhoto4" style="height:300px;"></div>
	           <div class="rcminfo" style="height:100px;">
	           		<p>묘생건강</p> 
					<P>[묘생건강]건대구 스낵</P>
				 	<h2>5000원</h2>
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
			    <li><img src="${pageContext.request.contextPath}/resources/css/img/mainDog2.jpg" alt="photo5"></li>
			</ul>	            
			
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
	

