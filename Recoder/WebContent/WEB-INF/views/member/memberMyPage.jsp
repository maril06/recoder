<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- 제이쿼리가 항상 먼저여야함 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <style>
        
        .wrapper {
            width: 70%;
            min-width: 1100px;
            margin: 0 auto;
        }

        .stitle{
            text-align: center;
        }

        table {
            border-top: 3px solid gray;
            border-collapse: collapse;
            margin: 0 auto;
            width: 100%;
        }
        td,tr {
            border-bottom: 1px solid lightgray;
            padding: 1%;
        }

        #td1 {
            background-color: rgb(243, 243, 243);
            text-align: center;
        }

        .bookmarkroom{
            height: 40%;
        }

        .roomImg1{
            width: 100%;
            height: 400px;
            background-color: lightgray;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .roomImg1 div{
            float: left;
        }

        .review{
            clear: both;
        }

        .roomImg2 div{
            float: left;
        }

        .review_content_star, .review_content{
            clear: both;
        }

        .roomImg1_1{
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .img{
            margin-right: 2%;
            margin-left: 2%;
        }

        .roomImg2{
            width: 100%;
            height: 500px;
            background-color: lightgray;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .roomImg2_1{
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .review_area{
            margin-right: 2%;
            margin-left: 2%;
            width: 100%;
            height: 100%;
        }

        .member_info, .bookmarkroom, .review{
            margin-top: 100px;
        }

        .review_content_star{
            width: 100%;
            height: 100%;
        }

        .review_content{
            min-width: 100%;
            height: 100%;
            background-color: rgb(235, 235, 235);
            margin-top: 5%;
        }

        .roomImg2 p{
            margin-top: 5%;
            width: 100%;
            height: 150px;
        }

        .btn_area{
            float: right;
            margin-top: 3%;
        }

        .modal{
            display: none;
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        } 

        #secession{
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        #checkPwd{
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
        }

        #modal_content{
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        .m_btn_area{
            float: right;
            margin: 0;
        }

        .bookmark, .review_area, #prev, #next{
            cursor: pointer;
        }

        
    </style>
</head>

<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrapper">
        <div class="member_info">
            <div class="title_area stitle"><img src="img/member.png" height="40px"> 회원정보</h3></div><br>
            <div class="info_area">
                <table>
                    <tr>
                        <td id="td1">닉네임</td>
                        <td>${loginMember.memNick}</td>
                    </tr>
                    <tr>
                        <td id="td1">이메일</td>
                        <td>${loginMember.memEmail}</td>
                    </tr>
                    <tr>
                        <td id="td1">전화번호</td>
                        <td>${loginMember.memTel}</td>
                    </tr>
                </table>
            </div>
            <div class="btn_area">
                <button type="button" id="modify_btn" class="btn btn-primary">정보 수정</button>
                <button type="button" id="secession_btn" class="btn btn-primary">회원 탈퇴</button>
            </div>
        </div>


       

        <div class="bookmarkroom">
            <div class="title_area stitle"><img src="img/bookmarkImg2.png" height="40px" id="bookmarkImg1"> 찜한 매물</h3></div><br>
            <div class="roomImg1">
                <div class="roomImg1_1">
                    <div id="prev"><img src="img/left.png" width="50px"></div>
                    <div class="img bookmark">
                        <img src="img/room1.jpg" width="100%">
                        <div class="roomTitle">
                            <p>
                                매물 게시글 제목
                            </p>
                        </div>
                    </div>
                    <div class="img bookmark">
                        <img src="img/room1.jpg" width="100%">
                        <div class="roomTitle">
                            <p>
                                매물 게시글 제목
                            </p>
                        </div>
                    </div>
                    <div class="img bookmark">
                        <img src="img/room1.jpg" width="100%">
                        <div class="roomTitle">
                            <p>
                                매물 게시글 제목
                            </p>
                        </div>
                    </div>
                    <div class="img bookmark"><img src="img/room1.jpg" width="100%">
                        <div class="roomTitle">
                         <p>
                            매물 게시글 제목
                        </p>
                        </div>
                    </div>
                    <div id="next"><img src="img/right.png" width="50px"></div>
                </div>
            </div>
        </div>

        <div class="review">
            <div class="title_area stitle"><img src="img/reviewstar.png" height="40px"> 후기</h3></div><br>
            <div class="roomImg2">
                <div class="roomImg2_1">
                    <div id="prev"><img src="img/left.png" width="50px"></div>

                    <div class="review_area">
                        <div class="img"><img src="img/room1.jpg" width="100%"></div>
                        <div class="review_content_star">
                            <div id="reviewstar">
                                <span class="reviewItems_star__2EEY8">
                                <span class="reviewItems_star_red__1mZYz" style="width:100%">평점</span>
                                </span>5
                            </div>
                            <div class="review_content">
                                <p>
                                    방이 엄청 깔끔하고 생각보다 넓어요 
                                    근데 조금 추울 것 같은 기분이 들고,  
                                    위치가 그렇게 좋지는 않았어요...ㅠㅠ
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="review_area">
                        <div class="img"><img src="img/room1.jpg" width="100%"></div>
                        <div class="review_content_star">
                            <div id="reviewstar">
                                <span class="reviewItems_star__2EEY8">
                                <span class="reviewItems_star_red__1mZYz" style="width:100%">평점</span>
                                </span>5
                            </div>
                            <div class="review_content">
                                <p>
                                    별로임
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="review_area">
                        <div class="img"><img src="img/room1.jpg" width="100%"></div>
                        <div class="review_content_star">
                            <div id="reviewstar">
                                <span class="reviewItems_star__2EEY8">
                                <span class="reviewItems_star_red__1mZYz" style="width:100%">평점</span>
                                </span>5
                            </div>
                            <div class="review_content">
                                <p>
                                    ......
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="review_area">
                        <div class="img"><img src="img/room1.jpg" width="100%"></div>
                        <div class="review_content_star">
                            <div id="reviewstar">
                                <span class="reviewItems_star__2EEY8">
                                <span class="reviewItems_star_red__1mZYz" style="width:100%">평점</span>
                                </span>5
                            </div>
                            <div class="review_content">
                                <p>
                                    방 엄청 좋아요 꿈꾸던 방임 가격이 쎄요 근데
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="next"><img src="img/right.png" width="50px"></div>
                </div>
            </div>
        </div>
        
              <!-- 모달창 --><!-- 탈퇴 -->

	<!-- 비밀번호 확인 -->
        <div id="modal2" class="modal">
            <div id="checkPwd">
                <form id="modal_form" method="POST" onsubmit="return checkPwdValidate();">
                    <span class="close" onclick="closeModal();">&times;</span>  
                    <br>
                    <div id="title"><h1>비밀번호 확인</h1></div><br>
                    <span>고객님의 비밀번호 확인 필요합니다. 비밀번호를 입력해주세요</span><br><br>
                    비밀번호 : &nbsp&nbsp&nbsp<input type="password" placeholder="비밀번호를 입력하세요" id="chkPw" name = "chkPw"><br>
                    
                    
                    <div class="m_btn_area">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <button type="button" onclick="closeModal();" class="btn btn-primary">취소</button>
                    </div><br><br>
                </form>
            </div>
        </div>
        
        

        <div id="modal3" class="modal">
            <div id="modal_content">
                <p>요청이 완료되었습니다.</p>
                <button type="button" onclick="closeModal();" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
    
    <script>
        var modal1 = document.getElementById("modal1");
        var modal2 = document.getElementById("modal2");
        var modal3 = document.getElementById("modal3");
        var span = document.getElementsByClassName("close")[0];
        
        $("#modify_btn").on("click", function(){
            $("#modal_form").attr("action", "checkMember.do");
            modal2.style.display = "block";
        });
        
        $("#secession_btn").on("click", function(){
            $("#modal_form").attr("action", "secessionMember.do");
            modal2.style.display = "block";
        });
        
        
 


        function openModal3(){
            modal1.style.display = "none";
            modal2.style.display = "none";
            modal3.style.display = "block";
        }

        function closeModal(){
            $(".modal").css("display", "none");
        }

        $("input:radio[name=reason]").on("click", function(){
            if(!$("input:radio[id=reason4]").is(':checked')){
                $("input[id=reason_content]").val('');
                $("input[id=reason_content]").attr("disabled",true);
            }else{
                $("input[id=reason_content]").attr("disabled",false);
            }
        });
    </script>
</body>
</html>