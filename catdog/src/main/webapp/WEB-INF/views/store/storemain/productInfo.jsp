<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.rightbox{
	width: 50%;
	margin-left: 20px;
}
.sub{
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 15px;
}
.click{
	width: 100%;
	height: 60px;
	background: orange; 
	float: left; 
	margin-left: 10px; 
	text-align: center; 
	line-height: 60px;
	margin-top: 30px;
}

.tabmenu{ 
  max-width:80%; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f8f1f1;
  line-height:40px;
  
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ffcda3;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
</style>
<script type="text/javascript">
function cart(prdNum) {
	var url = "${cartUrl}?page=${page}&prdNum="+prdNum;
	location.href=url;
}
function orderDetail(prdNum) {
	var url = "${orderDetailUrl}?page=${page}&prdNum="+prdNum;
	location.href=url;
}

// -----------------------------------------------------------------
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
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
	    	} else if(jqXHR.status===410) {
	    		alert("삭제된 게시물입니다.");
	    		return false;
	    	} else if(jqXHR.status===402) {
	    		alert("권한이 없습니다.");
	    		return false;
	    	}

	    	console.log(jqXHR.responseText);
	    }
	});
}

$(function(){
	$(".tab-content").click(function(){
		var id=$(this).parent().attr("id");
		var s="content";
		if(id=="tab2") {
			s="qna";
		} else if(id=="tab3"){
			s="review";
		}
		$(".tab-container").attr("data-content", s);
		
		listPage(1);
	});
});


function listPage(page) {
	var tab = $(".tab-container").attr("data-content");
	if(tab=="content"){
		return;
	}
	
	var url="${pageContext.request.contextPath}";
	var selector="";
	if(tab==="qna") {
		url+="/storemain/prdqna/list";
		selector=".qna-list"
	} else if(tab==="review") {
		url+="/storemain/prdreview/list";
		selector=".review-list";
	}
	var query="pageNo="+page+"&prdNum=${dto.prdNum}";
	
	ajaxHTML(url, "get", query, selector);
}

// 상품 문의
$(function(){
	$(".btnSendQna").click(function(){
		var $ta=$(this).parent().parent().find("textarea");
		var content = $ta.val();
		if(! content) {
			$ta.focus();
			return false;
		}
		var url="${pageContext.request.contextPath}/storemain/prdqna/created";
		var query=$("form[name=qnaForm]").serialize();
		query+="&prdNum=${dto.prdNum}";
		
		var fn = function(data){
			$ta.val("");
			listPage(1);
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});


// 리뷰 달기
$(function(){
	$(".btnSendReview").click(function(){
		var $ta=$(this).parent().parent().find("textarea");
		var content = $ta.val();
		if(! content) {
			$ta.focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/storemain/prdreview/created";
		var query="reContent="+content+"&prdNum=${dto.prdNum}";

		var fn = function(data){
			$ta.val("");
			listPage(1);
		};
		
		 ajaxJSON(url, "post", query, fn);		
		
	});
});

//총금액 계산
$(function() {
	var prdPrice="${dto.prdPrice}"; //12300
	var prdDisCount="${dto.prdDisCount}"; //10%
	prdDisCount = prdPrice*(prdDisCount/100); //1230
	var prdTotal = prdPrice-prdDisCount;
	$("#total").html(prdTotal);
	
});
</script>
<br><br><br>

<div style="width: 100%; clear: both; min-height: 200px;">
	<div class="firstBox" style="width: 100%; display: flex; justify-content: center;">
		<div class="second" style="width: 80%; display: flex;">
			<div style="width: 50%; height: 50%; border: none;">
				<img style="width: 100%; max-height: 450px;"
					src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}">
			</div>
			<div class="rightbox" style="height: 70%;">
				<ul>
					<li class="sub" style="float: right;">조회수:${dto.prdHitCount }</li>
					<li class="sub" >${dto.prdName }</li>
					<li class="sub" style="text-align: right;">${dto.prdPrice}원</li>
					<li class="sub">할인율:${dto.prdDisCount}%</li>
							<li class="sub" style="text-align: right; margin-top: 30px;"><p>총 상품 가격:<span id="total"></span>원</p>
					<li>
				</ul>
					<div class="click" onclick="javascript:orderDetail('${dto.prdNum}');">구매하기</div>	
			</div>
		</div>
	</div>
	<br><br>
	
	<div class="tabmenu tab-container" style="min-height: 1400px;" data-content="content">
	  <ul>
	    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1" >
	      <label for="tabmenu1" class="tab-content">상품설명</label>
	      <div class="tabCon" style="width: 100%;">
				${dto.prdContent }
		</div>
	      
	    </li>
	    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
	      <label for="tabmenu2" class="tab-content">상품문의</label>
	      <div class="tabCon" style="width: 100%;">
	      	   <form name="qnaForm">
	             <div>
	                 <div style="clear: both; padding-top: 10px;">
	                 	<div style="float: left; width: 10%;">
	                 		<select name="qnaCategory">
	                 			<option value="1">상품문의</option>
	                 			<option value="2">배송문의</option>
	                 			<option value="3">교환/환불</option>
	                 		</select>
	                 	</div>
	                 	<div style="float: left; width: 50%;">
	                 		비밀글 <input type="checkbox" name="qnaSecret" value="1" style="display: inline-block;">
	                 	</div>
	                  </div>
	                 <div style="clear: both; padding-top: 10px;">
	                       <textarea name="qnaContent" class="boxTF" rows="3" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;"></textarea>
	                  </div>
	                  <div style="text-align: right; padding-top: 10px;">
	                       <button type="button" class="btn btnSendQna" style="padding:8px 25px;"> 등록하기 </button>
	                  </div>           
	            </div>
	           </form>
	           <div class="qna-list" style="clear: both;">
	           
	           </div>
	      </div>
	    </li>    
	    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
	      <label for="tabmenu3" class="tab-content">상품후기</label>
	      <div class="tabCon" style="width: 100%;">
	      	   <form name="reviewForm">
	             <div>
	                 <div style="clear: both; padding-top: 10px;">
	                       <textarea class="boxTF" rows="3" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;"></textarea>
	                  </div>
	                  <div style="text-align: right; padding-top: 10px;">
	                       <button type="button" class="btn btnSendReview" style="padding:8px 25px;"> 등록하기 </button>
	                  </div>           
	            </div>
	           </form>
	           <div class="review-list" style="clear: both;">
	           
	           </div>
	      </div>
	    </li>
	  </ul>
	</div>

</div>
