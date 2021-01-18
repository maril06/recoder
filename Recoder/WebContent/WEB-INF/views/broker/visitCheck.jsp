<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- reset -->
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    
    <!-- slick.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
    
    <!-- visitCheck.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/visitCheck.css">
    
    
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- slick.js -->
    <script src="${contextPath}/resources/js/slick.min.js"></script>

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/70c929d7d4.js" crossorigin="anonymous"></script>

    
    <title>내 방</title>
</head>
<body>
    <div class="wrapper">
        <!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>

        
        <section class="visit_check">
            <h3>방문자 체크</h3>
            <div class="chk_wrapper">
                <ul>
                
                
                
                    <c:set var="aaa" value="${visit }"></c:set>
                    <c:forEach var="room" items="${room}">
                    
                    <li>
                        <div class="list_top">
                            <p class="check_img">
                                <a href=""><img src="images/pp3.png" alt=""></a>
                            </p>
                            
                            
                            
                            <div class="check_info">
                                <h3>${room.roomTitle} --${aaa}-- ${room.roomNo }</h3>
                                <p class="text">
                                    <span>
                                        ${room.roomInfo }
                                    </span>
                                </p>
                                <a href="#" class="more">View more</a>
                            </div>
                        </div>
                        <div class="list_bottom">
                            <table class="table">
                                <thead>
		                 
		                                    <tr>
		                                      <th scope="col">visit.visitDt</th>
		                                      <th scope="col">Name</th>
		                                      <th scope="col">승낙 여부</th>
		                                    </tr>
		                
                                  </thead>
                                  <tbody>
                                    <c:forEach var="visit" items="${visit}" varStatus="vst">
			                            <c:if test="${visit.roomNo == room.roomNo && visit.visitCd == 1}" var="nameHong" scope="session">
		
                                    <tr>
                                        <td>2021.1.10</td>
                                        <td>김땡이</td>
                                        <td>
                                            <button>승낙</button>
                                            <button>거부</button>
                                        </td>
                                    </tr>
                                        </c:if>
	                                 </c:forEach>
                                  </tbody>
                              </table>
                        </div>

                    </li>
                    
                    
                    </c:forEach>
                    
                    <c:if test="${empty room }">
                    <li>
                       
                       <h1 style="text-align: center; font-size: 50px; margin: 300px 0 800px;">방문신청이 없오요</h1>

                    </li>
                    </c:if>
                </ul>
            </div>

        </section>
        
        <!-- footer -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    
    <!-- index.js -->
    <script src="${contextPath}/resources/js/visitCheck.js"></script>
</body>
</html>