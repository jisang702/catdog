<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="body-container" style="width: 700px; margin-top: 50px;">
   <div class="body-title">
       <h3><i class="fas fa-camera-retro"></i> Photo Gallery 
       <i class="far fa-kiss-wink-heart"></i> </h3>
   </div>
   
   <div>
		<form name="photoForm" method="post" enctype="multipart/form-data">
		  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="left" height="40" style="border-top: 1px solid #71da65; border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		      <td style="padding-left:10px;"> 
		        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="">
		      </td>
		  </tr>
		
		  <tr align="left" height="40" style="border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center;">작성자</td>
		      <td style="padding-left:10px;"> 
		          댕냥이
		      </td>
		  </tr>
		
		  <tr align="left" style="border-bottom: 1px solid #71da65;"> 
		      <td width="100" bgcolor="#71da65" style="text-align: center; padding-top:5px;" valign="top">설&nbsp;&nbsp;&nbsp;&nbsp;명</td>
		      <td valign="top" style="padding:5px 0px 5px 10px;"> 
		        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">내용</textarea>
		      </td>
		  </tr>
		  
		  <tr align="left" height="40" style="border-bottom: 1px solid #71da65;">
		      <td width="100" bgcolor="#71da65" style="text-align: center;">
		      		<i class="fas fa-paw"></i>photo!</td>
		      <td style="padding-left:10px;"> 
		          <input type="file" name="upload" class="boxTF" size="53"
		                     accept="image/*" 
		                     style="height: 25px;">
		       </td>
		  </tr>
		  

		  </table>
		
		  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;s">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="">등록하기</button>
		        <button type="reset" class="btn">다시입력</button>
		        <button type="button" class="btn" onclick="">돌아가기</button>
		        
		         	 <input type="hidden" name="num" value="">
		         	 <input type="hidden" name="imageFilename" value="">
		        	 <input type="hidden" name="page" value="">
		        
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>