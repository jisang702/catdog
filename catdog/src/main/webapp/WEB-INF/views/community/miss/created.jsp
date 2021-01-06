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


</script>
<script>
$(function() {
	$("input[type='checkbox'][id='notAge']").change(function() {
		var check=this.checked;
		var $box=$("#petAge");
		if(check) {
			$("#petAge").attr("disabled", true);
		} else {
			$("#petAge").attr("disabled", false);
		}
	})
	
	$("input[type='checkbox'][id='notBreed']").change(function() {
		var check=this.checked;
		var $box=$("#petBreed");
		if(check) {
			$box.attr("disabled", true);
		} else {
			$box.attr("disabled", false);
		}
	})
});

$(function() {
	$("body").on("change", "select[name=missWhere1]", function() {
		var city=$(this).val();
		$("input[id=keyword]").val(city);

		$("body").on("change", "select[name=missWhere2]", function() {
			var con=$(this).val();
			$("input[id=keyword]").val(city+con);
		});
	});

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
			      	<input type="text" id="petBreed" name="petBreed" value="${dto.petBreed}">
			      	<input type="checkbox" id="notBreed" name="petBreed" value="모름"> 모름
			  	</td>
			  	<td>* 성별</td>
			  	<td>
			  		<input type="radio" name="petGender" value="암컷"> 암컷
			  		<input type="radio" name="petGender" value="수컷"> 수컷
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 이름</td>
			  	<td style="padding-left: 10px;">
			  		<input type="text" name="petName" value="${dto.petName}">
			  	</td>
			  	<td>* 나이</td>
			  	<td>
			  		<input type="text" id="petAge" name="petAge" value="${dto.petAge}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> 살
			  		<input type="checkbox" id="notAge" name="petAge" value="모름"> 모름
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 특징</td>
			  	<td colspan="3" style="padding-left: 10px;">
			  		<input type="text" style="width: 80%;" maxlength="50" name="petCharacter" value="${dto.petCharacter}">
			  	</td>
			  </tr>
			  
			  <tr align="left">
			  	<td>* 사진</td>
			  	<td colspan="3" style="padding-left: 10px;">		
			  		<input type="file" name="upload">
			  	</td>
			  </tr>
			  
			  <tr align="left">
				  <td>실종지역</td>
			      <td style="padding-left:10px;">
			      	<select id="missWhere1" name="missWhere1" style="width: 100px;">
			      	</select>
			      	<select id="missWhere2" name="missWhere2">
			      	</select>
			      </td>
			      <td>실종날짜</td>
			      <td>
			      	<select name="year" id="YEAR" title="년도" class="select w80"></select>    
					<select name="month" id="MONTH" title="월" class="select w80"></select>
					<select name="day" id="DAY" title="일" class="select w80"></select>
			      </td> 
			  </tr>
			  
			  <tr align="left">
			  	<td>실종장소</td>
			  	<td colspan="3" style="padding: 15px;">
			  		<div style="margin-bottom: 15px;">
			  			<input id="keyword" type="text" style="width: 50%;">
			  			<button type="button" class="mybtn1" onclick="searchPlaces();">검색하기</button>
			  			<span style="font-size: 11px;">* 지도를 클릭하면 위치가 설정됩니다.</span>
			  			<input type="hidden" id="missWhereLat" name="missWhereLat" value="${dto.missWhereLat}">
			  			<input type="hidden" id="missWhereLng" name="missWhereLng" value="${dto.missWhereLng}">
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
			         	<input type="hidden" name="petImg" value="${dto.petImg}">
			         	<input type="hidden" name="missNum" value="${dto.missNum}">
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
var mode="${mode}";
var lat="${dto.missWhereLat}";
var lng="${dto.missWhereLng}";
var mapContainer = document.getElementById('map'),
mapOption = { 
        center: new kakao.maps.LatLng(37.55654090022184, 126.9195835015353), 
        level: 2
};

if(mode=='update') {
	mapContainer = document.getElementById('map'),
	mapOption = { 
	        center: new kakao.maps.LatLng(lat, lng), 
	        level: 2
	};
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
    
    setLatlng(latlng.getLat(), latlng.getLng());    
});

function setLatlng(lat, lng) {
	document.getElementById("missWhereLat").value=lat;
	document.getElementById("missWhereLng").value=lng;
}

function sendOk() {
	var f = document.missForm;

  	var str = f.missSubject.value;
    if(!str) {
    	alert("제목을 입력하세요. ");
        f.missSubject.focus();
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
    
    str=f.petCharacter.value;
    if(!str) {
    	alert("특징을 입력하세요.");
    	f.petCharacter.focus();
    	return false;
    }
    
    var mode="${mode}";
    str=f.upload.value;
    if(mode=='created') {
        if(!str) {
           	alert("사진을 첨부해주세요.");
           	return false;
        }
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

$(function() {
	var area0 = ["전국","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["대덕구","동구","서구","유성구","중구"];
	var area4 = ["광산구","남구","동구","북구","서구"];
	var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["남구","동구","북구","중구","울주군"];
	var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	
	 $("select[name^=missWhere1]").each(function() {
		  $selsido = $(this);
		  $.each(eval(area0), function() {
		   $selsido.append("<option value='"+this+"'>"+this+"</option>");
		  });
		  $selsido.next().append("<option value='전체'>시/구/군</option>");
	 });
	 
	 $("select[name^=missWhere1]").change(function() {
		  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		  var $gugun = $(this).next();
		  $("option",$gugun).remove();

		  if(area == "area0")
		   $gugun.append("<option value=''>시/구/군</option>");
		  else {
		   $.each(eval(area), function() {
		    $gugun.append("<option value='"+this+"'>"+this+"</option>");
		   });
		  }
		 });
});

$(function() {
	var where1="${dto.missWhere1}";
	var where2="${dto.missWhere2}";
	var year="${dto.year}";
	
	if(mode=='update') {
		$("#missWhere1").val(where1);
		$("#missWhere1").trigger("change");
		$("#missWhere2").val(where2);
		$("#missWhere2").trigger("change");
		$("#YEAR").val(year);
	}
});
</script>