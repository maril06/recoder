<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 방</title>
  
</head>
<body>

		<%--
			프로젝트의 시작주소 (context root)를 얻어와 간단하게 사용할 수 있도록 
			별도의 변수를 생성 
	 	--%>
		
        <!-- header -->
        <header>
            <div class="menu_wrapper clearfix">
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/images/logo.png" alt="로고"></a>
                </div>
                <div class="menu_left clearfix">
                    <ul class="menu_left_title clearfix ft">
                        <li><a href="#"><span><b>방찾기</b></span></a></li>
                        <li><a href="${contextPath}/room/roomUpdate.do"><span><b>방 내놓기</b></span></a></li>
                        <li><a href="#"><span><b>찜 방</b></span></a></li>
                        <li><a href="#"><span><b>게시판</b></span></a></li>
                    </ul>
                </div>
                <div class="menu_right">
                    <ul class="menu_right_title clearfix ft">
                        <li><a href=""><span>SignUp</span></a></li>
                        <li><a href=""><span>Login</span></a></li>
                    </ul>
                </div>
            </div>
        </header>