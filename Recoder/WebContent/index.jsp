<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- reset -->
    <link rel="stylesheet" href="resources/css/reset.css">

    <!-- main.css -->
    <link rel="stylesheet" href="resources/css/index.css">

    <!-- slick.css -->
    <link rel="stylesheet" href="resources/css/slick.css">

 

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- slick.js -->
    <script src="resources/js/slick.min.js"></script>

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/70c929d7d4.js" crossorigin="anonymous"></script>


    <title>내 방</title>
</head>
<body>
    <div class="wrapper">
	
		<!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="WEB-INF/views/common/header.jsp"></jsp:include>

        <!-- visual -->
        <section class="visual">
            <form action="" method="GET" class="search_form">
                <div class="search">
                    <div>
                        <input type="text" placeholder="원하시는 지역명, 지하철역을 입력해주세요.">
                        <button><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- visual -->
            <ul class="slide">
                <li>
                    <img src="resources/images/homepage/bg1.jpg" alt="배경1">
                    <div class="mainTitle">
                        <strong>
                            어떤 방에서<br>
                            살고 싶으신가요?
                        </strong>
                    </div>
                </li>
                <li>
                    <img src="resources/images/homepage/bg2.jpg" alt="배경2">
                    <div class="mainTitle">
                        <strong>
                            어떤 동네에서<br>
                            살고 싶으신가요?
                        </strong>
                    </div>
                </li>
                <li>
                    <img src="resources/images/homepage/bg3.jpg" alt="배경3">
                    <div class="mainTitle">
                        <strong>
                            어떤 이웃과<br>
                            살고 싶으신가요?
                        </strong>
                    </div>
                </li>
                <li>
                    <img src="resources/images/homepage/bg4.jpg" alt="배경4">
                    <div class="mainTitle">
                        <strong>
                            어떤 집에서<br>
                            살고 싶으신가요?
                        </strong>
                    </div>
                </li>
            </ul>
        </section>

        <!-- notice -->
        <section class="notice">
            <div class="notice_list">
                <h2>공지사항</h2>
                <ul class="clearfix ft">
                    <li class="clearfix">
                        <span class="date">2020. 12. 25</span>
                        <div class="textBox">
                            <strong>공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항</strong>
                            <p class="list_txt">
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                                유튜브의 자막 기능 중 '자동 생성'의 경우 동영상의 음성을 인식하여 자막으로 변환하는 기능인데 여전히 영어 이외의 언어
                            </p>
                            <a href="#" class="more">View more</a>
                        </div>
                    </li>
                    <li class="clearfix">
                        <span class="date">2020. 12. 25</span>
                        <div class="textBox">
                            <strong>공지사항</strong>
                            <p class="list_txt">
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. <br>
                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, <br>
                            </p>
                            <a href="#" class="more">View more</a>
                        </div>
                    </li>
                    <li class="clearfix">
                        <span class="date">2020. 12. 25</span>
                        <div class="textBox">
                            <strong>공지사항</strong>
                            <p class="list_txt">
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. <br>
                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, <br>
                            </p>
                            <a href="#" class="more">View more</a>
                        </div>
                    </li>
                </ul>
            </div>
        </section>

        <section class="popular">
            <div class="popular_list">
                <h2>인기 매물</h2>
                <a href="#">&nbsp;Find out more</a>
                <ul class="clearfix ft">
                    <li>
                        <p class="img">
                            <a href="#"><img src="${contextPath}/resources/images/homepage/pp1.jpg" alt=""></a>
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
                    </li>
                    <li>
                        <p class="img">
                            <a href=""><img src="${contextPath}/resources/images/homepage/pp2.png" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </li>
                    <li>
                        <p class="img">
                            <a href=""><img src="${contextPath}/resources/images/homepage/pp3.png" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </li>
                    <li>
                        <p class="img">
                            <a href=""><img src="${contextPath}/resources/images/homepage/pp4.jpg" alt=""></a>
                        </p>
                        <h3>월세 300/28</h3>
                        <p class="text">
                            <span>여러가지 옵션 정보</span>
                            <span>
                                ㅁ계명대학교 성서캠퍼스 최신축 풀옵션원룸ㅁ동산생활관인근ㅁ먹거리촌 편의시설 집중ㅁ인테리어 이쁨
                            </span>
                        </p>
                        <a href="#" class="more">View more</a>
                    </li>
                </ul>
            </div>
        </section>

        <!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
        
    </div>

    <!-- index.js -->
    <script src="resources/js/index.js"></script>
</body>
</html>
