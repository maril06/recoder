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
	<link rel="stylesheet" href="${contextPath}/resources/css/brokerList.css">
	<title>공지사항 게시판</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="section-area">

        <div class="top-section">

            <h2>중개사 회원 승인</h2>
        </div>


        <table class="table table-striped table-hover" id="list-table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" name="ck" id="selectAll" onclick='selectAll(this)'>
                    </th>
                    <th>회원번호</th>
                    <th>자격증 이미지</th>
                    <th>사무실 주소</th>
                    <th>공인중개사</th>

                </tr>
            </thead>

            <tbody>

                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="selectAll" class="">
                    </td>
                    <td> 3 </td>
                    <td> <img class="certi" src="img/certification.png"> </td>
                    <td> 서울시 도봉구</td>
                    <td> 마카롱공인중개사</td>


                </tr>

                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="selectAll" class="">
                    </td>
                    <td> 3 </td>
                    <td> <img class="certi" src="img/certification.png"> </td>
                    <td> 서울시 도봉구</td>
                    <td> 도봉공인중개</td>


                </tr>

                <tr>
                    <td>
                        <input type="checkbox" name="ck" id="selectAll" class="">
                    </td>
                    <td> 3 </td>
                    <td> <img class="certi" src="img/certification.png"> </td>
                    <td> 서울시 도봉구</td>
                    <td> 한경닷컴부동산</td>
                </tr>


            </tbody>

        </table>

        <div class="button-area">
            <button class="btn btn-primary btn-sm ml-1 approve-btn" onclick="">승인</button>
            <button class="btn btn-primary btn-sm ml-1 cancel-btn" onclick="">취소</button>
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