<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

.blinking{
   -webkit-animation:blink 1.5s ease-in-out infinite alternate;
    -moz-animation:blink 1.5s ease-in-out infinite alternate;
    animation:blink 1.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}

</style>

<script type="text/javascript">
function deleteProduct() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	var q = "prdNum=${dto.prdNum}&${query}";
    var url = "${pageContext.request.contextPath}/store/seller/delete?" + q;

    if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	  location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
  alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateProduct() {
<c:if test="${sessionScope.member.userId==dto.userId}">
	var q = "prdNum=${dto.prdNum}&page=${page}";
    var url = "${pageContext.request.contextPath}/store/seller/update?" + q;

    location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
   alert("게시물을 수정할 수  없습니다.");
</c:if>
}

//총금액 계산
$(function() {
	var prdPrice="${dto.prdPrice}"; //12300
	var prdDisCount="${dto.prdDisCount}"; //10%
	prdDisCount = prdPrice*(prdDisCount/100); //1230
	var prdTotal = prdPrice-prdDisCount;
	$("#total").html(prdTotal);
	
});
</script>

<div class="body-container" style="width: 100%;">
    
	<br>
	<br><br>
	<h1 align="center">상품 목록</h1>
	<br>
	    
    <div>
			<div class="firstBox" style="width: 90%; display: flex; justify-content: center;">
				<div class="second" style="width: 80%; display: flex;">
					<div style="width: 50%; height: 50%; border: none;">
						<img style="width: 60%; max-height: 450px;"
							src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}">
					</div>
					<div class="rightbox" style="height: 60%;">
						<ul>
							<li class="sub" style="text-align: right;">조회수 : ${dto.prdHitCount }</li>
							<br>
							<li class="sub">${dto.prdName}</li>
							<br>
							<c:choose>
								<c:when test="${dto.prdDisCount!=0}">
									<li class="sub" style="float: right; text-decoration:line-through; opacity:0.5;">가격 : ${dto.prdPrice}원</li>
								</c:when>
								<c:otherwise>
									<li class="sub" style="float: right;">가격 : ${dto.prdPrice}원</li>
								</c:otherwise>
							</c:choose>
							<li class="sub blinking" style="margin-top: 60px; text-align: right; color: red;">할인율:${dto.prdDisCount}%</li>
							<li class="sub" style="float: right; margin-top: 30px;"><p>총 상품 가격 : <span id="total"></span>원</p></li>
					
						</ul>
					</div>
				</div>
			</div>
			<br><br>
			
			<table style="width: 60%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="center" style="padding: 10px 5px;" valign="top" height="50">
			      ${dto.prdContent}
			   </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="${pageContext.request.contextPath}/store/seller/article?${query}&prdNum=${preReadDto.prdNum}">${preReadDto.prdName}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="${pageContext.request.contextPath}/store/seller/article?${query}&prdNum=${nextReadDto.prdNum}">${nextReadDto.prdName}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 60%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <%-- <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="btn" onclick="updateProduct();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId">				    
			          <button type="button" class="btn" onclick="deleteProduct();">삭제</button>
			       </c:if>
			    </td> --%>
			    <td align="left">
			          <button type="button" class="btn" onclick="updateProduct();">수정</button>
			          <button type="button" class="btn" onclick="deleteProduct();">삭제</button>
			       
				</td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/store/seller/product_list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>