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
.imgLayout{
	width:250px;
	height: 255px;
	padding: 10px 5px 10px;
	margin: 5px;
	border: none;
	cursor: pointer;
	border: 1px solid #fff;
}
.imgbox{
 width: 200px;
 height: 200px;
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
function article(prdNum) {
	var url="${articleUrl}&prdNum="+prdNum;
	location.href=url;
}

</script>

<br>
<br><br>
<h1 align="center">판매 리스트</h1>
<br>
<h2 align="center">사료</h2>
<div>
	<span>
		<select class="box" style="float:left;">
			<option>사료</option>
			<option>옷</option>
			<option>간식</option>
			<option>기타</option>
		</select>
	</span>
	
	<span>
		<select class="box " style="float:right;" >
			<option>조회순</option>
			<option>가격이높은순</option>
			<option>가격이낮은순</option>
			<option>등록순</option>
			
		</select>
	</span>
</div>



<div style="margin:auto;">
	<table style=" margin: 100px auto; border-spacing: 0px;">
		<c:forEach var="dto" items="${product_list}" varStatus="status">
			<c:if test="${status.index==0}">
				<tr>
			</c:if>
		
			<c:if test="${status.index!=0 && status.index%3==0}">
				<c:out value="</tr><tr>" escapeXml="false"/>
			</c:if>
			<td align="center">
				<div class="imgLayout">
					<div class="imgbox">
						<img src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}"
						onclick="javascript:article('${dto.prdNum}');" >
					</div>
					<span class="subject" onclick="javascript:article('${dto.prdNum}');">제목: ${dto.prdName}</span>
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
				<td width="210">
					<div class="imgLayout">&nbsp;</div>
				</td>
		    </c:forEach>
		</c:if>
			
		<c:if test="${n!=0 }">
	    	<c:out value="</tr>" escapeXml="false"/>
		</c:if>
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
	          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/store/seller/product_list';">새로고침</button>
	      </td>
	      <td align="center">
	          <form name="searchForm" action="${pageContext.request.contextPath}/store/seller/product_list" method="post">
	              <select name="condition" class="selectField">
	                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
	                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
	                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
	                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
	                  <option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
	            </select>
	            <input type="text" name="keyword" value="${keyword}" class="boxTF">
	            <button type="button" class="btn" onclick="searchList()">검색</button>
	        </form>
	      </td>
	      <td align="right" width="100">
	          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/store/seller/product_created';">등록하기</button>
	      </td>
	   </tr>
	</table>
</div>
