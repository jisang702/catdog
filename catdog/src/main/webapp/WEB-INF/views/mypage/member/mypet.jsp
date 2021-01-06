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

function ajaxHTML(url, method, query, selector){
	$.ajax({
		type:method,
		url:url,
		data:query,
		success:function(data){
			$(selector).html(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status===403){
				login();
				return false;
			}else if(jqXHR.status===410){
				alert("삭제된 게시물입니다.");
				return false;
			}else if(jqXHR.status===402){
				alert("권한이 없습니다.");
				return false;
			}
			
			console.log(jqXHR.responseText);
		}
	});
}

function ajaxFileJSON(url, method, query, fn){
	$.ajax({
		type:method,
		url:url,
		processData:false,
		contentType:false,
		data:query,
		dataType:"json",
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status===403){
				login();
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function sendOk(mode){
	var f=document.petForm;
	
	var str=f.petName.value;
	if(! str){
		alert("이름을 입력하세요.");
		f.petName.focus();
		return;
	}
	
	str=f.petGender.value;
	if(! str){
		alert("성별을 선택하세요.");
		f.petGender.focus();
		return;
	}
	
	str=f.petKind.value;
	if(! str){
		alert("품종을 입력하세요.");
		f.petKind.focus();
		return;
	}
	
	str=f.petContent.value;
	if(! str){
		alert("내용을 입력하세요.");
		f.petContent.focus();
		return;
	}
	
	str=f.upload.value;
	if(! str){
		alert("사진을 첨부하세요.");
		f.upload.focus();
		return;
	}
	
	var url="${pageContext.request.contextPath}/mypage/mypet/"+mode;
	var query=new FormData(f);
	console.log(query);
	var fn = function(data){
		var state=data.state;
		if(state=="ture") {
			alert("등록하였습니다.");
		}
		location.reload();
	};
	
	ajaxFileJSON(url, "post", query, fn);
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
				<c:forEach var="vo" items="${list}">
				<div class="petlist">
					<ul class="petphoto">
						<li><a href="#">
								<img src="${pageContext.request.contextPath}/uploads/pet/${vo.petImgName}">							
						</a></li>
					</ul>
					<ul class="petinfo">
						<li>${vo.petName}</li>
						<li class="petbtn1"><a href="#petModal1" rel="modal:open"><button type="button">자세히 보기</button></a></li>
					</ul>		
				</div>
				</c:forEach>
			</div>
			<div class="petbtn2">
				<a href="#petModal2" rel="modal:open"><button>반려동물 추가</button></a>
			</div>		
		</div>
	</div>
</div>

<div id="petModal1" class="modal">
		<ul class="modal-top">
			<li><h3>반려동물 상세정보</h3></li>
		</ul>
	<div class="petModal-content">
		<ul>
			<li class="td">이름</li>
			<li>${dto.petName}</li>
		</ul>
		<ul>
			<li class="td">생년월일</li>
			<li>${dto.petBirth}</li>
		</ul>
		<ul>
			<li class="td">성별</li>
			<li>
				<c:if test="${dto.petGender==1}">
					암컷
				</c:if>
				<c:if test="${dto.petGender==2}">
					수컷
				</c:if>
			</li>
		</ul>
		<ul>
			<li class="td">품종</li>
			<li>${dto.petKind}</li>
		</ul>
		<ul>
			<li class="td">소개</li>
			<li>${dto.petContent}</li>
		</ul>
		<ul>
			<li class="td">사진</li>
			<li><img src="${pageContext.request.contextPath}/uploads/pet/${dto.petImgName}"></li>
		</ul>
	</div>
	<div class="modalbtn">
		<a href="#petModal2" rel="modal:open"><button type="button" class="mybtn1">수정</button></a>
		<a rel=""><button class="mybtn1">삭제</button></a>
	</div>
</div>

<div id="petModal2" class="modal">
		<ul class="modal-top">
			<li><h3>반려동물 등록</h3></li>
		</ul>
	<div class="petModal-content">
		<form name="petForm" method="post">
			<ul>
				<li class="td">이름 </li>
				<li><input class="" name="petName"></li>
			</ul>
			<ul>
				<li class="td">생년월일</li>
				<li>
					<select name="year" id="YEAR" title="년도" class="select w80"></select>    
					<select name="month" id="MONTH" title="월" class="select w80"></select>
					<select name="day" id="DAY" title="일" class="select w80"></select>
				</li>
			</ul>
			<ul>
				<li class="td">성별</li>
				<li>
					<label><input type="radio" name="petGender" value="1">암컷</label>
					<label><input type="radio" name="petGender" value="2">수컷</label>
				</li>
			</ul>
			<ul>
				<li class="td">품종</li>
				<li><input type="text" name="petKind">
				</li>
			</ul>
			<ul>
				<li class="td">소개</li>
				<li>
					<textarea placeholder="간단한 정보를 입력해주세요" name="petContent"></textarea>
				</li>
			</ul>
			<ul>
				<li class="td">사진</li>
				<li>
					<input type="file" name="upload">
				</li>
			</ul>
		</form>
	</div>
	<div class="modalbtn">
		<button type="button" class="mybtn2" onclick="sendOk('created');">저장하기</button>
		<a rel="modal:close"><button class="mybtn1">닫기</button></a>
	</div>
</div>


