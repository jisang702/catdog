<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="body-container" style="width: 900px; ">
	<div style="margin: 70px auto;">
     <div class="body-title">
         <h3><i class="fas fa-user"></i>&nbsp;회원 관리 </h3>
     </div>
     
     <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${dataCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
					  <button class="mybtn2" type="button" style="background: black; color: white">&nbsp;블랙&nbsp;</button>      	
			          <select id="selectEnabled" class="selectField" onchange="searchList();">
			          		<option value="" ${enabled=="" ? "selected='selected'":""}>::계정상태::</option>
			          		<option value="0" ${enabled=="0" ? "selected='selected'":""}>잠금 계정</option>
			          		<option value="1" ${enabled=="1" ? "selected='selected'":""}>활성 계정</option>
			          </select>
			      </td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
               <tr align="center" bgcolor="#B7F0B1" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th style="width: 60px; color: #787878;">번호</th>
			      <th style="width: 60px; color: #787878;">유형</th>
			      <th style="width: 100px; color: #787878;">아이디</th>
			      <th style="width: 100px; color: #787878;">이름</th>
			      <th style="width: 100px; color: #787878;">생년월일</th>
			      <th style="width: 120px; color: #787878;">전화번호</th>
			      <th style="width: 60px; color: #787878;">상태</th>
			      <th style="width: 60px; color: #787878;">신고</th>
			      <th style="color: #787878;">이메일</th>
			  </tr>
			 
			 
			  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;" class="hover-tr"
			      onclick="detailedMember('');"> 
			      <td>1</td>
			      <td>일반</td>
			      <td>psm8778</td>
			      <td>상명상명상</td>
			      <td>1996-02-11</td>
			      <td>010-1111-1111</td>
			      <td>활성</td>
			      <td>0</td>
			      <td>aaa@gmail.com</td>
			  </tr>
			
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="40">
				<td align="center">
					<!-- ${dataCount==0?"등록된 자료가 없습니다.":paging} -->
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/memberManage/list';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
			              <select name="condition" class="selectField">
			                  <option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
			                  <option value="userName"   ${condition=="userName" ? "selected='selected'":""}>이름</option>
			                  <option value="email"      ${condition=="email" ? "selected='selected'":""}>이메일</option>
			                  <option value="tel"        ${condition=="tel" ? "selected='selected'":""}>전화번호</option>
			            </select>
			            <input type="text" name="keyword" class="boxTF" value="${keyword}">
			            <input type="hidden" name="enabled" value="${enabled}">
			            <input type="hidden" name="page" value="1">
			            <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">&nbsp;</td>
			   </tr>
			</table>
			
     </div>
	</div>
</div>
<div id="member-dialog" style="display: none;">

</div>