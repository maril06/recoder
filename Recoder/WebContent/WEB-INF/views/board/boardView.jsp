<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 게시판 상세조회</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- jQuery -->
   <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="${contextPath}/resources/boardInsert.css">
   
</head>
<body>

 <!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container  my-5">

		<div>
            <h1 id="board-main">공지사항</h1>
            <!-- 게시판구역 -->
            <div class="wrapper">

                <div id="board-area">
                    
                <table class="table">
                    <thead>
                      <tr id="table-name-large">
                        <th scope="col">제목</th>
                        <th><strong class="notice_block">공지</strong></th>
                        <th scope="col" colspan="5">제목부분</th>
                    </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">작성자</th>
                        <td colspan="5">이름</td>
                      </tr>
                      <tr>
                          <th scope="row">작성일</th>
                          <td id="date">2020.01.06</td>
                          <th>조회수</th>
                          <td colspan="2">10</td>
                        </tr>
                        <tr>
                            <td colspan="6">
                              <div id="board-content">게시글 
                                   dddd <br>
                                  dddddddddddddddddddddddddddddddd <br>
                                  ddddddddddddd
                              </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 버튼구역 -->
                <div>
                    <button id="deleteBtn" class="btn btn-outline-secondary float-right">삭제</button> 
                    <a href="#" class="btn btn-outline-secondary float-right ml-1 mr-1">수정</a>
                    <a href="${goToList}" class="btn btn-secondary float-right" >목록으로</a>
                </div>
                <br> <br>
                <hr>
                <!-- 댓글 구역 -->
                <div id="comment-area">
                    <!-- 댓글 조회 -->
                    <h5 class="comment-title">댓글</h5> <br>
                    <ul class="comment-list">
                        <li id="댓글번호 얻어오기" class="CommentItem">
                            <div class="comment_box">
                                <div class="comment_id_box">아이디</div>
                                <div class="comment_text_box">댓글내용</div>
                                <div class="comment_info_box">
                                    <span class="comment_info_date">2020.01.18 15:05</span> &nbsp;
                                    <!--  <a href="#" role="button" class="comment_info_button">
                                        답글쓰기
                                    </a>  -->
                                    <a href="#" role="button" class="comment_info_button">
                                        수정
                                    </a>
                                    <a href="#" role="button" class="comment_info_button">
                                        삭제
                                    </a>
                                </div>
                            </div>
                        </li>
                        
                        <li id="댓글번호 얻어오기" class="CommentItem">
                            <div class="comment_box">
                                <div class="comment_id_box">아이디</div>
                                <div class="comment_text_box">댓글내용</div>
                                <div class="comment_info_box">
                                    <span class="comment_info_date">2020.01.18 15:05</span> &nbsp;
                                    <!--  <a href="#" role="button" class="comment_info_button">
                                        답글쓰기
                                    </a>  -->
                                    <a href="#" role="button" class="comment_info_button">
                                        수정
                                    </a>
                                    <a href="#" role="button" class="comment_info_button">
                                        삭제
                                    </a>
                                </div>
                            </div>
                        </li>
                    </ul>

                    
                    
                    
                    

                    
                    
                    <!-- 댓글 쓰기 jsp 삽입-->
                   
                </div>
                
            </div>
                
                
            </div>

		</div>
	</div>
</body>
</html>