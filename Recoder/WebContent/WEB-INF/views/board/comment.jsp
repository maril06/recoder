<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글</title>
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="${contextPath}/resources/css/comment.css">
   
</head>



<div id="comment-area ">
	<!-- 댓글 작성 부분 -->
	<div class="commentWrite">
		<table align="center">
			<tr>
				<td id="commentContentArea">
					<textArea rows="3" id="commentContent"></textArea>
				</td>
				<td id="commentBtnArea">
					<button class="btn btn-primary" id="addComment">
						댓글<br>등록
					</button>
				</td>
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="commentList mt-5 pt-2">
		<ul id="commentListArea">
			
			<!-- 로그인 x 또는 댓글 작성자가 아닌 회원의 화면 -->
			<li class="comment-row">
				<div>
					<p class="cWriter">작성자</p>
					<p class="cDate">작성일 : 2021.01.11 10:30</p>
				</div>
				
				<p class="cContent">댓글 내용1</p>
			</li>

			
			<!-- 로그인한 회원이 댓글 작성자인 경우 -->
			<li class="comment-row">
				<div>
					<p class="cWriter">작성자</p>
					<p class="cDate">작성일 : 2021.01.11 10:30</p>
				</div>

				<p class="cContent">댓글 내용2</p>
				
				<div class="commentBtnArea">
					<button class="btn btn-primary btn-sm ml-1" id="updateComment" onclick="showUpdateComment(2, this)">수정</button>
					<button class="btn btn-primary btn-sm ml-1" id="deleteComment" onclick="deleteComment(2)">삭제</button>
				</div>
			</li>
	
		</ul>
	</div>


</div>

    <script type="text/javascript" src="${contextPath}/resources/js/comment.js"></script>
    

</body>
</html>