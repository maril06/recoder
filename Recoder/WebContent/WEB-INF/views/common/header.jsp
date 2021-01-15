<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 -->
<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- header.css -->
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">

    <nav class="head navbar fixed-top navbar-expand-lg navbar-light ">
        <div class="container-fluid">
            <div class="logo">
                <a href="#"><img src="${contextPath}/resources/images/homepage/logo.png" alt="로고" id="logo"></a>
            </div>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-5">
              <li class="nav-item mx-3">
                <a class="nav-link" href="#">방찾기</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${contextPath}/room/roomInsertForm.do">방내놓기</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="#">찜한방</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="#">공지사항</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="#">자유게시판</a>
              </li>
              <li class="nav-item mx-3">
                <a class="nav-link" href="${contextPath}/message/message.do">쪽지함</a>
              </li>
            </ul>
        </div>
           	<c:choose>
				<c:when test="${empty loginMember }">            
		            <ul class="navbar-nav me-auto mb-2 mb-lg-0"> 
		                <li class="nav-item">
		                    <a class="nav-link" href="${contextPath}/member/loginForm.do">로그인</a>
		                </li>
		                
		                <li class="nav-item">
		                    <a class="nav-link" href="#modal-container-1">회원가입</a>
		                </li>
		            </ul>
                </c:when>
	                
                <c:otherwise>
	           <div class="loginInfoArea">
                <div class="loginInfo">
                  <span id="nickName">${loginMember.memNick}님</span>
	                  <a href="${contextPath}/member/myPage.do" id="myPage">마이페이지</a>
	                  <a href="${contextPath}/member/logout.do" id="logout">Logout</a>
                 </div>
          		</div>
	                
                </c:otherwise>
           	</c:choose>
        </div>
      </nav>
      

