<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainht.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	var menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");
	listPage(1);
	
	$("ul.tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		reloadBoard();
	});
});

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxJSON(url, method, query, fn){
	$.ajax({
		type:method,
		url:url,
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

//글 리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/customer/"+tab+"/list";
	var query="page="+page;
	//var search=$('form[name=customerSearchForm]').serialize();
	//query=query+"&"+search;
	var selector = "#tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

//새로고침
function reloadBoard(){
	var f =document.customerSearchForm;
	f.condition.value="all";
	f.keyword.value="";
	
	listPage(1);
}

//글쓰기폼
function insertForm(){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/customer/"+tab+"/created";
	var query="tmp="+new Date().getTime();
	var selector="#tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

//글 등록, 수정 등록, 답변 등록 - qna
function sendOk(mode, page){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	
	var f=document.boardForm;
	
	var str=f.qnaSubject.value;
	if(! str){
		alert("제목을 입력하세요.");
		f.qnaSubject.focus();
		return;
	}
	
	str=f.qnaContent.value;
	if(! str){
		alert("내용을 입력하세요.");
		f.qnaContent.focus();
		return;
	}
	
	var url="${pageContext.request.contextPath}/customer/"+tab+"/"+mode;
	var query=new FormData(f);
	
	var fn = function(data){
		var state=data.state;
		console.log(state);
		
		if(state=="false"){
			alert("게시물을 추가(수정)하지 못했습니다.");
		}
		
		if(page==undefined || page==""){
			page="1";
		}
		
		if(mode=="created" || mode=="answer"){
			reloadBoard();
		}else{
			listPage(page);
		}
	};
	
	ajaxFileJSON(url, "post", query, fn);
}

//글쓰기 취소, 수정 취소, 답변 취소
function sendCancel(page){
	if(page==undefined || page==""){
		page="1";
	}
	
	listPage(page);
}

//게시글 보기
function articleBoard(num, page){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/customer/"+tab+"/article";
	var query;
	if(tab=="notice")
		query="noNum="+num;
	else if(tab=="qna")
		query="qnaNum="+num;
	else 
		query="num="+num;
	//var search=$("form[name=customerSearchForm]").serialize();
	query=query+"&page="+page;	//+"&"+search;
	var selector="#tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

//글 수정 폼
function updateForm(num, page){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	var url="${pageContext.request.contextPath}/customer/"+tab+"/update";
	
	var query;
	if(tab=="notice")
		query="noNum="+num;
	else if(tab=="qna")
		query="qnaNum="+num;
	else 
		query="num="+num;
	query=query+"&page="+page;
	
	var selector="#tab-content";
	
	ajaxHTML(url, "get", query, selector);
	
}

//글 삭제
function deleteBoard(num, page, mode){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	var url="${pageContext.request.contextPath}/customer/"+tab+"/delete";
	
	var query;
	
	if(tab=="notice")
		query="noNum="+num;
	else if(tab=="qna")
		query="qnaNum="+num+"&mode="+mode;
	else 
		query="num="+num;
	query=query+"&page="+page;
	
	if(! confirm("게시글을 삭제하시겠습니까?"))
		return;
	
	var fn=function(data){
		console.log(data.state);
		listPage(page);
	}
	
	ajaxJSON(url, "post", query, fn);
}

//글 답변 폼
function replyForm(num, page){
	var $tab=$(".tabs .active");
	var tab=$tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/customer/"+tab+"/answer";
	var query="qnaNum="+num+"&page="+page;
	var selector="#tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

</script>


<div class="body-container">     
	<div class="faqLayout">
		<div style="clear: both;">
	           <ul class="tabs">
			       <li id="tab-notice" data-tab="notice">공지사항</li>
			       <li id="tab-qna" data-tab="qna">QnA</li>
			       <li id="tab-faq" data-tab="faq">자주하는질문</li>
			   </ul>
		   </div>
		   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
	</div>
</div>

<form name="customerSearchForm" action="" method="post">
    <input type="hidden" name="condition" value="all">
    <input type="hidden" name="keyword" value="">
</form>