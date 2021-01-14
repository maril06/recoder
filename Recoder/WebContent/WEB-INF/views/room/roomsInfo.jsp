<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
		<!-- reset.css -->
		<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
		<!-- bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		
		<!-- slick.css -->
		<link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
		
		<!-- roomsInfo.css -->
		<link rel="stylesheet" href="${contextPath}/resources/css/roomsInfo.css">
		
		
		
		<!-- jQuery -->
		<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		
		<!-- slick.js -->
		<script src="${contextPath}/resources/js/slick.min.js"></script>
		
		<!-- font awesome -->
		<script src="${contextPath}/resources/js/fontawesome.js"></script>
    
</head>
<body>
    <div class="wrapper">
        <!-- header -->
		<jsp:include page="../common/header.jsp"></jsp:include>

        
        
        <!-- section menu -->
        <section class="menu">
            <div class="info_wrapper">
                <div class="left_btn">
                    <a id="report"><span class="clearfix"><i class="fas fa-siren-on"></i>신고</span></a>
                    <a href=""><span class="clearfix"><i class="fas fa-envelope"></i>쪽지</span></a>
                    <a href=""><span class="clearfix"><i class="far fa-heart"></i>찜하기</span></a>
                </div>
                <div class="broker_info">
                    <div class="visit"><button class="btn btn-primary">방문신청</button></div>
                    <div class="broker"><a href="#">공인중개사</a></div>
                </div>
            </div>
        </section>
        
        <!-- section image -->
        <section class="images">
            <div class="images_wrapper">
                <div class="main_image slider-for">
                    <img src="images/bg1.jpg" alt="">
                    <img src="images/bg2.jpg" alt="">
                    <img src="images/bg3.jpg" alt="">
                    <img src="images/bg1.jpg" alt="">
                    <img src="images/bg2.jpg" alt="">
                    <img src="images/bg3.jpg" alt="">
                </div>
                <div class="mini_image slider-nav">
                    <img src="images/bg1.jpg" alt="">
                    <img src="images/bg2.jpg" alt="">
                    <img src="images/bg3.jpg" alt="">
                    <img src="images/bg1.jpg" alt="">
                    <img src="images/bg2.jpg" alt="">
                    <img src="images/bg3.jpg" alt="">
                </div>
            </div>
            
        </section>

        <hr>

        <!-- section roomInfo -->
        <section class="room_info">
            <div class="room_content">
                <h3 class="title">이곳은 매물 제목이 오는 공간입니당</h3>
                <p class="about">
                    이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 내용
                    이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 내용
                    이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당
                    내용 이곳은 매물 내용이 오는 공간입니당 내용이곳은 매물 내용이 오는 공간입니당 내용
                    
                </p>
            </div>

            <div class="room_detail">
                <table class="table caption-top">
                    <thead> 
                      <tr>
                        <th class="more_info" colspan="4">추가 정보</th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">지역</th>
                            <td colspan="3">서울특별시 중구 신당동</td>
                        </tr>
                        <tr>
                            <th scope="row">관리비</th>
                            <td colspan="3">15만원</td>
                        </tr>
                        <tr>
                            <th scope="row">구조</th>
                            <td>원룸</td>
                            <th scope="row">층수</th>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th scope="row">공급면적</th>
                            <td>10</td>
                            <th scope="row">전용면적</th>
                            <td>8</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="room_cost">
                <ul>
                    <li>
                        <span class="title">원룸</span>
                        <span class="info">월세 300/33만원</span>
                    </li>
                    <li>
                        <span class="title">전용면적</span>
                        <span class="info">11평</span>
                    </li>
                    <li>
                        <span class="title">보증금</span>
                        <span class="info">40만원</span>
                    </li>
                </ul>
            </div>

            <div class="option">
                <h2>옵션</h2>
                <div class="title">
                    <h3>있어요 <i class="fas fa-grin-hearts"></i></h3>
                    <h3>없어요 <i class="fas fa-dizzy"></i></h3>
                </div>
                <div class="option_info">
                    <ul class="having">
                        <li><span><i class="fad fa-air-conditioner"></i>에어컨</span></li>
                        <li><span><i class="fas fa-washer"></i>세탁기</span></li>
                        <li><span><i class="fad fa-bed-empty"></i>침대</span></li>
                        <li><span><i class="fad fa-parking"></i>주차</span></li>
                        <li><span><i class="fas fa-tshirt"></i>옷장</span></li>
                    </ul>
                    
                    <ul class="none">
                        <li><span><i class="fad fa-tv-retro"></i>텔레비전</span></li>
                        <li><span><i class="fas fa-wifi"></i>인터넷</span></li>
                        <li><span><i class="fas fa-refrigerator"></i>냉장고</span></li>
                        <li><span><i class="fas fa-female"></i>여성전용</span></li>
                        <li><span><i class="fad fa-dog"></i>반려동물</span></li>
                    </ul>

                </div>
            </div>
        
            
        </section>

        <!-- section map -->
        <section class="map">
            <div class="map_wrapper">
                <h3>위치</h3>
                <div id="map" class="map_area"></div>
            </div>
        </section>
        
        <!-- section reviw -->
        <section class="review">
            <div class="review_wrapper">
                <h3>후기</h3>
                <div class="visit_review">
                    <div class="score">
                        <div class="rank">
                            <h3>방문 만족도</h3>
                            <span>3.2</span>
                            <div class="graph">
                                <span style="width: 80%">80%</span>
                            </div>
                        </div>
                        <div class="count">
                            <h3>방문자 수</h3>
                            <span>32</span>
                        </div>
                    </div>
                </div>

                <div class="total_review">
                    <ul>
                        <li>
                            <div class="reply_info">
                                <span class="score">방문 만족도: 5</span>
                                <span>닉네임</span><span>2021.01.01</span>
                            </div>
                            <p class="comment">
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                            </p>
                        </li>
                        <li>
                            <div class="reply_info">
                                <span class="score">방문 만족도: 5</span>
                                <span>닉네임</span><span>2021.01.01</span>
                            </div>
                            <p class="comment">
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                            </p>
                        </li>
                        <li>
                            <div class="reply_info">
                                <span class="score">방문 만족도: 5</span>
                                <span>닉네임</span><span>2021.01.01</span>
                            </div>
                            <p class="comment">
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                                방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.방이 깨끗하고 맘에안들어요.
                            </p>
                        </li>
                    </ul>
                </div>

                <div class="review_write">
                    <form action="" method="POST">
                        <div class="form-floating">
                            <textarea class="form-control " placeholder="" id="floatingTextarea2"></textarea>
                            <input class="btn btn-primary" type="submit" value="Submit">
                          </div>
                    </form>
                </div>
                
            </div>
        </section>
        
		<!-- footer -->
        <jsp:include page="../common/footer.jsp"></jsp:include>

    </div>
    
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script src="${contextPath}/resources/js/roomsInfo.js"></script>
    <script type="text/javascript">
        function initMap(){
          const myLatLng= {
            lat: 37.499878229497895,
            lng: 127.03293045767072
          }
          const map = new google.maps.Map(
            document.getElementById('map'),
            {
              center: myLatLng,
              scrollwheel: false,
              zoom: 18
            }
          );
          const marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: 'KH정보교육원'
          });
        }
      </script>
      <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg&callback=initMap" async defer></script>
</body>
</html>