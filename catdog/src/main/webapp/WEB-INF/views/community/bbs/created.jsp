<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function sendOk() {
	var f = document.boardForm;

  	var str = f.freeSubject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.freeSubject.focus();
            return false;
        }

        str = f.freeContent.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	alert("내용을 입력하세요. ");
     		f.freeContent.focus();
        	return false;
        }
        
        f.action="${pageContext.request.contextPath}/community/board/${mode}";
        f.submit();
}
</script>

<div class="board">
	<div class="created">
		<div>
			<ul class="createdtitle">
				<li>글쓰기</li>
			</ul>
		</div>
		<form name="boardForm" method="post">
			<div>
				<ul class="tr">
					<li>
						<select name="freePet">
							<option value="0">Cat</option>
							<option value="1">Dog</option>
						</select>
					</li>
					<li class="td"><input type="text" name="freeSubject" placeholder="제목을 입력해주세요"></li>
				</ul>
				<ul class="tr">
					<li class="td"><textarea name="freeContent" rows="15" cols="118" placeholder="내용을 입력해주세요"></textarea> </li>
				</ul>
				<ul>
					<li>
						<button type="button" class="mybtn2" onclick="sendOk();">등록하기</button>
						<a href="${pageContext.request.contextPath}/community/board/list"><button type="button" class="mybtn1">돌아가기</button></a>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>
