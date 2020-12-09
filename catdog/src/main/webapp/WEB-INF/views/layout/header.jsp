<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="header-top">
    <div class="header-left">
        <p style="margin: 2px;">
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
                <span style="width: 200px; height: 70; position: relative; left: 0; top:20px; color: #2984ff; filter: mask(color=red) shadow(direction=135) chroma(color=red);font-style: italic; font-family: arial black; font-size: 30px; font-weight: bold;">SPRING</span>
            </a>
        </p>
    </div>
    <div class="header-right">
        <div style="padding-top: 20px;  float: right;">
            <c:if test="${empty sessionScope.member}">
                <a href="${pageContext.request.contextPath}/">로그인</a>
                    &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/">회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue;">${sessionScope.member.userName}</span>님
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/">로그아웃</a>
                <c:if test="${sessionScope.member.userId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="${pageContext.request.contextPath}/admin">관리자</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

<div class="menu">
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/company/info">회사소개</a></li>
        <li><a href="${pageContext.request.contextPath}/guest/guest">커뮤니티</a></li>
        <li><a href="#">스터디룸</a></li>
        <c:if test="${not empty sessionScope.member}">
            <li><a href="${pageContext.request.contextPath}/mypage/info">마이페이지</a></li>
        </c:if>
        <li><a href="${pageContext.request.contextPath}/faq/faq">고객센터</a></li>
        <li style="float: right;"><a href="#"><span style="font-size: 17px; font-weight: 700;">▦</span></a></li>
    </ul>      
</div>
