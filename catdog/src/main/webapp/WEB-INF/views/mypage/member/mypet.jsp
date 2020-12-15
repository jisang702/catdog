<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(function(){
	setDateBox();
});    

function setDateBox(){
	var dt = new Date();
	var year = "";
	var com_year = dt.getFullYear();
	// 발행 뿌려주기
	$("#YEAR").append("<option value=''>년도</option>");
		for(var y = (com_year-30); y <= (com_year); y++){
			$("#YEAR").append("<option value='"+ y +"'>"+ y +"</option>");
		}
	var month;
	$("#MONTH").append("<option value=''>월</option>");
		for(var i = 1; i <= 12; i++){
			$("#MONTH").append("<option value='"+ i +"'>"+ i +"</option>");
		}
		
	var day;
	$("#DAY").append("<option value=''>일</option>");
		for(var i = 1; i <= 31; i++){
			$("#DAY").append("<option value='"+ i +"'>"+ i + "</option>");
		}
}
</script>

<div class="mypageBody">
	<div class="mypageLayout">
		<div class="mypage3">
			<div class="mypagetab">
					<p>My Pet</p>	
			</div>
		</div>
		<div class="mypage1">
			<div class="mypetlist">
				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>슈슈슈</li>
						<li class="petbtn1"><a href="#petModal1" rel="modal:open"><button type="button">자세히 보기</button></a></li>
					</ul>		
				</div>				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/resources/css/images/dog.jpeg">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>슈슈슈</li>
						<li class="petbtn1"><a href="#petModal1" rel="modal:open"><button type="button">자세히 보기</button></a></li>

					</ul>		
				</div>
			</div>
			<div class="petbtn2">
				<a href="#petModal2" rel="modal:open"><button>반려동물 추가</button></a>
			</div>		
		</div>
	</div>
</div>

<div id="petModal1" class="modal">
	<div class="petModal-content">
		<ul>
			<li class="td">이름</li>
			<li>슈슈슈</li>
		</ul>
		<ul>
			<li class="td">나이</li>
			<li>00살</li>
		</ul>
		<ul>
			<li class="td">성별</li>
			<li>암컷</li>
		</ul>
		<ul>
			<li class="td">품종</li>
			<li>가가가</li>
		</ul>
		<ul>
			<li class="td">소개</li>
			<li>가가나나나다다다다라라ㅏ라ㅏ마마닫다</li>
		</ul>
		<ul>
			<li class="td">사진</li>
			<li><img src=""></li>
		</ul>
	</div>
	<a rel=""><button class="mybtn1">삭제</button></a>
	<a href="#petModal2" rel="modal:open"><button type="button" class="mybtn1">수정</button></a>

</div>

<div id="petModal2" class="modal">
	<div class="petModal-content">
		<ul>
			<li class="td">이름 </li>
			<li><input class=""></li>
		</ul>
		<ul>
			<li class="td">생년월일</li>
			<li>
				<select name="YEAR" id="YEAR" title="년도" class="select w80"></select>    
				<select name="MONTH" id="MONTH" title="월" class="select w80"></select>
				<select name="DAY" id="DAY" title="일" class="select w80"></select>
			</li>
		</ul>
		<ul>
			<li class="td">성별</li>
			<li>
				<label><input type="radio" name="gender">암컷</label>
				<label><input type="radio" name="gender">수컷</label>
			</li>
		</ul>
		<ul>
			<li class="td">품종</li>
			<li><input>
			</li>
		</ul>
		<ul>
			<li class="td">소개</li>
			<li>
				<textarea placeholder="간단한 정보를 입력해주세요"></textarea>
			</li>
		</ul>
		<ul>
			<li class="td">사진</li>
			<li>
				<input type="file">
			</li>
		</ul>
	</div>
	<a rel="modal:close"><button class="mybtn1">닫기</button></a>
	<button type="button" class="mybtn2">저장하기</button>
</div>
