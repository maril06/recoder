<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="${contextPath}/resources/comment.css">
   
</head>


<body>
<!-- 댓글 구역 -->
<div id="replyArea">
    <!-- 댓글 조회 -->
    <h5 class="replyTitle">댓글</h5> <br>
    <ul class="replyList">
        <li id="댓글번호 얻어오기" class="replyItem">
            <div class="replyBox">
                <div class="replyIdBox">아이디</div>
                <div class="replyTextBox">댓글내용</div>
                <div class="replyInfoBox">
                    <span class="replyInfoDate">2020.01.18 15:05</span> &nbsp;
                    <!--  <a href="#" role="button" class="replyinfo_button">
                        답글쓰기
                    </a>  -->
                    <a href="#" role="button" class="replyInfoButton">
                        수정
                    </a>
                    <a href="#" role="button" class="replyInfoButton">
                        삭제
                    </a>
                </div>
            </div>
        </li>
        <br>
        <!-- 댓글수정 -->
        <li id="댓글번호 얻어오기" class="replyItem">
            <div class="replyBox">
                <div class="replyIdBox">아이디</div>
                <div id="replyUpdateContentArea">
                    <textarea class="replyUpdateContent" rows="3" placeholder="댓글내용 수정 테스트"></textarea>
                    <button class="btn btn-primary" id="replyUpdateBtn">수정</button>
                </div>
                    <div class="replyInfoBox">
                        <span class="replyInfoDate">2020.01.18 15:05</span> &nbsp;
                    <!--  <a href="#" role="button" class="replyinfo_button">
                        답글쓰기
                    </a>  -->
                    
                </div>
            </div>
        </li>
    </ul>
    
    
    
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr >
				<td id="replyContentArea">
					<textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn btn-primary" id="addReply">
						댓글등록
					</button>
				</td>
			</tr>
		</table>
	</div>


	
</div>
    
    

<script>



</script>
</body>
</html>