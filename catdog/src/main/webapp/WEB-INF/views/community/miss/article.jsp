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
</script>

<div class="body-container">    
    <div class="board">
        <div class="flea-articletop">
        	<div class="flea-articleimg">
        		<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">
        	</div>        	
        </div>
        <div>
	    	<div class="flea-article">
	    		<form>
	    		<div class="flea-title">
	    			<ul class="dealinfo">
	    				<li class="title">${dto.dealSubject}</li>
	    				
	    				<li>
	    					<c:if test="${sessionScope.member.userId==dto.userId}">
		    					<select name="dealState" onchange="updateState(this.form);">
		    						<option value="1" ${dto.dealState=="1"?"selected='selected'":""}>거래가능</option>
		    						<option value="2" ${dto.dealState=="2"?"selected='selected'":""}>거래중</option>
		    						<option value="3" ${dto.dealState=="3"?"selected='selected'":""}>거래완료</option>
		    					</select>
	    					</c:if>
	    				</li>
	    			</ul>
	    			<ul>
	    				<li class="price">${dto.dealPrice}원</li>
	    					<c:if test="${dto.dealState==1}">
	    					</c:if>
	    					<c:if test="${dto.dealState==2}">
	    						<li class="dealState" style="background: #ffc107;">
			    					거래중
			    				</li>
	    					</c:if>
	    					<c:if test="${dto.dealState==3}">
			    				<li class="dealState" style="background: #c5c5c5">
			    					거래완료
			    				</li>
	    					</c:if>
	    				<li class="dealWay">
	    					<c:if test="${dto.dealWay==1}">
	    						직거래
	    					</c:if>
	    					<c:if test="${dto.dealWay!=1}">
	    						택배거래
	    					</c:if>
	    				</li>	    				
	    			</ul>
	    			<ul class="dealinfo">
	    				<li class="flea-user"><i class="fas fa-crown"></i> ${dto.userNick}</li>
	    				<li>
	  						<i class="far fa-eye"> <span class="">${dto.dealHitCount} </span> </i>	  					
	    					<i class="far fa-clock"> <span class="createdTime"></span></i>
	    				</li>	    				
	    			</ul>
	    		</div>
	    		</form>
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
		    			<button type="button" class="mybtn1">수정</button>
	    				<button type="button" class="mybtn1" onclick="deleteDeal(${dto.dealNum});">삭제</button>
    				</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="fleausergoods">
	    	<div class="fleagoodstitle">
	    		${dto.userNick}님의 다른 중고 상품
	    	</div>
	    	<div class="fleagoodslist">
	    		<c:forEach var="vo" items="${sublist}">
		    		<div class="fleagoods">
		    			<div class="fleagoodsimg">
		    				<img src="${pageContext.request.contextPath}/resources/css/images/cat.jpeg">
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
    </div>
</div>