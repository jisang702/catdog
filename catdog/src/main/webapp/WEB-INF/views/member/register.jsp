<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="layoutBody">
	<form class="memberform">
		<div class="joinmember">
			<div class="jointitle">
				<ul>
					<li>회원가입</li>
				</ul>
			</div>
			<div class="joinlayout">
				<ul>
					<li class="th">아이디</li>
					<li class="td"><input type="text"></li>
				</ul>
				
				<ul>
					<li class="th">비밀번호</li>
					<li class="td"><input type="password"></li>
				</ul>
				
				<ul>
					<li class="th">비밀번호 확인</li>
					<li class="td"><input type="password"></li>
				</ul>
				
				<ul>
					<li class="th">이름</li>
					<li class="td"><input type="text"></li>
				</ul>
				
				<ul>
					<li class="th">닉네임</li>
					<li class="td"><input type="text"></li>
				</ul>
				
				<ul>
					<li class="th">이메일</li>
					<li class="td1"><input type="text"> @ <input type="text">
						<select class="selectemail">
							<option>직접입력</option>
							<option>daum.net</option>
							<option>naver.com</option>
							<option>google.com</option>
							<option>nate.com</option>
						</select>
					</li>
				</ul>
				
				<ul>
					<li class="th">핸드폰번호</li>
					<li class="td1"><input type="text"> - 
					<input type="text"> - <input type="text"></li>
				</ul>
				<ul>
					<li class="th">주소</li>
					<li class="td1"><input type="text"><button type="button" class="mybtn1">우편번호 검색</button> </li>
					<li class="td"><input type="text"> </li>
				</ul>
			</div>
			<div class="joinbtn">
				<button class="mybtn2" type="button">회원가입</button>
				<button class="mybtn1" type="button">가입취소</button>
				<button class="mybtn1" type="button">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
