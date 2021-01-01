<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainht.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>

<style type="text/css">

a{
	text-decoration: none;
}

a .subject:hover{
	cursor: pointer;
	color: tomato;
	text-decoration: none;
}

.board-list tr:hover{
	cursor: pointer;
	background-color: #f6f6f6;
}

</style>

<script type="text/javascript">

function ajaxFun(url, method, dataType, query, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status == 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList(){
	var f = document.searchForm;
	f.prdPet.value=$("#selectPrdPet").val();
	f.prdState.value=$("#selectPrdState").val();
	f.action="${pageContext.request.contextPath}/admin/storeManage/listProduct";
	f.submit();
}

function send(pet,num){
	var url = "${pageContext.request.contextPath}";
	if(pet == 0){
		
	}else if(pet == 1){
		url+="/store/dog/productInfo?prdNum="+num;
	}else if(pet == 2){
		url+="/store/cat/productInfo?prdNum="+num;
	}
	
	location.href=url;
}

function deleteArticle( num){
	var url = "${pageContext.request.contextPath}/delete/";

	if(confirm("선택한 게시물을 삭제하시겠습니까?")){
		location.href=url;
		
	}
	
	
}
</script>

<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
	     <div class="mypage2">
	     	<div class="mypagetab">
	     		<p>상품 통합 관리</p>
	     	</div>
	     
     <div>
	     <div class="tab-content" style="clear: both; padding: 10px 10px 10px;">
	     	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${productCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
					  <select id="selectPrdPet" class="selectField" onchange="searchList();">
			          		<option value="" ${prdPet=="" ? "selected='selected'":""}>::동물분류::</option>
			          		<option value="0" ${prdPet=="0" ? "selected='selected'":""}>전체</option>
			          		<option value="1" ${prdPet=="1" ? "selected='selected'":""}>강아지</option>
			          		<option value="2" ${prdPet=="2" ? "selected='selected'":""}>고양이</option>
			          </select>
			          <select id="selectPrdState" class="selectField" onchange="searchList();">
			          		<option value="" ${prdState=="" ? "selected='selected'":""}>::판매상태::</option>
			          		<option value="0" ${prdState=="0" ? "selected='selected'":""}>판매중</option>
			          		<option value="1" ${prdState=="1" ? "selected='selected'":""}>판매중지</option>
			          </select>
			      </td>
			   </tr>
			</table>
			
			<table class="listtable1" style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <thead>
	               <tr align="center"  height="35" style="padding: 0"> 
				      <th style="width: 50px; color: #787878; padding: 15px 5px;">번호</th>
				      <th style="width: 60px; color: #787878; padding: 15px 5px;">분류</th>
				      <th style="width: 65px; color: #787878; padding: 15px 5px;">카테고리</th>
				      <th style="width: 250px; color: #787878; padding: 15px 5px;">상품명</th>
				      <th style="width: 100px; color: #787878; padding: 15px 5px;">아이디</th>
				      <th style="width: 120px; color: #787878; padding: 15px 5px;">등록일</th>
				      <th style="width: 50px; color: #787878; padding: 15px 5px;">상태</th>			  
				      <th style="width: 50px; color: #787878; padding: 15px 5px;">수정</th>	
				      <th style="width: 50px; color: #787878; padding: 15px 5px;">삭제</th>		      	    
				  </tr>
			 </thead>
			 
			 <tbody class="board-list">
			 <c:forEach var="dto" items="${list}">
				  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
				      onclick="detailProduct('${dto.prdNum}');"> 
				      <td style="padding: 0;">${dto.listNum}</td>
				      <td style="padding: 0;">${dto.prdPet=="0" ? "전체" : (dto.prdPet=="1" ? "강아지" : "고양이") } </td>
				      <td style="padding: 0;">${dto.prdCategoryName}</td>
				      <td style="padding: 0;"><a class="subject" onclick="send('${dto.prdPet}','${dto.prdNum}');">${dto.prdName}</a></td>
				      <td style="padding: 0;">${dto.userId}</td>
				      <td style="padding: 0;">${dto.created}</td>
				      <td style="padding: 0;">${dto.prdState=="0" ? "판매중" : "판매중지" } </td>
				      <td style="padding: 0;"><button class="mybtn1" onclick="deleteArticle('${dto.prdNum}')">수정</button> </td>	
				      <td style="padding: 0;"><button class="mybtn2" onclick="deleteArticle('${dto.prdNum}')">삭제</button> </td>		      
				  </tr>
			</c:forEach>
			</tbody>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					${productCount==0?"등록된 자료가 없습니다.":paging} 
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/storeManage/listProduct';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="${pageContext.request.contextPath}/admin/storeManage/listProduct" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="subject"     ${condition=="subject" ? "selected='selected'":""}>글제목</option>
			            	  <option value="created"     ${condition=="created" ? "selected='selected'":""}>작성일</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="page" value="1">
			            <input type="hidden" name="prdPet" value="${prdPet}">
			            <input type="hidden" name="prdState" value="${prdState}">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">&nbsp;</td>
			   </tr>
			</table>
	     </div>
			
			
     </div>
     </div>
	</div>
</div>
<div id="member-dialog" style="display: none;">

</div>