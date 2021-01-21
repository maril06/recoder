<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container  my-5">
        <h1 id="board-main">게시글 쓰기</h1>
            <div id="board-area">
                <form action="${contextPath}/board/insertBoardSummer.do"  method="post" onsubmit="return boardValidate();">
                <div class="mb-2">
                    <hr>
                </div>
                <div class="form-inline mb-2">
					<label class="mr-3 insert-label">제목</label> 
					<input type="text" class="form-control" id="boardTitle" name="boardTitle" size="70">
				</div>

				<div class="form-inline mb-2">
                    <div class="boardInfo-area">
                        <label class="mr-3 insert-label">작성자</label>
                        <h5 class="my-0" id="writer">${loginMember.memNick}</h5>
                    </div>
                    <div class="boardInfo-area">
                        <label class="mr-3 insert-label">작성일</label>
                        <h5 class="my-0" id="today"></h5>
                    </div>
				</div>


				<hr>
                
                <!-- 썸머노트  -->
				<textarea id="summernote" name="Contents"></textarea>


				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-secondary">등록</button>
					<button type="button" class="btn btn-outline-secondary">목록으로</button>
				</div>

            
            
                </form>

            </div>
    </div>
    
</body>
</html>