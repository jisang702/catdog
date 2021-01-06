<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
body{
	margin-left: 150px;
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
    margin-bottom: 30px;
}
.pi{
	width: 300px;
	height: 150px;
	display: inline-block;
}
ul{
	list-style: none;
}

</style>
<script type="text/javascript">
function article(prdNum) {
	var url="${articleUrl}&prdNum="+prdNum;
	location.href=url;
}

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

$(function(){
	$(".btnSendAnswer").click(function(){
		var qnaNum = $(this).attr("data-qnaNum");
		var $ta = $(this).closest("td").find("textarea");
		if(! $ta.val()) {
			$ta.focus();
			return false;
		}
		
		// var url="${pageContext.request.contextPath}/store/seller/main/qna";
		var url="${pageContext.request.contextPath}/store/seller/qna/qna_created";
		var query="qnaNum="+qnaNum+"&qnaansContent="+encodeURIComponent($ta.val());
		
		var fn = function(data) {
			// location.href="${pageContext.request.contextPath}/store/seller/qna/qna_created";
			location.href="${pageContext.request.contextPath}/store/seller/main/qna";
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
})


</script>

<br>
<br><br>
<h1 align="center">상품 문의</h1>
<br>


<div style="margin:0 10px;">
	<table style=" margin: 30px; border-spacing: 0px;">
		<c:forEach var="dto" items="${list}" varStatus="status">

		
		    <tr height='35' style='background: #eeeeee;'>
		       <td width='200px' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
		           <span><b>${dto.userName}</b></span>
		        </td>
		       <td width='500px' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
		           <span>
		              ${dto.qnaCategory==1?"상품문의" : (dto.qnaCategory==2?"배송문의":"교환/환불")}
		           </span> |
		           <span>${dto.qnaCreated}</span>
		        </td>
		    </tr>
		    <tr>
		        <td colspan='2' align="left" valign='top' style='padding:5px 5px;'>
		             <p style="font-weight: bold;">상품명 : ${dto.prdName}</p>
		             <p style="margin:20px 0;">문의내용 : ${dto.qnaContent}</p>
		             
		        </td>
		    </tr>
		    
		    <c:if test="${empty qnaansContent}">
	    		 <tr>
			        <td colspan='2' valign='top' style='padding:5px 5px 5px 15px;'>
			            <div style='clear: both; padding: 10px 10px;'>
			                <div style='float: left; width: 5%;'>└</div>
			                <div style='float: left; width:95%'>
			                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
			                 </div>
			            </div>
			             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
			                <button type='button' class='btn btnSendAnswer' data-qnaNum='${dto.qnaNum}'>답글 등록</button>
			            </div>
			        </td>
			    </tr>
			</c:if>
	<%-- 	    <c:choose>
		    	<c:when test="${not empty qnaansContent }">
				    <tr >
				        <td colspan='2' valign='top' style='padding:5px 5px 5px 15px;'>
				            <div style="background: #e4e4e4;">
				            	<div style='float: left; width: 5%;'>└</div>
			            		<div style='float: left; width:95%;'>
			            	    	${dto.qnaansContent}
			            		</div>
			            	</div>
				        </td>
				    </tr>
		    	</c:when>
		    	<c:otherwise>
				    <tr>
				        <td colspan='2' valign='top' style='padding:5px 5px 5px 15px;'>
				            <div style='clear: both; padding: 10px 10px;'>
				                <div style='float: left; width: 5%;'>└</div>
				                <div style='float: left; width:95%'>
				                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
				                 </div>
				            </div>
				             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
				                <button type='button' class='btn btnSendAnswer' data-qnaNum='${dto.qnaNum}'>답글 등록</button>
				            </div>
				        </td>
				    </tr>
		    	
		    	</c:otherwise>
		    </c:choose> --%>
		    
		    
		   
		</c:forEach>
		
		
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center">
				${dataCount==0?"등록된 상품이 없습니다.":paging}
			</td>
		 </tr>
	</table>
		
	<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
	   <tr height="40">
	      <td align="left" width="100">
	          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/store/seller/qna_list';">새로고침</button>
	      </td>


	   </tr>
	</table>
</div>
