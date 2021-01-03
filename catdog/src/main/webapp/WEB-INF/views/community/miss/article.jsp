<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d48bc298f4fa3304fff9c3eefffc2b4&libraries=services,clusterer,drawing"></script>
<script>
function deleteDeal(missNum) {
	var q = "missNum=${dto.missNum}&${query}";
	var url = "${pageContext.request.contextPath}/community/miss/delete?" + q;

	if(confirm("글을 삭제하시겠습니까?")) {
			location.href=url;
	}
}

function ajaxJSON(url, method, query, fn) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}


</script>

<div class="body-container">    
    <div class="board">
        <div class="flea-articletop">
        	<div class="miss-articleimg">
        		<c:choose>
					<c:when test="${not empty imgurl}">
						<img src="${imgurl}">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/css/images/noimage.gif">
					</c:otherwise>
				</c:choose>
        	</div>
        	<div class="miss-title">
        		<ul>
        			<li style="text-align: right;">userNick</li>
	    			<li class="title">찾아여</li>
	    		</ul>
	    		<ul class="missInfo">
	    			<li>품종</li>
	    			<li>이름(나이)</li>
	    			<li>성별</li>
	    			<li style="min-height: 100px;">특징</li>
	    			<li>날짜</li>
	    			<li>지역</li>	
	    		</ul>
	    		<ul>
	    		</ul>
        	</div> 	
        </div>
        <div>
	    	<div class="flea-article">
	    		<div class="flea-content">
	    			<span></span>
	    			<ul>
	    				<li style="min-height: 100px;">
	    					찾~~~~~~~~~~아~~~~~~~~~~~요~~~~~~~~!!!!!!!!!!
	    				</li>
	    				<li>
	    					<div id="map" style="width: 850px; height: 400px;"></div>
	    				</li>
	    			</ul>
	    		</div>
	    		<div class="fleaarticlebtn">
    				<div>
    					<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/miss/list">글목록</a>
    				</div>
    				<div>
		    			<c:if test="${sessionScope.member.userId==dto.userId}">				    
			          		<button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/miss/update?page=${page}&missNum=${dto.missNum}';">수정</button>
				       </c:if>
				       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
				          <button type="button" class="mybtn1" onclick="deleteMiss(${dto.dealNum});">삭제</button>
				       </c:if>
    				</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="commentLayout">
			<div class="comment">
				<ul class="commenttitle">
					<li><span id="replyCount" class="commentcount">${replyCount}</span>개의 댓글</li>				</ul>				
				<ul class="commentinput">
					<li style="position: relative;">
						<textarea name="reply" rows="4" cols="110" maxlength="300"></textarea>
						<button type="button" class="mybtn2 sendreplybtn">등록하기</button>
					</li>
				</ul>	
			</div>
		</div>
		<div id="listReply"></div>
    </div>
</div>

<script>
var mapContainer = document.getElementById('map'),
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 3
};

var map = new kakao.maps.Map(mapContainer, mapOption);
 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

var marker = new kakao.maps.Marker({
position: markerPosition
});

marker.setMap(map);
</script>