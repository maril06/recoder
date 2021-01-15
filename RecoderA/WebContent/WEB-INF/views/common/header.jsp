<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<style>
   		.modal-backdrop{
   		z-index : 0; important!}
   		
   		.idshow{
   		display:inline-block;
   		width:60px;
   		font-weight:bold;}
   	</style>

</head>
<body>
	
	<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath }"/>
	
	
	<c:if test="${!empty sessionScope.swalTitle }">
			<script>
				swal({icon:"${swalIcon}",title:"${swalTitle}", text:"${swalText}"});
			</script>
			
			<c:remove var="swalIcon"/>
			<c:remove var="swalTitle"/>
			<c:remove var="swalText"/>
		</c:if>	
	
	<div class="wrapper">
        <nav>
            <div class="logo_area">
                <a href="${contextPath}">
                    <img id="logo_img" src="${contextPath}/resources/images/logo.png">
                </a>
            </div>

            <ul class="menu_area ft">

                <li><a href="#">매물관리</a>
                    <ul>
                        <li><a href="${contextPath}/room/roomStatus.do">매물 삭제/복구</a></li>
                        <li><a href="${contextPath}/room }">허위 매물 관리</a></li>
                    </ul>
                </li>
                <li><a href="#">게시판 관리</a>
                    <ul>
                        <li><a href="">공지글 관리</a></li>
                        <li><a href="">게시글 삭제/복구</a></li>
                    </ul>
                </li>
                <li><a href="#">회원관리</a>
                    <ul>
                        <li><a href="">회원 정지/복구</a></li>
                        <li><a href="">회원 승인</a></li>
                    </ul>
                </li>
            </ul>

            <div class="login_area ft">
                <!-- Button trigger modal -->
                
                 <c:choose>
                    <c:when test="${empty sessionScope.loginAdmin}">
                    	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"
                    		style="background-color:  rgb(174, 160, 236); border: rgb(174, 160, 236);">
                    			로그인
                		</button>
                    </c:when>
                    <c:otherwise>
                    	<span class="idshow">${loginAdmin.adminId}</span>
                   		<a href="${contextPath}/admin/logout.do">로그아웃</a>
                    </c:otherwise>
                 </c:choose>
                
                
                

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">관리자 로그인</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form method="POST" action="${contextPath}/admin/login.do">
                                <div class="modal-body">
                                    <input type="text" id="adminId" name="adminId" placeholder="아이디"><br>
                                    <input type="password" id="adminPw" name="adminPw" placeholder="비밀번호"><br>
                                    <button type="submit" class="btn btn-primary">로그인</button>
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
	
</body>
</html>