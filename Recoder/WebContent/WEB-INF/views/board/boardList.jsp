<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- jQuery -->
   <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
   
   <link rel="stylesheet" href="${contextPath}/resources/boardList.css">
</head>
<body> 
<!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container my-5">
    <h1 class="title">자유게시판</h1>

        <div class="list-wrapper">
            <table class="table table-hover my-5" id="board-table">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th></th>
                    <th class="board-title">제목</th>
                    <th class="board-title-small">작성자</th>
                    <th class="board-title-small">조회수</th>
                    <th class="board-title-small">작성일</th>
                </tr>
            </thead>

            <!-- 공지사항 목록 -->
            <tbody>
                <tr>
                    <td>글번호 </td>
                    <td>제목 </td>
                    <td>작성자</td>
                    <td>조회수</td>
                    <td>작성일1</td>
                </tr>
            </tbody>
        </table>
    </div>
    
    
    <div class="my-5">
        <ul class="pagination">
            <li><a class="page-link" href="#">&lt;</a></li>
            <li><a class="page-link" href="#">1</a></li>
            <li><a class="page-link" href="#">2</a></li>
            <li><a class="page-link" href="#">3</a></li>
            <li><a class="page-link" href="#">4</a></li>
            <li><a class="page-link" href="#">5</a></li>
            <li><a class="page-link" href="#">&gt;</a></li>
        </ul>
    </div>
    <div class="mb-5">
        <form action="search" method="GET" class="text-center" id="searchForm">
            <select name="searchKey" class="form-control">
                <option value="title">글제목</option>
                <option value="content">내용</option>
                <option value="titcont">제목+내용</option>
            </select>
            <input type="text" name="searchValue" class="form-control">
            <button class="form-control btn btn-secondary" id="searchBtn">검색</button>
        </form>
    </div>

</div>
</body>
</html>