<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="${contextPath}/resources/images/logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jquery  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- bootStrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/boardList.css">
	<title>공지사항 게시판</title>
</head>
<body>
	
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="section">

        <div class="top-section">
            <h6>게시판 관리</h6>
            <h2>게시글/댓글 삭제</h2>
        </div>



        <div class="search-area">

            <form action="" method="GET" class="search-form" id="searchForm">

                <select name="sk" class="form-control" style="width: 140px; display: inline-block;">
                    <option value="totalRoom">전체 게시물</option>
                    <option value="enrollRoom">등록 게시글</option>
                    <option value="deleteRoom">삭제 게시글</option>
                </select>

                <input type="text" name="sv" class="form-control" style="width: 170px; display: inline-block;"
                    placeholder="게시글 번호로 검색">
                <button class="form-control btn btn-primary search-btn"
                    style="width: 60px; display: inline-block;">검색</button>
            </form>


        </div>




        <div class="content-area">
            <form action="#" method="post" class="recover-delete-form">
                <table class="table table-striped table-hover" id="list-table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="ck" onclick='selectAll(this)'>
                            </th>
                            <th>게시글 번호</th>
                            <th>게시글 제목</th>
                            <th>작성자</th>
                        </tr>
                    </thead>

                    <tbody>
                        <!-- 게시글 목록 -->
                        <tr>
                            <td>
                                <input type="checkbox" name="ck" class="selectReply">
                            </td>
                            <td> 1 </td>
                            <td> 집 사는건 포기 해야겠죠? </td>

                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="ck" class="selectReply">
                            </td>
                            <td> 1 </td>
                            <td> 집 사는건 포기 해야겠죠? </td>

                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="ck" class="selectReply">
                            </td>
                            <td> 1 </td>
                            <td> 집 사는건 포기 해야겠죠? </td>

                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="ck" class="selectReply">
                            </td>
                            <td> 1 </td>
                            <td> 집 사는건 포기 해야겠죠? </td>

                        </tr>

                    </tbody>

                </table>
                <br><br>
                <div class="button-area">

                    <button class="btn btn-primary float-right delete-btn" id="deleteBtn">삭제</button>
                    <button class="btn btn-primary float-right recover-btn" id="recoverBtn">복구</button>

                </div>


            </form>
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


    </div>


 
    <script>
        function selectAll(selectAll) {
            const selectReply = document.getElementsByName('ck');
            selectReply.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }

    </script>

</body>
</html>