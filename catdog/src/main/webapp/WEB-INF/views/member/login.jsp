<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function sendLogin(){
	var f = document.loginForm;
	
	if(! f.userId.value){
		alert("아이디를 입력하세요.");
		f.userId.focus();
		return;
	}
	
	if(! f.userPwd.value){
		alert("비밀번호를 입력하세요.");
		f.userPwd.focus();
		return;
	}
	
	f.action="${pageContext.request.contextPath}/member/login";
	f.submit();
}
</script>

<form name="loginForm" method="post">
	<div class="loginLayout">
		<div class="jointitle">
				<span>로그인</span>
		</div>
		<div class="login">
			<ul>
				<li><input class="logininput" type="text" name="userId" id="userId" placeholder="아이디"></li>
				<li><input class="logininput" type="password" name="userPwd" id="userPwd" placeholder="비밀번호"></li>
				<li class="loginchk"><input type="checkbox"> 아이디 저장</li>
				<li><button class="loginbtn" type="button" onclick="sendLogin();">로그인</button></li>
				<li class="loginmenu">
					<a>아이디 찾기</a>&nbsp;&nbsp;&nbsp;
					<a>비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/member/register">회원가입</a>
				</li>
			</ul>
			<ul>	
				<li>
					<span style="color: blue;">${message}</span>
				</li>
			</ul>
		</div>
	</div>
</form>