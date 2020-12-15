<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="alert-info">
  <i class="fas fa-info-circle"></i>
    중요한 일정 및 알림, 이벤트 등은 공지사항 통해 고객님께 알려 드립니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		<td colspan="2" align="center">
		   ${dto.subject}
	    </td>
	</tr>
</table>