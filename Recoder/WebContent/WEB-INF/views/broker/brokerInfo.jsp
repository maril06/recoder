<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- reset -->
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <!-- brokerInfo.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/brokerInfo.css">

    <!-- slick.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
    

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- slick.js -->
    <script src="${contextPath}/resources/js/slick.min.js"></script>

    <!-- font awesome -->
    <script src="${contextPath}/resources/js/fontawesome.js"></script>
    
    <title>내 방</title>
</head>
<body>
    <div class="wrapper">
        <!-- header -->
        <!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/header.jsp"></jsp:include>

        
        <section class="broker_mypage">
            <h1>중개사 마이 페이지</h1>
            <div class="broker_info">
                <div class="broker_card clearfix">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                              <th colspan="4">${broker.brokerNick }님의 정보</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                              <th scope="row"><i class="far fa-map-marker-alt"></i></th>
                              <td colspan="3">${broker.broderAddr }</td>
                            </tr>
                            <tr>
                              <th scope="row"><i class="fas fa-phone-office"></i></th>
                              <td colspan="3">${broker.brokerTel }</td>
                            </tr>
                            <tr>
                              <th scope="row"><i class="fas fa-at"></i></th>
                              <td colspan="3">${broker.brokerEmail }</td>
                            </tr>
                          </tbody>
                      </table>

                    <button class="btn btn-danger" id="delete">회원 탈퇴</button>
                    <div class="broker_link clearfix">
                        <a href=""><span>방문자 체크</span></a>
                        <a href=""><span>내 정보 수정</span></a>
                    </div>
                </div>
            </div>
        </section>

        <section class="room_manager">
            <h1>내 매물 관리</h1>
            <div class="room_wrapper clearfix">
                <div class="room_list autoplay clearfix">
                    <div class="room">
                        <p class="img">
                            <a href=""><img src="images/pp1.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </div>
                    <div  class="room">
                        <p class="img">
                            <a href=""><img src="images/pp1.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </div>
                    <div  class="room">
                        <p class="img">
                            <a href=""><img src="images/pp1.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </div>
                    <div  class="room">
                        <p class="img">
                            <a href=""><img src="images/pp1.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </div>
                    <div  class="room">
                        <p class="img">
                            <a href=""><img src="images/pp1.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </div>
                </div>
                <div class="add_room">
                    <a href="">매물 등록</a>
                </div>
            </div>
        </section>
        
        <!-- footer -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        
    </div>
    

    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- index.js -->
    <script src="${contextPath}/resources/js/brokerInfo.js"></script>
</body>
</html>