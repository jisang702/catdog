<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.rightbox{
	width: 50%;
	margin-left: 20px;
}
.sub{
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 15px;
}
.click{
	width: 45%;
	height: 60px;
	background: orange; 
	float: left; 
	margin-left: 10px; 
	text-align: center; 
	line-height: 60px;
	margin-top: 30px;
}

.tabmenu{ 
  max-width:80%; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
  
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
</style>
<script type="text/javascript">
function cart(prdNum) {
	var url = "${cartUrl}?page=${page}&prdNum="+prdNum;
	location.href=url;
}
function orderDetail(prdNum) {
	var url = "${orderDetail}?page=${page}&prdNum="+prdNum;
	location.href=url;
}
</script>
<br><br><br>
<div class="firstBox" style="width: 100%; display: flex; justify-content: center;">
	<div class="second" style="width: 80%; display: flex;">
		<div style="width: 50%; height: 50%; border: none;">
			<img style="width: 100%;"
				src="${pageContext.request.contextPath}/uploads/store/${dto.imgFilename}">
		</div>
		<div class="rightbox" style="height: 70%;">
			<ul>
				<li class="sub">${dto.prdName }</li>
				<li class="sub">리뷰: 별표로</li>
				<li class="sub" style="text-align: right;">${dto.prdPrice}원</li>
				<li class="sub">배송비 2500원 (30000원이상 무료배송)</li>
				<li><select style="width: 80%">
						<option>사이즈선택</option>
						<option>블루</option>
						<option>블랙</option>
				</select>
				<li class="sub" style="text-align: right; margin-top: 30px;">총 상품 가격:${dto.prdPrice	}원
				<li>
			</ul>
			<div class="click" onclick="javascript:cart('${dto.prdNum}');">장바구니</div>
			<div class="click" onclick="javascript:orderDetail('${dto.prdNum}');">구매하기</div>	
		</div>
	</div>
</div>
<br><br>
<div class="tabmenu">
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">상품설명</label>
      <div class="tabCon" >상품내용 칸</div>
      
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">상품문의</label>
      <div class="tabCon" >상품문의칸</div>
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">상품후기</label>
      <div class="tabCon" >상품후기칸</div>
    </li>
  </ul>
</div>
