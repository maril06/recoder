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
          <div id="right" ><a id="searchIdForm" href="${contextPath}/common/searchIdForm.do"><h3 class="s2class"><span>아이디</span><span class="su">찾기</span></h3></a></div>
       </div>
       <div class="c2">
        <form class="pwSet" method="post" action="${contextPath}/common/setPw.do"  onsubmit="return PwResetValidate();">
            <h1 class="search2">비밀번호 재설정</h1>
            <br>
            <div class="txt">
               <h3>
                  비밀번호를 변경해주세요
               </h3>
               <div class="infoArea">
                  <span>${memId} 회원님</span> <br>
                  <input name="password1" type="password" placeholder="새 비밀번호" class="userInfo"> <br>
                  <input name="password2" type="password" placeholder="새 비밀번호 확인" class="userInfo">
               </div>
               <button class="btn" type="submit">확인</button>
            </div>
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