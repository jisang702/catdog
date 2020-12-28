<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function commas(t) {
	var x = t.value;		
    x = x.replace(/,/gi, '');

    var regexp = /^[0-9]*$/;
    if(!regexp.test(x)){ 
    	$(t).val(""); 
    	alert("숫자만 입력 가능합니다.");
    } else {
    	x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
    	$(t).val(x);			
    }
}

function searchList() {
	var f=document.searchForm;
	f.submit();
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

$(function() {
	$(".topbtn").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});

$(function() {
	$("body").on("click", ".dealTypebtn", function() {
		var type=$(this).val();
		var url="${pageContext.request.contextPath}/community/deal/list";
		var query="dealType="+type;
		var selector="body";

		ajaxHTML(url, "post", query, selector);
	});
});

</script>
<div class="body-container">
    <div class="board">
    	<div class="boardtitle">
			<ul class="listtitle">
				<li>
					<button type="button" name="dealType" value="1" class="dealTypebtn">팝니다</button>
					<button type="button" name="dealType" value="2" class="dealTypebtn">삽니다</button>
				</li>
			</ul>
		</div>
		<div class="fleaLayout">
			<c:forEach var="dto" items="${list}">
			<div class="fleamarket">
				<div>
					<div class="fleamarket-img">
						<a href="${pageContext.request.contextPath}/community/deal/article?page=${page}&dealNum=${dto.dealNum}">
						<c:choose>
							<c:when test="${not empty dto.imgFileName}">
								<img src="${dto.imgFileName}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/css/images/noimage.gif">
							</c:otherwise>
						</c:choose>
						<c:if test="${dto.dealState==3}">							
							<div class="listimg-cover">
								<div>거래완료</div>
							</div>
						</c:if>
						</a>
					</div>
				</div>
				<div>
					<ul>
						<li style="font-weight: bold; font-size: 20px;">
						<a style="vertical-align: middle;" href="${pageContext.request.contextPath}/community/deal/article?page=${page}&dealNum=${dto.dealNum}">${dto.dealSubject}</a>
						<c:if test="${dto.dealState==2}">
			    			<span class="dealState" style="background: #409444;">
					   			예약중
					   		</span>					   	
						</c:if>
						</li>
					</ul>
					<ul>
						<li class="dealCreated" style="color:#a2a2a2;">
							${dto.dealCreated}
						</li>
					</ul>
					<ul class="fleaprice">
						<li>
							<i class="far fa-eye"><span class=""> ${dto.dealHitCount} </span> </i>
							<i class="far fa-comments"><span class=""> ${dto.replyCount} </span> </i>
						</li>
						<li style="font-weight: bold; font-size:24px; color:#71da65;">${dto.dealPrice}원</li>
					</ul>
				</div>
			</div>
			</c:forEach>
		</div>
		<div>
			<p> ${dataCount==0?"등록된 게시물이 없습니다.":paging} </p>
		</div>
		<div class="fleabtn listfooter" style="margin-top: 30px;">
			<a type="button" class="mybtn1" href="javascript:location.href='${pageContext.request.contextPath}/community/deal/list'">새로고침</a>
			<form name="searchForm" action="${pageContext.request.contextPath}/community/deal/list" method="post">
				<span>
					<select name="condition">
						<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
						<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
						<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
					</select>
					<input type="text" name="keyword" value="${keyword}">
					<button type="button" class="mybtn1" onclick="searchList();">검색</button>
				</span>
			</form>
			<a type="button" class="mybtn1" href="${pageContext.request.contextPath}/community/deal/created">글쓰기</a>
		</div>
    </div>
</div>