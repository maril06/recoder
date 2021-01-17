<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<style>
		.delete-btn{
			margin-top :20px;
		}
		.recover-btn{
			margin-top :20px;
		}
		.button-area{
			height:80px;
		}
	</style>
</head>
<body>
	
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="section">

        <div class="top-section">
            <h6>게시판 관리</h6>
            <h2>게시글/댓글 삭제</h2>
        </div>



        <div class="search-area">

            <form action="${contextPath}/searchBoard.do" method="GET" class="search-form" id="searchForm">

                <select name="sk" class="form-control" style="width: 140px; display: inline-block;">
                    <option value="totalWrite">전체 게시물</option>
                    <option value="enrollWrire">등록 게시글</option>
                    <option value="deleteWrite">삭제 게시글</option>
                </select>

                <button class="form-control btn btn-primary search-btn"
                    style="width: 60px; display: inline-block;">검색</button>
            </form>


        </div>




        <div class="content-area">
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
                        
                     <c:choose>
						<c:when test="${empty bList}">
							<tr>
								<td colspan="4">존재하는 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${bList}">
								<tr>
									<td>
									<input type="checkbox" name="ck" class="selectNotice" value="${room.noticeNo}">
									<input type ="hidden" value="${room.noticeNo}" class="roomNo">
									</td>
									<td>${board.boardNo}</td>
									<td>${board.boardTitle}</td>
									<td>${board.memberNick}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>				
						
                 </tbody>

            </table>
            
        </div> 
                
             
         <div class="button-area">
				
				
			  <c:if test="${loginAdmin.adminGrade =='A' }">
              <button class="btn btn-primary float-right delete-btn" id="deleteBtn">삭제</button>
              <button class="btn btn-primary float-right recover-btn" id="recoverBtn">복구</button>
		   	  </c:if>
         </div>
          
      </div>



		
		
		<%----------------- Pagination -------------------%>

		<c:choose>

			<c:when test="${!empty param.sk}">
				<c:url var="pageUrl" value="/searchBoard.do" />

				<c:set var="searchStr" value="&sk=${param.sk}" />
			</c:when>

			<c:otherwise>
				<c:url var="pageUrl" value="/board/list.do" />
			</c:otherwise>

		</c:choose>
		
		<%-- 첫 페이지로 돌아가는 화살표 주소 --%>
		<c:set var="fistPage" value="${pageUrl}?cp=1${searchStr}"/>
		<%-- 마지막 페이지로 돌아가는 화살표 주소 --%>
		<c:set var="lastPage" value="${pageUrl}?cp=${pInfo.maxPage}${searchStr}"/>
			
		<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
		<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
		
		<c:set var="prevPage" value="${pageUrl}?cp=${prev}${searchStr}"/>
		
		<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true"/>
		<fmt:parseNumber var="next" value="${c2 * 10 + 1}" integerOnly="true"/>
		
		<c:set var="nextPage" value="${pageUrl}?cp=${next}${searchStr}"/>
		

        <div class="my-5">
            <ul class="pagination">
            
            	<c:if test="${pInfo.currentPage > 10}">
				<li>
					<a class="page-link" href="${fistPage}">&lt;&lt;</a>
				</li>
				<li>
					<a class="page-link" href="${prevPage}">&lt;</a>
				</li>
			</c:if>
			
			<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}">
				<c:choose>						<%--page는 1부터 10까지 --%>
					<c:when test="${pInfo.currentPage == page}"> <%--페이지가 현재페이지와 같을 경우 --%>
						<li>		
							<a class="page-link">${page}</a> 
						</li>
					</c:when>
					
				<c:otherwise>
					<li>
						<a class="page-link" href="${pageUrl}?cp=${page}${searchStr}">${page}</a>	
					</li>
				</c:otherwise>
				</c:choose>
					
			</c:forEach>			
				<c:if test="${next <= pInfo.maxPage}">
					<li>
						<!-- 다음 페이지로 이동 (>) -->
						<a class="page-link" href="${nextPage}">&gt;</a>
					</li>
					<li>
						<!-- 마지막 페이지로 이동(>>) -->
						<a class="page-link" href="${lastPage}">&gt;&gt;</a>
					</li>
				</c:if>
            
            </ul>
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