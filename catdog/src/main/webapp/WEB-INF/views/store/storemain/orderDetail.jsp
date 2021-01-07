<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <style>

 
div.left {
    width: 45%;
    float: left;
    box-sizing: border-box;
    margin-left: 60px;
    
}
div.right {
    width: 35%;
    float: right;
    box-sizing: border-box;
    margin-right: 100px;
}
ul{
   list-style:none;
   padding: 0;

   }
   hr {
    border: none;
    border-top: 3px dotted gray;
    color: #fff;
    background-color: #fff;
    height: 1px;
    width: 100%;
}
.blinking{
   -webkit-animation:blink 1.5s ease-in-out infinite alternate;
    -moz-animation:blink 1.5s ease-in-out infinite alternate;
    animation:blink 1.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}

</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
    
    function changeEmail() {
        var f = document.memberForm;
    	    
        var str = f.selectEmail.value;
        if(str!="direct") {
            f.email2.value=str; 
            f.email2.readOnly = true;
            f.email1.focus(); 
        }
        else {
            f.email2.value="";
            f.email2.readOnly = false;
            f.email1.focus();
        }
    }
    function buy() {
		var f=document.memberForm;
		
		f.action="${pageContext.request.contextPath}/store/${gubun}/insertOrder"
		f.submit;
		alert("구매완료!");
	}
</script>

<br><br>
<h1 style="text-align: center;">주문/결제</h1>
<br><br>
<ul>
   
</ul>
<div>
    <div >
        <div class="left" style="height: 200px; padding-left: 150px;">
            <ul style="width: 80%;">
                <li style="font-size: 25px; text-align: center; font-weight: bold; margin-bottom: 30px;">주문상품 정보</li>
                <li>
                <div>
                   <img style="width: 50%; height:60%; margin: 0px; float: left;" src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}">
                </div>
                <div style="float: right; font-size: 20px; font-weight: bold; border-bottom: 20px;">상품명:${dto.prdName }</div>
                <br><br>
                <span style="font-size: 20px; font-weight: bold; ">가격:${dto.prdPrice}원</span>
                
                </li>
            </ul>
             
        </div>
         
        <div class="right" style="padding-right: 120px; height: 350px;">
            <ul style="margin-bottom: 200px;">
                <li style="font-size: 25px; font-weight: bold; text-align:center; margin-bottom: 30px; " >결제금액</li>
                <li class="sub" style="font-size: 25px; text-align:right; font-weight: bold; text-decoration:line-through; opacity:0.5;">상품금액:${dto.prdPrice}원</li>
                <li style="font-size: 25px;  font-weight: bold; color: red;" class="blinking" >할인:${dto.prdDisCount}%</li>
                <br>
               	<hr>
                <li style="font-size: 25px; font-weight: bold; margin-top: 30px; float: right;">최종결제금액:${dto.price}원</li>
                
            </ul>

        </div>
        
    </div>
    
</div>
<div class="left" style="margin-top: 159px;">
<div class="body-container" style="width: 700px; margin: 100px">
    <div class="body-title">
        <h3  style="text-align: left; margin-left: 50px;"><i class="fas fa-user"></i> 배송지 </h3>
    </div>
    
        <div>
			<form name="memberForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			 <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이름</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="loName" value="" maxlength="30" class="boxTF"
		                      style="width: 30%; float: left;"  placeholder="이름">
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이메일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px; float: left;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select name="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" >네이버 메일</option>
			                <option value="hanmail.net" >한 메일</option>
			                <option value="hotmail.com" >핫 메일</option>
			                <option value="gmail.com" >지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			            <input type="text" name="email1" value="" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" value="" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px; float: left;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select class="selectField" id="tel1" name="loTel1"  >
			                <option value="">선 택</option>
			                <option value="010">010</option>
			                <option value="011" >011</option>
			                <option value="016" >016</option>
			                <option value="017" >017</option>
			                <option value="018" >018</option>
			                <option value="019" >019</option>
			            </select>
			            -
			            <input type="text" name="loTel2" value="" class="boxTF" maxlength="4">
			            -
			            <input type="text" name="loTel3" value="" class="boxTF" maxlength="4">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px; float: left;">
			            <input type="text" name="loZip" id="zip" value=""
			                       class="boxTF" readonly="readonly">
			            <button type="button" class="btn" onclick="daumPostcode();">우편번호</button>          
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">주소</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="loAddr1" id="addr1"  value="" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="loAddr2" id="addr2" value="" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="나머지 주소">
			        </p>
			      </td>
			  </tr>
			   
			    <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">배송메시지</label>
			      </td>
			      <td style="padding: 0 0 15px 15px; float: left;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select class="selectField" name="loMsg">
			                <option>배송메시지 입력</option>
			                <option>부재시 경비실에 맡겨 주세요</option>
			                <option>부재시 전화주시거나 문자 남겨 주세요</option>
			                <option>배송전에 미리 연락 주세요</option>
			            </select>
			           
			        </p>
			      </td>
			  </tr>
			  </table>
			</form>
        </div>
        
</div>
</div>

<div class="right" style="margin-top: 100px;">
<button style="width: 90%; height: 100px; background:#ffeebb; font-weight: bold; font-size: 20px;"onclick="buy();">구매하기</button>

</div>
