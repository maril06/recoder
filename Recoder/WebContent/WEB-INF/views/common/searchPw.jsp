<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>   
 
 <!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>비밀번호 찾기</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/searchId.css">
   <!-- jQuery -->
   <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
</head>
<body>
    <div class="container">
       <div class="c1">
        
          <div id="left" class="left_hover"><h3 class="s1class" ><span>비밀번호</span><span class="su">찾기</span>
          </h3></div>
          <div id="right"><a id="searchIdForm" href="${contextPath}/common/searchIdForm.do"><h3 class="s2class"><span>아이디</span><span class="su">찾기</span></h3></a></div>
       </div>
       <div class="c2">
        <form class="searchPw" method="post" action="${contextPath}/common/searchPw.do"  onsubmit="return PwValidate();">
                <h1 class="search1">비밀번호 찾기</h1>
                <div class="txt">
                   <h3>
                      본인확인 이메일로 인증 <br>
                     </h3>
                      가입하신 이메일로 <br>
                  인증번호를 받을 수 있습니다. <br>
                  </div>
                  <input name="username" type="text" placeholder="닉네임" class="userInfo"/> <br>
                  <input name="userid" type="text" placeholder="아이디" class="userInfo">
                  <input name="email" type="email" placeholder="이메일 주소" class="userInfo emailAdr" />
                  <button class="btn small">인증번호 받기</button>
                  <input name="code" type="text" placeholder="인증번호 6자리 숫자입력"  class="userInfo" >
                  <button class="btn" id="nextPw" type="submit">확인</button>
               </form>

      </div>
      <div class="footer"></div>
   </div>
   
    <script>
      $(document).ready(function(){
      $(".container").fadeIn(1000);
});
   </script>
</body>
</html>