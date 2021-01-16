<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="${contextPath}/resources/images/logo.png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/member_manage.css">

<title>회원 정지/복구</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>



	<div class="section">

		<div class="top-section">

			<h2>회원 관리</h2>
		</div>

		<div class="search-area">

			<form action="" method="GET" class="search-form" id="searchForm">

				<select name="sk" class="form-control"
					style="width: 140px; display: inline-block;">
					<option value="gMem">일반회원</option>
					<option value="bMem">중개사 회원</option>
				</select> <select name="sk" class="form-control"
					style="width: 80px; display: inline-block;">
					<option value="stop">정지</option>
					<option value="active">활동</option>
				</select> <input type="text" name="sv" class="form-control"
					style="width: 150px; display: inline-block;"
					placeholder="회원 번호로 검색">
				<button class="form-control btn btn-primary search-btn"
					style="width: 60px; display: inline-block;">검색</button>
			</form>


		</div>



		<div class="content-area">
			<form action="#" method="post" class="recover-delete-form">
				<table class="table table-striped table-hover " id="membertable">
					<thead>
						<tr>
							<th><input type="checkbox" name="ck"
								onclick='selectAll(this)'></th>
							<th>회원 번호</th>
							<th>구분</th>
							<th>아이디 | 닉네임</th>
						</tr>
					</thead>

					<tbody>
						<!-- 게시글 목록 -->
						<tr>
							<td><input type="checkbox" name="ck" class="selectReply">
							</td>
							<td>1</td>
							<td>공인중개사</td>
							<td>maril06 | 한경부동산</td>

						</tr>
						<tr>
							<td><input type="checkbox" name="ck" class="selectReply">
							</td>
							<td>2</td>
							<td>일반회원</td>
							<td>nnnn | 내집은어디에</td>

						</tr>
						<tr>
							<td><input type="checkbox" name="ck" class="selectReply">
							</td>
							<td>3</td>
							<td>일반회원</td>
							<td>gogimuckja | 방방곡곡</td>

						</tr>
						<tr>
							<td><input type="checkbox" name="ck" class="selectReply">
							</td>
							<td>4</td>
							<td>공인중개사</td>
							<td>dksldisl | 방이필요해</td>

						</tr>

					</tbody>

				</table>
				<br>
				<br>
				<div class="button-area">
					<button class="btn btn-primary float-right stop-btn" id="stopbtn">정지</button>
					<button class="btn btn-primary float-right recover-btn"
						id="recoverbtn">복구</button>
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