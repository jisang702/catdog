<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form action="loginform">
	<div class="loginLayout">
		<div class="jointitle">
				<span>로그인</span>
		</div>
		<div class="login">
			<ul>
				<li><input class="logininput" type="text" placeholder="아이디"></li>
				<li><input class="logininput" type="password" placeholder="비밀번호"></li>
				<li class="loginchk"><input type="checkbox"> 아이디 저장</li>
				<li><button class="loginbtn" type="button">로그인</button></li>
				<li class="loginmenu">
					<a>아이디 찾기</a>
					<a>비밀번호 찾기</a>
					<a>회원가입</a>
				</li>
			</ul>
		</div>
	</div>
</form>