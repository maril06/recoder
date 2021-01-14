<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="img/logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jquery  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

    <!-- bootStrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/header.css">
</head>
<body>
	
	<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath }"/>
	
	<div class="wrapper">
        <nav>
            <div class="logo_area">
                <a href="admin_main.html">
                    <img id="logo_img" src="resources/images/logo.png">
                </a>
            </div>

            <ul class="menu_area ft">

                <li><a href="#">매물관리</a>
                    <ul>
                        <li><a href="">매물 삭제/복구</a></li>
                        <li><a href="">허위 매물 관리</a></li>
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
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"
                    style="background-color:  rgb(174, 160, 236); border: rgb(174, 160, 236);">
                    로그인
                </button>

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
                            <form method="POST" action="#">
                                <div class="modal-body">
                                    <input type="text" id="inputId" placeholder="아이디"><br>
                                    <input type="password" id="inputPw" placeholder="비밀번호"><br>
                                    <button type="button" class="btn btn-primary">로그인</button>
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