<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
	<tr height="37" style="background: #ffffff;">
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">아이디</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
	    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">회원번호</label></td>
	    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userNum}</span></td>
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
			  ${dto.userEnabled==1?"활성":"잠금"}
			  <c:if test="${dto.userEnabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			  &nbsp;<span class="btn" onclick="memberStateDetaileView();" style="cursor: pointer;">자세히</span>
	    </td>
	</tr>
</table>

<form id="detail">

</form>

</body>
</html>

