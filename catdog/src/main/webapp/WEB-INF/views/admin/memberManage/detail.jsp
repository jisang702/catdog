<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">회원유형</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userType==1 ? "일반" : (dto.userType==2 ? "수의사" : "판매자") }</span></td>
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">회원번호</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userNum}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">아이디</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">닉네임</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userNick}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">이름</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userName}</span></td>
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">생년월일</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userBirth}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">전화번호</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userTel}</span></td>
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">이메일</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userEmail}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">회원가입일</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userCreated}</span></td>
	    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">최근로그인</label></td>
	    <td align="left" style="padding-left: 5px;"><span>${dto.userLast}</span></td>
	</tr>
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
	    <td align="left" colspan="3" style="padding-left: 5px;">
			  ${dto.userEnabled==1?"활성":(dto.userEnabled==0 ? "잠금" : "탈퇴")}
			  <c:if test="${dto.userEnabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			  &nbsp;<span class="btn" onclick="memberStateDetailView();" style="cursor: pointer;">자세히</span>
	    </td>
	</tr>
</table>

<form id="detailMemberForm" name="detailMemberForm" method="post">
	<h3 style="font-size: 15px;">유저 상태 변경</h3>
	<table style="margin: 5px auto 0px; width: 100%; border-spacing: 1px; background: #cccccc">
		<tr height="37" style="background: #ffffff;">
			<td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
			<td style="padding-left: 5px;">
				<select class="selectField" id="stateCode" name="stateCode" onchange="selectStateChange();">
					<option value="">::상태코드::</option>
					<c:if test="${dto.userEnabled == 0 }">
						<option value="0">잠금 해제</option>
					</c:if>
					<c:if test="${dto.userEnabled == 2 }">
						<option value="7">탈퇴 해제</option>
					</c:if>
					<option value="2">불법적인 방법으로 로그인</option>
					<option value="3">불건전 게시물 등록</option>
					<option value="4">다른 유저 비방</option>
					<option value="5">타계정 도용</option>
					<option value="6">기타 약관 위반</option>
				</select>
			</td>
		</tr>
		<tr height="37" style="background: #ffffff;">
			<td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
			<td style="padding-left: 5px;">
				<input type="text" id="memo" name="memo" class="boxTF" style="width: 90%">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="userNum" value="${dto.userNum}">
	<input type="hidden" name="userId" value="${dto.userId}">
	<input type="hidden" name="userEnabled" value="${dto.userEnabled}">
	<input type="hidden" name="registerId" value="${sessionScope.member.userId}">
</form>

<div id="memberStateDetail" style="display: none">
	<table style="margin: 10px auto 5px; width: 100%; border-spacing: 1px; background: #cccccc">
		<tr height="30" align="center" bgcolor="#ffffff">
			<td>내용</td>
			<td width="130">변경아이디</td>
			<td width="200">등록일</td>
		</tr>
		<c:forEach var="vo" items="${listState}">
		<tr height="30" align="center" bgcolor="#ffffff">
			<td align="left" style="padding-left: 5px;">${vo.memo}(${vo.stateCode})</td>
			<td>${vo.registerId}</td>
			<td>${vo.register_date}</td>
		</tr>
		</c:forEach>
		
		<c:if test="${listState.size() ==0 }">
		<tr height="30" align="center" bgcolor="#ffffff">
			<td colspan="3">등록된 정보가 없습니다.</td>
		</tr>
		</c:if>
	</table>
</div>



