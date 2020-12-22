<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function deleteDeal(dealNum) {
	var q = "dealNum=${dto.dealNum}&${query}";
	var url = "${pageContext.request.contextPath}/community/deal/delete?" + q;

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

// 거래 상태 변경하기
$(function() {
	$(".dealstate").on("change", function() {
		var state=$(this).find(":selected").val();
		var url="${pageContext.request.contextPath}/community/deal/updateDealState";
		var query="page=${page}&dealNum=${dto.dealNum}&dealState="+state;
		
		var fn=function(data) {
		}

		ajaxJSON(url, "post", query, fn);
	});
});
</script>

<div class="body-container">    
    <div class="board">
        <div class="flea-articletop">
        	<div class="flea-articleimg">
        		<c:choose>
					<c:when test="${not empty dto.imgFileName}">
						<img src="${dto.imgFileName}">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/css/images/noimage.gif">
					</c:otherwise>
				</c:choose>
				<c:if test="${dto.dealState==3}">							
							<div class="img-cover">
								<div>거래완료</div>
							</div>
				</c:if>
        	</div>
        	<div class="flea-title">
        		<ul>
        			<li class="dealType">
        				<c:if test="${dto.dealType==1}">
        					[ 팝니다 ]
        				</c:if>
        				<c:if test="${dto.dealType!=1}">
        					[ 삽니다 ]
        				</c:if>
        			</li>
        		</ul>
        		<ul class="dealinfo">
	    			<li class="title">${dto.dealSubject}</li>
	    		</ul>
	    		<ul>
	    			<li class="price">${dto.dealPrice}원</li>
	    		</ul>
	    		<ul>
	    			<li>
	    				<c:if test="${sessionScope.member.userId==dto.userId}">
		    				<form>
			    				<select class="dealstate" name="dealState">
			    					<option value="1" ${dto.dealState=="1"?"selected='selected'":""}>거래가능</option>
			    					<option value="2" ${dto.dealState=="2"?"selected='selected'":""}>예약중</option>
			    					<option value="3" ${dto.dealState=="3"?"selected='selected'":""}>거래완료</option>
			    				</select>
		    				</form>
	    				</c:if>
	    				<c:if test="${sessionScope.member.userId!=dto.userId}">
	    					<c:if test="${dto.dealState==1}">
			    				<li class="dealState" style="background: #ffc107;">
					   				거래가능
					   			</li>
			    			</c:if>
			    			<c:if test="${dto.dealState==2}">
			    				<li class="dealState" style="background: #409444;">
					   				예약중
					   			</li>
			    			</c:if>
			    			<c:if test="${dto.dealState==3}">
					   			<li class="dealState" style="background: #c5c5c5">
					   				거래완료
					   			</li>
	    					</c:if>
	    				</c:if>
	    			</li>
	    			<li class="dealWay">
	    				<c:if test="${dto.dealWay==1}">
	    					<i class="fas fa-map-marker-alt"></i> ${dto.dealZone}
	    					직거래
	    				</c:if>
	    				<c:if test="${dto.dealWay!=1}">
	    					택배거래
	    				</c:if>
	    			</li>    		
	    		</ul>
	    		<ul class="dealinfo">
	    			<li>
	  					<i class="far fa-eye"> <span class="">${dto.dealHitCount} </span> </i>	  					
	    				<i class="far fa-clock"> <span class="createdTime">${dto.dealCreated}</span></i>
	    			</li>	    				
	    		</ul>
	    		<div>
	    			<ul class="dealuser">
	    				<li class="flea-user"><i class="fas fa-crown"></i> ${dto.userNick}</li>
	    			</ul>
	    		</div>
        	</div> 	
        </div>
        <div>
	    	<div class="flea-article">
	    		<div class="flea-content">
	    			<span></span>
	    			<ul>
	    				<li>
	    					${dto.dealContent}	    					
	    				</li>
	    			</ul>
	    		</div>
	    		<div class="fleaarticlebtn">
    				<div>
    					<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/deal/list">글목록</a>
    				</div>
    				<div>
		    			<c:if test="${sessionScope.member.userId==dto.userId}">				    
			          		<button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/deal/update?page=${page}&dealNum=${dto.dealNum}';">수정</button>
				       </c:if>
				       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
				          <button type="button" class="mybtn1" onclick="deleteDeal(${dto.dealNum});">삭제</button>
				       </c:if>
    				</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="fleausergoods">
	    	<div class="fleagoodstitle">
	    		${dto.userNick}님의 중고 상품
	    	</div>
	    	<div class="fleagoodslist">
	    		<c:forEach var="vo" items="${sublist}">
		    		<div class="fleagoods">
		    			<div class="fleagoodsimg">
		    			<a href="${pageContext.request.contextPath}/community/deal/article?page=${page}&dealNum=${vo.dealNum}">
		    				<c:choose>
							<c:when test="${not empty vo.imgFileName}">
								<img src="${vo.imgFileName}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/css/images/noimage.gif">
							</c:otherwise>
						</c:choose>
						</a>
		    			</div>
		    			<div class="fleagoodsinfo">
		    				<ul>
		    					<li style="font-weight: bold;">${vo.dealSubject}</li>
		    				</ul>
		    				<ul>
		    					<li style="color:#71da65;">${vo.dealPrice}원</li>
		    				</ul>
		    			</div>
		    		</div>
	    		</c:forEach>
	    	</div>
	    </div>
	    <div class="commentLayout">
			<div class="comment">
				<ul class="commenttitle">
					<li><span id="replyCount" class="commentcount">0</span>개의 댓글</li>
				</ul>				
				<ul class="commentinput">
					<li>
						<textarea name="reply" rows="4" cols="110" maxlength="150"></textarea>
						<button type="button" class="mybtn2 sendreplybtn">등록하기</button>
					</li>
				</ul>	
			</div>
		</div>
		<div id="listReply"></div>
    </div>
</div>