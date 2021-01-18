<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                    <a id="msg"><span class="clearfix"><i class="fas fa-envelope"></i>쪽지</span></a>
                    <a href=""><span class="clearfix"><i class="far fa-heart"></i>찜하기</span></a>
                </div>
                <div class="broker_info">
                    <div class="visit"><button class="btn btn-primary" id="visit">방문신청</button></div>
                    <div class="broker"><a href="#">공인중개사</a></div>
                </div>
            </div>
        </section>
        
        <!-- section image -->
        <section class="images">
            <div class="images_wrapper">
                <div class="main_image slider-for">
                <c:if test="${!empty mList }">
	                <c:forEach var="file" items="${mList}" varStatus="vs" >
	                    <img src="${contextPath}/resources/images/rooms/${file.roomImgName}" alt="" id="${file.roomImgNo}">
                    </c:forEach>
                </c:if>
                    
                </div>
                <div class="mini_image slider-nav">
                	<c:if test="${!empty mList }">
		                <c:forEach var="file" items="${mList}" varStatus="vs" >
		                    <img src="${contextPath}/resources/images/rooms/${file.roomImgName}" alt="" id="${file.roomImgNo}">
	                    </c:forEach>
	                </c:if>
                </div>
            </div>
            
        </section>

        <hr>

        <!-- section roomInfo -->
        <section class="room_info">
            <div class="room_content">
                <h3 class="title">${room.roomTitle }</h3>
                <p class="about">
                    ${room.roomInfo}
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
                            <td colspan="3" id="area">${room.roomAddr }</td>
                        </tr>
                        <tr>
                            <th scope="row">관리비</th>
                            <td>${room.careFee }만원</td>
                            <th scope="row">근쳐 지하철역</th>
                            <td>${room.stationAddr }</td>
                        </tr>
                        <tr>
                            <th scope="row">구조</th>
                            <td>${room.roomStruc }</td>
                            <th scope="row">층수</th>
                            <td>1</td>
                        </tr>
                        <tr>
                            <th scope="row">공급면적</th>
                            <td>${room.pubSize }</td>
                            <th scope="row">전용면적</th>
                            <td>${room.realSize }</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="room_cost">
                <ul>
                    <li>
                        <span class="title">원룸</span>
                        <span class="info">월세 ${room.monthRent}만원</span>
                    </li>
                    <li>
                        <span class="title">전용면적</span>
                        <span class="info">11111평</span>
                    </li>
                    <li>
                        <span class="title">보증금</span>
                        <span class="info">${room.deposit}만원</span>
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
                    	<c:forEach var="font" items="${font }">
                    		<c:forEach var="item" items="${options}">
                    			<c:choose>
                    				<c:when test="${item.value == 'Y' && font.key == item.key }">
			                        	<li><span><i class="${font.value }"></i><c:out value="${item.key }"></c:out></span></li>
                    				</c:when>
                    			</c:choose>
                    		</c:forEach>
                    	</c:forEach>
                    </ul>
                    
                    <ul class="none">
                        <c:forEach var="font" items="${font }">
                    		<c:forEach var="item" items="${options}">
                    			<c:choose>
                    				<c:when test="${item.value == 'N' && font.key == item.key }">
			                        	<li><span><i class="${font.value }"></i><c:out value="${item.key }"></c:out></span></li>
                    				</c:when>
                    			</c:choose>
                    		</c:forEach>
                    	</c:forEach>
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
        <c:if test="${!empty loginMember && (loginMember.memGrade == 'B')}">
			<div class="update_wrapper">
				<div class="update"><a href="${contextPath }/room/roomUpdateForm.do" class="btn btn-primary" id="visit">수정</a></div>
			</div>
        </c:if>
		<!-- footer -->
        <jsp:include page="../common/footer.jsp"></jsp:include>

    </div>
    
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script src="${contextPath}/resources/js/roomsInfo.js"></script>

      <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8035352f3860f77b021b6c64824a3b93&libraries=services"></script>
<script>


	
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('${room.roomAddr }', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
   
            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
              
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        
        var markerPosition  = new kakao.maps.LatLng(map.getCenter().getLat(), map.getCenter().getLng()); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});
marker.setMap(map);
    } 
}



	// 쪽지 보내기
	
	$("#msg").on('click', ()=>{
		
		Swal.fire({
		  title: '쪽지 보내기',
		  input: 'text',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '보내기',
		  showLoaderOnConfirm: true,
		  preConfirm: (login) => {
			if(result.isConfirmed){
		  		
			  	$.ajax({
			 		url : "${contextPath}/message/messageSend.do",
					type : "post",
					data : {
						"msgContext" : login,
						"brokerNo" : ${room.gMemNo},
			 			"myNo" : ${loginMember.memNo}
						},
					success : function(result){
						if(result > 0){
							
							console.log("성공");
		
						}
						
					}, error : function(){
						console.log("댓글 수정 실패");
					}		
				});
			  	
			  	
			  	console.log(login)
			  	
			}
		}
	})
		
});
	




$('#report').on('click', () => {

	  Swal.fire({
	    title: '<strong>신고하기</strong>',
	    icon: 'warning',
	    html:
	    	'<form action="" method="POST" id="report_form">'+
	        '신고제목: <input type="text" id="reportTitle" name="reportTitle"><br>'+
	        '작성자 아이디: <br>'+
	        '<b id="reason">신고 사유</b>'+
	        '<input type="radio" id="fake" name="report" value="1">'+
	        '<label for="fake">허위매물</label><br>'+
	        '<input type="radio" id="illegal" name="report" value="2">'+
	        '<label for="illegal">불법 및 음란 광고</label><br>'+
	        '<input type="radio" id="info" name="report" value="3">'+
	        '<label for="private">개인정보노출 / 사생활 침해</label><br>'+
	        '<input type="radio" name="report" value="4">'+
	        '<label for="other">기타사유</label>'+
	        '<strong id="rpinfo">신고 내용</strong>'+
	        '<textarea name="other" id="other" cols="30" rows="5"></textarea>'+
	      '</form>',
	    showCloseButton: true,
	    showCancelButton: true,
	    focusConfirm: false,
	    confirmButtonText:
	      '신고',
	    confirmButtonAriaLabel: 'Thumbs up, great!',
	    cancelButtonText:
	      '취소',
	    cancelButtonAriaLabel: 'Thumbs down'
	  }).then((result) => {
	    // 값 보낼 함수 시작 가능
		if(result.isConfirmed){
			
		
		$.ajax({
			 		url : "${contextPath}/report/reportSend.do",
					type : "post",
					data : {
						"reportTitle" : $("#reportTitle").val(),
						"reportInfo" : $("#other").val(),
						"roomNo" :  ${room.roomNo },
						"category" :$("input[name=report]").val()
						
						},
					success : function(result){
						Swal.fire('신고했습니다!', '', 'success')
						
					}, error : function(){
						console.log("신고 실패");
					}		
				});
		 


		}
		
	  });

	});
	
	
	$("#visit").on("click",()=>{
		Swal.fire({
			  title: '방문 신청 하시겠습니까?',
			  text: " ",
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네'
			}).then((result) => {
			  if (result.isConfirmed) {
				  console.log(result);
				  $.ajax({
				 		url : "${contextPath}/visit/visitSend.do",
						type : "post",
						data : {"result":1 },
						success : function(result){
							if(result > 0){
								Swal.fire(
									'방문 신청했습니다!',
									'방문시간을 지켜주세요',
									'success'
								);
							}else{
								Swal.fire(
									'이미신청했습니다',
									'',
									'info'
								);
							}
							
						}, error : function(){
							console.log("신청 실패");
						}		
					});
				  
				  
			    
			  }
			})
			
	})
	




</script>
</body>
</html>