<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d48bc298f4fa3304fff9c3eefffc2b4&libraries=services,clusterer,drawing"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	setDateBox();
});    

function setDateBox(){
	var dt = new Date();
	var year = "";
	var com_year = dt.getFullYear();
	
	$("#YEAR").append("<option value=''>년도</option>");
		for(var y = (com_year-5); y <= (com_year); y++){
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

function sendOk() {
	var f = document.missForm;

  	var str = f.missSubject.value;
    if(!str) {
    	alert("제목을 입력하세요. ");
        f.missSubject.focus();
        return false;
    }
    
    str=f.petBreed.value;
    if(!str) {
    	alert("품종을 선택하세요.");
    	f.petBreed.focus();
    	return false;
    }
    
    str=f.petGender.value;
    if(!str) {
    	alert("성별을 선택하세요.");
    	f.petGender.focus();
    	return false;
    }
    
    str=f.petName.value;
    if(!str) {
    	alert("이름을 입력하세요.");
    	f.petName.focus();
    	return false;
    }

    str=f.petAge.value;
    if(!str) {
    	alert("나이를 입력하세요.");
    	f.petAge.focus();
    	return false;
    }
    
    str=f.petCharacter.value;
    if(!str) {
    	alert("특징을 입력하세요.");
    	f.petCharacter.focus();
    	return false;
    }
    
    str=f.petImg.value;
    if(!str) {
    	alert("사진을 첨부하세요.");
    	f.petImg.focus();
    	return false;
    }
    
    str=f.missWhere1.value;
    if(!str) {
    	alert("지역을 선택하세요.");
    	f.missWhere1.focus();
    	return false;
    }
    
    str=f.missWhere2.value;
    if(!str) {
    	alert("지역을 선택하세요.");
    	f.missWhere2.focus();
    	return false;
    }
    
    str=f.year.value;
    if(!str) {
    	alert("날짜를 선택하세요.");
    	f.year.focus();
    	return false;
    }
    
    str=f.month.value;
    if(!str) {
    	alert("날짜를 선택하세요.");
    	f.month.focus();
    	return false;
    }
    
    str=f.day.value;
    if(!str) {
    	alert("날짜를 선택하세요.");
    	f.day.focus();
    	return false;
    }

    str = f.missContent.value;
    if(!str || str=="<p>&nbsp;</p>") {
     	alert("내용을 입력하세요. ");
    	f.missContent.focus();
       	return false;
    }
        
    f.action="${pageContext.request.contextPath}/community/miss/${mode}";
    f.submit();
}
</script>
<script>
$(function() {
	$("input[type='checkbox'][name='petAge']").change(function() {
		var check=this.checked;
		if(check) {
			$("#petAge").attr("disabled", true);
		} else {
			$("#petAge").attr("disabled", false);
		}
	})
});
</script>

<div class="body-container">
    <div class="board">
    	<div class="missLayout">
			<form name="missForm" method="post" enctype="multipart/form-data">
			  <table class="comtable" style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left"> 
			      <td>
			      	<select name="state">
			      		<option value="0">찾습니다</option>
			      	</select>
			      </td>
			      <td colspan="3" style="padding-left:10px;"> 
			        <input style="width: 90%;" type="text" name="missSubject" maxlength="20" value="${dto.missSubject}" placeholder="제목을 입력하세요">
			      </td>
			  </tr>
			
			  <tr align="left"> 
			      <td>작성자</td>
			      <td colspan="3" style="padding-left:10px;"> 
			          ${sessionScope.member.userNick}
			      </td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 품종</td>
			  	<td style="padding-left: 10px;">
			      	<select name="missPet">
			      		<option value="0">전체</option>
			      		<option value="1">강아지</option>
			      		<option value="2">고양이</option>
			      	</select>
			      	<select name="petBreed"></select>
			  	</td>
			  	<td>* 성별</td>
			  	<td>
			  		<input type="radio" name="petGender" value="F"> 암컷
			  		<input type="radio" name="petGender" value="M"> 수컷
			  		<input type="radio" name="petGender" value="Z"> 중성화
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 이름</td>
			  	<td style="padding-left: 10px;">
			  		<input type="text" name="petName">
			  	</td>
			  	<td>* 나이</td>
			  	<td>
			  		<input type="text" id="petAge" name="petAge"> 살 <input type="checkbox" id="notAge" name="petAge" value="X"> 모름
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 특징</td>
			  	<td colspan="3" style="padding-left: 10px;">
			  		<input type="text" style="width: 80%;" maxlength="50" name="petCharacter">
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 사진</td>
			  	<td colspan="3" style="padding-left: 10px;">
			  		<input type="file" name="petImg">
			  	</td>
			  </tr>
			  
			  <tr align="left">
				  <td>실종지역</td>
			      <td style="padding-left:10px;">
			      	<select name="missWhere1"><option>도/시</option></select>
			      	<select name="missWhere2"><option>시/군/구</option></select>
			      </td>
			      <td>실종날짜</td>
			      <td>
			      	<select name="year" id="YEAR" title="년도" class="select w80"></select>    
					<select name="month" id="MONTH" title="월" class="select w80"></select>
					<select name="day" id="DAY" title="일" class="select w80"></select>
			      </td> 
			  </tr>
			  
			  <tr align="left">
			  	<td>구체적인 장소</td>
			  	<td colspan="3" style="padding: 15px;">
			  		<div style="margin-bottom: 15px;">
			  			<input id="keyword" type="text" style="width: 50%;">
			  			<button type="button" class="mybtn1" onclick="searchPlaces();">검색하기</button>
			  		</div>
					<div id="map" style="width:95%;height:250px;"></div>
			  	</td>
			  </tr>
			
			  <tr align="left"> 
			      <td width="100"style="padding-top:15px;" valign="top">상세정보
			      </td>
			      <td colspan="3" valign="top" style="padding:5px 0 5px 10px;"> 
			        <textarea name="missContent" id="missContent" style="width:95%; height: 150px; resize: none;">${dto.missContent}</textarea>
			      </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="mybtn2" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="mybtn1">다시입력</button>
			        <button type="button" class="mybtn1" onclick="javascript:location.href='${pageContext.request.contextPath}/community/miss/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	<input type="hidden" name="state" value="0">
			         	<input type="hidden" name="missNum" value="${dto.dealNum}">
			         	<input type="hidden" name="userId" value="${dto.userId}">
			        	<input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
		</div>
    </div>
</div>


<script>
var markers = [];

var mapContainer = document.getElementById('map'), 
mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 3
    };

var map = new kakao.maps.Map(mapContainer, mapOption);
var ps = new kakao.maps.services.Places(); 

function searchPlaces() {
    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    console.log(keyword);
    ps.keywordSearch(keyword, placesSearchCB); 
}

function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        return;
    } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}

function displayPlaces(places) {
    bounds = new kakao.maps.LatLngBounds();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i);
        
        bounds.extend(placePosition);
    }
    
    map.setBounds(bounds);
}

function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
        imageSize = new kakao.maps.Size(36, 37),  
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), 
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), 
            offset: new kakao.maps.Point(13, 37) 
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position,
            image: markerImage 
        });

    marker.setMap(map);
    markers.push(marker);

    return marker;
}


var marker = new kakao.maps.Marker({ 
    position: map.getCenter() 
}); 
marker.setMap(map);

kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    var latlng = mouseEvent.latLng; 
    
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    console.log(message);
    
});
</script>