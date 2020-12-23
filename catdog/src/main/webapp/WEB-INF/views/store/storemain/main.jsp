<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
body{
	margin-left: 100px;
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
.imgLayout{
	width:180px;
	height: 205px;
	padding: 10px 5px 10px;
	margin: 5px;
	border: none;
	cursor: pointer;
	border: 1px solid #fff;
}
.imgbox{
 width: 180px;
 height: 180px;
 border-radius: 20px 20px 20px 20px;
}
 img{
border: none;
border-radius: 7px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;

width: 100%;
height: 100%;
}

</style>
<script type="text/javascript">
function productInfo(prdNum) {
	var url="${productUrl}?page=${page}&prdNum="+prdNum;
	location.href=url;
}
</script>

<br>
<br><br>
<h1 align="center">${gubun=="dog"?"댕댕이":"냥냥이"} 스토어</h1>
<br>
<h2 align="center">사료</h2>
<div>
	

	<span>
		<select class="box" style="margin-left: 200px;">
			<option>사료</option>
			<option>옷</option>
			<option>간식</option>
			<option>기타</option>
		</select>
	</span>
	<span>
		<select class="box" style="float:right; margin-right: 150px;" >
			<option>조회순</option>
			<option>가격이높은순</option>
			<option>가격이낮은순</option>
			<option>등록순</option>
			
		</select>
	</span>
</div>
	
		
<table style=" margin: 0px auto; border-spacing: 0px;">
<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td align="center">
			        <div class="imgLayout">
			        	<div class="imgbox">
			             <img src="${pageContext.request.contextPath}/resources/css/img/mainCat.jpg"
			             onclick="javascript:productInfo('${dto.prdNum}');" >
			            </div>
			             <span class="subject" onclick="javascript:productInfo('$(dto.prdNum)');">제목: ${dto.prdName}</span>
			             <br>
			             <span>가격 :${dto.prdPrice }</span>
			       	     <br>
			             <span>조회수:${dto.prdHitCount} </span> 
			            
			         </div>
			     </td>
</c:forEach>

<c:set var="n" value="${list.size()}"/>
<c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			         <td width="100">
			             <div class="imgLayout">&nbsp;</div>
			         </td>
		        </c:forEach>
</c:if>
	
<c:if test="${n!=0 }">
		       <c:out value="</tr>" escapeXml="false"/>
</c:if>
</table>   
<br><br>
		   <tr height="35">
			<td align="center">
			    ${dataCount==0?"등록된 상품이 없습니다.":paging}
			 </td>
		   </tr>