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
    <div>
        <div class="left">
            <ul style="width: 100%">
                <li style="background-color: gray; font-size: 25px;">주문상품 정보</li>
                <li>
                    <a href="#"><img style="width: 100%; height: 120px; border: 1px solid teal; margin: 0px;" src="test.png"></a>
                </li>
                <div style="width:500px; height: 20px;">상품명:상품 </div>
                <div style="width:300px; height: 60px;">수량:1개</div>
            </ul>
             
        </div>
        
        <div class="right">
            <ul style="margin-bottom: 200px;">
                <li style="background-color: gray; font-size: 25px;">결제금액</li>
                <li>상품금액:</li>
                <li>할인금액:</li>
                <li>배송비:</li>
               <hr>
                <li>최종결제금액:</li>
                
            </ul>

        </div>
        
    </div>
    
</div>
<div class="left">
<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><i class="fas fa-user"></i> 배송지 </h3>
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
			            <input type="text" name="userName" value="${dto.userName}" maxlength="30" class="boxTF"
		                      style="width: 95%;"
		                      ${mode=="update" ? "readonly='readonly' ":""}
		                      placeholder="이름">
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이메일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select name="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			            <input type="text" name="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select class="selectField" id="tel1" name="tel1" >
			                <option value="">선 택</option>
			                <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
			                <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
			                <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
			                <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
			                <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
			                <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
			            </select>
			            -
			            <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
			            -
			            <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="zip" id="zip" value="${dto.zip}"
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
			            <input type="text" name="addr1" id="addr1"  value="${dto.addr1}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="addr2" id="addr2" value="${dto.addr2}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="나머지 주소">
			        </p>
			      </td>
			  </tr>
			   
			    <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
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
<span>결제수단</span>

</div>
</body> 
</head>
</html>