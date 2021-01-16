<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 방</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
</head>
<body>

		<%--
			프로젝트의 시작주소 (context root)를 얻어와 간단하게 사용할 수 있도록 
			별도의 변수를 생성 
	 	--%>
		
        <!-- header -->
        <header>
            <div class="menu_wrapper">
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/homepage/logo.png" alt="로고"></a>
                </div>
                <div class="menu_left clearfix">
                    <ul class="menu_left_title clearfix ft">
                        <li><a href="#"><span><b>방찾기</b></span></a></li>
                        <li><a href="${contextPath}/room/roomInsertForm.do"><span><b>방 내놓기</b></span></a></li>
                        <li><a href="#"><span><b>찜한 방</b></span></a></li>
                         <li><a href="#"><span><b>공지사항</b></span></a></li>
                        <li><a href="#"><span><b>게시판</b></span></a></li>
                         <li><a href="${contextPath}/message/message.do"><span><b>쪽지함</b></span></a></li>
                        
                    </ul>
                </div>
                  
               <%--헤더 오른쪽 영역 --%>
                 <div class="loginInfoArea">
              <c:choose>
            <c:when test="${ empty sessionScope.loginMember}">      
                    <ul>
                        <li><a href="${contextPath}/common/signUp.do">회원가입</a></li>
                        <li><a href="${contextPath}/common/loginForm.do">로그인</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                <div class="loginInfo">
                  <span id="nickName">${loginMember.memNick}님</span>
                     <a href="${contextPath}/member/myPage.do" id="myPage">마이페이지</a>
                     <a href="${contextPath}/member/logout.do" id="logout">Logout</a>
                 </div>
                </div>
                </div>
                   
                </c:otherwise>
              </c:choose> 
            </div>
        </header>