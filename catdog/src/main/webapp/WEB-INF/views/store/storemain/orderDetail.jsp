<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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


</style>
<title>test</title>

<body>
<br><br>
<h1 style="text-align: center;">주문/결제</h1>
<br><br>
<ul>
   
</ul>
<div>
    <div >
        <div class="left" style="border: 1px solid black;">
            <ul style="width: 80%; height: 200px;">
                <li style="font-size: 25px; text-align: center; font-weight: bold; margin-bottom: 30px;">주문상품 정보</li>
                <li>
                <div>
                   <img style="width: 30%; height: 100px; border: 1px solid black; margin: 0px; float: left;" src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}">
                </div>
                <div style="float: left; font-size: 20px; font-weight: bold; border-bottom: 20px;">상품명:</div>
                <br>
                <div style="font-size: 20px; font-weight: bold; margin-top: 30px;">가격:</div>
                
                </li>
            </ul>
             
        </div>
        
        <div class="right" style="border: 1px solid black; height: 350px;">
            <ul style="margin-bottom: 200px;">
                <li style="font-size: 25px; font-weight: bold; text-align:center; margin-bottom: 30px;" >결제금액</li>
                <li style="font-size: 25px;  font-weight: bold;">상품금액:</li>
                <li style="font-size: 25px;  font-weight: bold;">할인금액:</li>
                <li style="font-size: 25px;  font-weight: bold;">배송비:</li>
               <hr>
                <li style="font-size: 25px; font-weight: bold; margin-top: 30px;">최종결제금액:</li>
                
            </ul>

        </div>
        
    </div>
    
</div>
<div class="left" style="margin-top: 40px;">
<div class="body-container" style="width: 700px;">
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
			            <input type="text" name="userId" value="" maxlength="30" class="boxTF"
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
			            <select class="selectField" id="tel1" name="tel1"  >
			                <option value="">선 택</option>
			                <option value="010">010</option>
			                <option value="011" >011</option>
			                <option value="016" >016</option>
			                <option value="017" >017</option>
			                <option value="018" >018</option>
			                <option value="019" >019</option>
			            </select>
			            -
			            <input type="text" name="tel2" value="" class="boxTF" maxlength="4">
			            -
			            <input type="text" name="tel3" value="" class="boxTF" maxlength="4">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px; float: left;">
			            <input type="text" name="zip" id="zip" value=""
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
			            <input type="text" name="addr1" id="addr1"  value="" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="addr2" id="addr2" value="" maxlength="50" 
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
			            <select class="selectField" >
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
<button style="width: 90%; height: 60px;">구매하기</button>

</div>
</body> 
</head>
</html>