<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="img/logo.png" />
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
     <link rel="stylesheet" href="${contextPath}/resources/css/fake_room.css">   
		<title>허위매물관리</title>
</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	 <div class="section">
        <div class="report-manage">
            <h2>허위 매물 관리</h2>
        </div>

        <div class="search-area">
            <form action="" method="GET" class="search" name="searchForm" id="searchForm">
                <input type="text" name="searchValue" class="search-input" placeholder="매물 번호로 검색">
                <button class="search-button btn btn-primary" id="searchBtn">검색</button>
            </form>
        </div>

        <form action="" method="GET" class="itemForm" id="itemForm">
            <div class="total-item-area">

                <div class="check-area">
                    <input type="checkbox" name="check-item" id="check-item">
                </div>

                <div class="item-area">
                    <div class="item-info-area">
                        <div class="image-area">
                            <img src="img/roomImg1.jpg">
                        </div>
                        <div class="title-info-area">
                            <div class="title-area">
                                <div class="item-title">
                                    <h5>매물 제목</h5>
                                </div>

                                <div class="item-name">
                                    <p> 1000/60 역까지 도보 5분</p>
                                </div>
                            </div>
                            <div class="info-area">
                                <div class="item-info">
                                    <h5> 매물 정보 </h5>
                                </div>
                                <div class="item-information">
                                    <p> 외대 경희대 도보 5분 거리에 위치한 외관 깔끔한 신축스타일 건물입니다.

                                        ✔✤✸ 7층 건물의 4층이며 이번년도에 새로 리모델링을 해서 신축 입주하는 듯한 기분입니다~

                                        ✔✤✸ 더군다나 옵션은 물론 수납공간 넉넉하니 실용적으로 구성되어 편리하게 사용하실 수 있습니다.

                                        ✔✤✸ 외대 경희대 학생들 위주로 입주해있는 원룸건물로

                                        ✔✤✸ 위치 시설 깔끔함 종합적인 면에서 최고 좋은 원룸입니다.
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="table-area">
                        <table class="table table-striped table-hover" id="list-table">
                            <tr>
                                <th>No.</th>
                                <th>신고 내용</th>
                                <th>신고한 회원</th>
                            </tr>

                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    뭐야.. 전화해서 가봤더니 없는 매물이라고...
                                </td>
                                <td>
                                    IWantMyHome
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    이거 매물 이미 팔린거같은데요?
                                </td>
                                <td>
                                    ThisisNotMyRoom
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    낚시임 파닥파닥파닥파닥
                                </td>
                                <td>
                                    pleaseGiveMeRoom
                                </td>

                            </tr>
                        </table>

                    </div>
                </div>

            </div>
            <br>

            <div class="total-item-area">

                <div class="check-area">
                    <input type="checkbox" name="check-item" id="check-item">
                </div>

                <div class="item-area">
                    <div class="item-info-area">
                        <div class="image-area">
                            <img src="img/roomImg2.jpg">
                        </div>
                        <div class="title-info-area">
                            <div class="title-area">
                                <div class="item-title">
                                    <h5>매물 제목</h5>
                                </div>

                                <div class="item-name">
                                    <p> 500/60 중화역 도보10분 다가구주택</p>
                                </div>
                            </div>
                            <div class="info-area">
                                <div class="item-info">
                                    <h5> 매물 정보 </h5>
                                </div>
                                <div class="item-information">
                                    <p> *주방과 침실공간이 별도로 분리되어 있는 방1 주방겸거실1 구조입니다.

                                        *실면적 약10평으로 사이즈 큰편입니다. 연식이 있는 다가구주택이지만 주인사모님께서 새집처럼 깔끔하게 관리해주십니다.

                                        *학교근처 조용한 주택가에 위치해 있습니다. 시끄럽지 않고 공기좋은 동네에 있어요~
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="table-area">
                        <table class="table table-striped table-hover" id="list-table">
                            <tr>
                                <th>No.</th>
                                <th>신고 내용</th>
                                <th>신고한 회원</th>
                            </tr>

                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    이 매물 없는 매물이에요 신고합니다~
                                </td>
                                <td>
                                    citizen
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    관리자님 이 매물 없는 매물이에요~ !!!
                                </td>
                                <td>
                                   comeon
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>
            <br>




            <div class="button-area">

                <button class="btn btn-primary float-right delete-item" id="deleteBtn">삭제</button>
            </div>
        </form>

        <div class="my-5 page-area">
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
	
</body>
</html>