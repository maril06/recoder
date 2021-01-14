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
    <link rel="stylesheet" href="${contextPath}/resources/css/roomsInfoInsert.css">
    
    

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
        <!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/header.jsp"></jsp:include>

        <h2>매물 올리기</h2>
        
        <form action="${contextPath}/room/roomInsert.do" method="POST" onsubmit="return updateValidate();">
        
            <!-- update image -->
            <section class="images">
                <h3>사진 올리기</h3>
                <span>빈 공간을 클릭해주세요</span>
                <div class="images_wrapper">
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                    <div class="img_list">
                        <img alt="">
                    </div>
                </div>

                <div id="fileArea">
                    <input type="file" id="img0" onchange="LoadImg(this,0)" name="img0">
                    <input type="file" id="img1" onchange="LoadImg(this,1)" name="img1">
                    <input type="file" id="img2" onchange="LoadImg(this,2)" name="img2">
                    <input type="file" id="img3" onchange="LoadImg(this,3)" name="img3">
                    <input type="file" id="img4" onchange="LoadImg(this,4)" name="img4">
                    <input type="file" id="img5" onchange="LoadImg(this,5)" name="img5">
                    <input type="file" id="img6" onchange="LoadImg(this,6)" name="img6">
                    <input type="file" id="img7" onchange="LoadImg(this,7)" name="img7">
                    <input type="file" id="img8" onchange="LoadImg(this,8)" name="img8">
                </div>
                
            </section>

            <hr>

            <!-- update roomInfo -->
            <section class="room_info">
                <div class="room_content">
                    제목을 작성해주세요 <input type="text" class="title" id="roomTitle" placeholder="제목">
                    내용을 작성해주세요 <textarea class="about" id="roomInfo"></textarea>
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
                                <th scope="row" >지역</th>
                                <td colspan="3"><input type="text" id="roomAddr"></td>
                            </tr>
                            <tr>
                                <th scope="row" >관리비</th>
                                <td><input type="text" id="careFee"></td>
                                <th scope="row">월세/전세</th>
                                <td>
                                    <select name="" id="typeOfRent">
                                        <option value="월세">월세</option>
                                        <option value="전세">전세</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">보증금</th>
                                <td><input type="text" id="deposit"></td>
                                <th scope="row">월세</th>
                                <td><input type="text" id="monthRent"></td>
                            </tr>
                            <tr>
                                <th scope="row">구조</th>
                                <td>
                                    <select name="" id="roomStruc">
                                        <option value="분리형원룸">분리형원룸</option>
                                        <option value="복층">복층</option>
                                        <option value="단층">단층</option>
                                    </select>
                                </td>
                                <th scope="row">층수</th>
                                <td><input type="text" id="roomFloor"></td>
                            </tr>
                            <tr>
                                <th scope="row">공급면적</th>
                                <td><input type="text" id="pubSize"></td>
                                <th scope="row">전용면적</th>
                                <td><input type="text" id="realSize"></td>
                            </tr>
                            <tr>
                                <th scope="row">방갯수</th>
                                <td>
                                    <select name="" id="roomCount">
                                        <option value="원룸">원룸</option>
                                        <option value="투룸">투룸</option>
                                    </select>
                                </td>
                                <th scope="row">근쳐 지하철역</th>
                                <td><input type="text" id="stationAddr"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="option">
                    <h2>옵션</h2>
                    <div class="title">
                        <h3>
                            있어요 <i class="fas fa-grin-hearts"></i>
                            <br>
                            <span>여기로 드래그 하세요! <i class="far fa-hand-point-down"></i></span>
                        </h3>
                        <h3>
                            없어요 <i class="fas fa-dizzy"></i>
                            <br>
                            <span>여기로 드래그 하세요! <i class="far fa-hand-point-down"></i></span>
                        </h3>
                    </div>
                    <div class="option_info">
                        <ul id="having" class="having" ondrop="drop(event)" ondragover="allowDrop(event)">
                            
                        </ul>
                        
                        <ul class="none" ondrop="drop(event)" ondragover="allowDrop(event)" draggable="true" ondragstart="drag(event)" class="items">
                            
                        </ul>
                        
                        
                    </div>
                    <div class="option_list" ondrop="drop(event)" ondragover="allowDrop(event)" >
                        <ul id="optionList">
                            <li id="airCon" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fad fa-air-conditioner"></i>에어컨</span></li>
                            <li id="washing" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fas fa-washer"></i>세탁기</span></li>
                            <li id="bed" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fad fa-bed-empty"></i>침대</span></li>
                            <li id="parking" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fad fa-parking"></i>주차</span></li>
                            <li id="closet" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fas fa-tshirt"></i>옷장</span></li>
                            <li id="tv" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fad fa-tv-retro"></i>텔레비전</span></li>
                            <li id="internet" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fas fa-wifi"></i>인터넷</span></li>
                            <li id="fridge" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fas fa-refrigerator"></i>냉장고</span></li>
                            <li id="womanOnly" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fas fa-female"></i>여성전용</span></li>
                            <li id="pet" draggable="true" ondragstart="drag(event)" class="items"><span><i class="fad fa-dog"></i>반려동물</span></li>
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
            
            <div class="form_btn">
                <button type="submit" class="btn btn-primary" id="addRoom">수정</button>
                <button type="button" class="btn btn-primary">이전으로</button>
            </div>
        </form>
        
        <!-- footer -->
        <!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
        
        
    </div>
    
    <script src="${contextPath}/resources/js/roomsInfoInsert.js"></script>
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