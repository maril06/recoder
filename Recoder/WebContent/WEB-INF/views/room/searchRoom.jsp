<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

     <!-- 부트스트랩 사용을 위한 css 추가 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
     <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
     <!-- 제이쿼리가 항상 먼저여야함 -->
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

     <style>
         /* div{
             border: 1px solid pink;
         } */

         * {
            box-sizing: border-box;
            margin: 0px;
            height: 100%;
         }

         .wrapper{
            width: 100%;
            min-width: 1280px;
         }

         .row{
             width: 100%;
             height: 64px;
             margin-right: 0;
             margin-left: 0;
         }

         .subHeader{
             height: 100%;
             width: 100%;
             margin-right: 0;
         }

         .search_area{
            float: left;
            width: 20%;
            height: 100%;
         }

         .search_area svg{
             cursor: pointer;
         }

         .filter_area{
             float: right;
             width: 80%;
             height: 100%;
             display: flex;
         }

         .content{
             width: 100%;
             height: 100%;
         }

         .ListWrap{
             width: 30%;
             height: 100%;
             float: left;
             border-right: 1px solid #c0c1bf;
         }

         .itemList{
            width: 100%;
            height: 90%;
         }

         .roomItem{
             width: 80%;
             height: 25%;
             margin: 0 auto;
         }

         .roomItem_area{
             width: 40%;
             height: 90%;
             float: left;
             margin-top: 5%;
             margin-left: 6%;
             cursor: pointer;
         }

         .imgArea{
            width: 100%;
            height: 70%;
         }

         .infoArea{
             width: 100%;
             height: 30%;
         }

         .imgArea img{
             width: 100%;
             height: 100%;
         }

         .paging{
             width: 100%;
             height: 10%;
             display: flexbox;
         }

         .ListWrap{
             margin: 0px;
             padding: 0px;
             margin-right: 0px;
         }

         .mapArea{
             width: 70%;
             height: 100%;
             float: right;
         }

         .pagination{
            margin-top: 10%;
         }

         .pagination-sm{
             height: 30%;
         }

         .search_Keyword{
            width: 80%;
            height: 100%;
            padding: 0px 50px 0px 30px;
            color: rgb(34, 34, 34);
            font-size: 16px;
            border: none;
        }

        .search_area svg{
            margin-left: 5%;
        }

        .infoArea p{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .filter{
            margin-left: 10px;
            width: 120px;
            flex: 0 0 auto;
            position: relative;
            z-index: 950;
        }

        .filter_btn{
            width: 100%;
            height: 36px;
            margin-top: 0.5%;
            padding: 10px 26px 0px 10px;
            background-color: rgb(252, 252, 252);
            border: rgb(252, 252, 252);  
            background: url(https://www.dabangapp.com/static/media/arrow.4cbc5f99.svg) right 10px center / 10px no-repeat;
            margin-top: 5%;
        }

        .filter_btn p{
            width: 100%;
            color: rgb(34, 34, 34);
            font-size: 13px;
            font-weight: 700;
            text-overflow: ellipsis;
            white-space: nowrap;
            background-color: rgb(255, 255, 255);
            overflow: hidden;
            margin: 0;
            position: relative;
        }

        .layer {position:absolute;width:500px; height:500px; background-color:#fff;border:1px #c0c1bf solid;padding:0 5px 0 5px;z-index:1000;display:none; border-radius: 2%;}
        
        .layer .close {position:absolute;top:10px;right:5px; height: 20%;}

        .layer {color: rgb(48, 47, 47);}

        .filter_content {
            padding: 27px 30px 0px;
        }

        .filter_content h1, .filter_content p, .filter_content div, .filter_content label{
            height: 15%;
        }

        #layer3 .filter_content div{
           display: inline-block;
           width: 200px;
        }

        .filter_content input{
            height: 40%;
        }

        #customRange1, #customRange2, #customRange3{
            width: 100%;
        }

        #rent_type, #roomTitle{
            font-size: 13px;
        }

        #fee{
            font-weight: 500;
            font-size: 20px;
        }

        .infoArea p{
            height: 35%;
        }

        .form-check-label{
            font-size: 20px;
        }

        .filter_content p{
            color: rgb(170, 170, 170);
            border-bottom: 1px solid #d3d4d2;
        }

        .form-label{
            font-size: 20px;
            font-weight: 900;
        }

        .rangeArea{
            font-size: 15px;
            color: rgb(174, 160, 236);
        }

        input:focus, button:focus{
            outline: 1px solid rgb(174, 160, 236);
        }

        datalist { 
            display: flex;
        }

        datalist option {
            width: 33.3%;
        }

        #value2{
            text-align: center;
        }

        #value3{
            text-align: right;
        }

     </style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrapper">
        <div class="row">
                <div class="row2 subHeader">
                    <div class="search_area">
                        <input type="text" name="keyword" class="search_Keyword" placeholder="종로구" autocomplete="off">
                        <svg width="18" height="18" viewBox="0 0 18 18">
                            <g fill="none" fill-rule="evenodd" stroke="#222">
                                <circle cx="7.5" cy="7.5" r="6.5"></circle>
                                <path d="M12 12l5 5"></path>
                            </g>
                        </svg>
                    </div>
                    <div class="filter_area">
                        <div class="filter">
                            <button class="filter_btn btn1" style="max-width: 130px;" >
                                <p>구조(원룸,투룸)</p>
                            </button>
                            <div class="layer" id="layer1">
                                <div class="close"><a href="#" OnClick="layer1.style.display='none'">닫기</a></div>
                                <div class="filter_content">
                                    <h1>방종류</h1>
                                    <p>중복선택이 가능합니다.</p>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer1_check1">
                                        <label class="form-check-label" for="layer1_check1">원룸</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer1_check2">
                                        <label class="form-check-label" for="layer1_check2"> 투룸 </label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer1_check3">
                                        <label class="form-check-label" for="layer1_check3"> 쓰리룸 이상 </label>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="filter">
                            <button class="filter_btn btn2" style="max-width: 130px;" >
                                <p>월세/전세</p>
                            </button>
                            <div class="layer" id="layer2">
                                <div class="close"><a href="#" OnClick="layer2.style.display='none'">닫기</a></div>
                                <div class="filter_content">
                                    <h1>월세/전세</h1>
                                    <p>중복선택이 가능합니다.</p>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer2_check1">
                                        <label class="form-check-label" for="layer2_check1">월세</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer2_check2">
                                        <label class="form-check-label" for="layer2_check2"> 전세 </label>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="filter">
                            <button class="filter_btn btn3" style="max-width: 130px;"  >
                                <p>옵션</p>
                            </button>
                            <div class="layer" id="layer3">
                                <div class="close"><a href="#" OnClick="layer3.style.display='none'">닫기</a></div>
                                <div class="filter_content">
                                    <h1>옵션</h1>
                                    <p>중복선택이 가능합니다.</p>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check1">
                                        <label class="form-check-label" for="layer3_check1">텔레비전</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check2">
                                        <label class="form-check-label" for="layer3_check2"> 인터넷</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check3">
                                        <label class="form-check-label" for="layer3_check3"> 에어컨</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check4">
                                        <label class="form-check-label" for="layer3_check4"> 세탁기</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check5">
                                        <label class="form-check-label" for="layer3_check5"> 냉장고</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check6">
                                        <label class="form-check-label" for="layer3_check6"> 침대</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer3_check7">
                                        <label class="form-check-label" for="layer3_check7"> 옷장</label>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="filter">
                            <button class="filter_btn btn4" style="max-width: 130px;">
                                <p>기타</p>
                            </button>
                            <div class="layer" id="layer4">
                                <div class="close"><a href="#" OnClick="layer4.style.display='none'">닫기</a></div>
                                <div class="filter_content">
                                    <h1>그외 기타</h1>
                                    <p>중복선택이 가능합니다.</p>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer4_check1">
                                        <label class="form-check-label" for="layer4_check1">여성전용</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer4_check2">
                                        <label class="form-check-label" for="layer4_check2"> 반려동물 </label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="layer4_check3">
                                        <label class="form-check-label" for="layer4_check3"> 주차 가능 </label>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="filter">
                            <button class="filter_btn btn5" style="max-width: 130px;">
                                <p>가격</p>
                            </button>
                            <div class="layer" id="layer5">
                                <div class="close"><a href="#" OnClick="layer5.style.display='none'">닫기</a></div>
                                <div class="filter_content">
                                    <h1>가격</h1>
                                    <div class="rangeSlider">
                                        <label for="customRange1" class="form-label">월세</label><br>
                                        <span class="rangeArea">무제한</span><br>
                                        <input type="range" class="form-range" min="0" max="500" step="10" value="500" list="tickmarks" id="customRange1">
                                        <datalist id="tickmarks">
                                            <option value="0" label="0원" id="value1"></option>
                                            <option value="250" label="250만원" id="value2"></option>
                                            <option value="500" label="500만원" id="value3"></option>
                                          </datalist>
                                    </div><br><br>
                                    <div class="rangeSlider">
                                        <label for="customRange2" class="form-label">전세</label><br>
                                        <span class="rangeArea">무제한</span><br>
                                        <input type="range" class="form-range" min="0" max="100000" step="1000" value="100000" id="customRange2">
                                    </div><br><br>
                                    <div class="rangeSlider">
                                        <label for="customRange3" class="form-label">보증금</label><br>
                                        <span class="rangeArea">무제한</span><br>
                                        <input type="range" class="form-range" min="0" max="5000" step="100" value="5000" id="customRange3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <div class="content">
            <div class="ListWrap">
                <div class="itemList">
                    <div class="roomItem">
                        <div class="roomItem_area test1">
                            <div class="imgArea">
                               <img src="" class="img-responsive">
                            </div>
                            <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간 상세 매물 제목 구간 상세 매물 제목 구간 </p>
                            </div>
                        </div>
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                    </div>
                    <div class="roomItem">
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                    </div>
                    <div class="roomItem">
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                    </div>
                    <div class="roomItem">
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                        <div class="roomItem_area">
                            <div class="imgArea">
                                <img src="" class="img-responsive">
                             </div>
                             <div class="infoArea">
                                <span id="rent_type">월세</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간</p>
                             </div>
                        </div>
                    </div>

                </div>
                <div class="paging">
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center pagination-sm">
                                  <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
                                  </li>
                                  <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
                                  <li class="page-item" >
                                    <a class="page-link" href="#">2</a>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                  <li class="page-item">
                                    <a class="page-link" href="#">&raquo;</a>
                                  </li>
                                </ul>
                              </nav>
                </div>
            </div>
            <div class="mapArea">
                지도 api
            </div>
        </div>
    </div>

    <script>
        var layer = document.getElementsByClassName("filter_btn");

        $(".filter_btn").on("click", function(event){
            var id = $(this).siblings(".layer");
            var id2 = $(this).parent().siblings().children(".layer");
            var color1 = $(this).children("p");
            var color2 = $(this).parent().siblings().children().children("p");

            $(id2).css("display", "none");
            $(color2).css("color", "rgb(34, 34, 34)");

            if($(id).css("display") == "none"){   
                $(id).css("display", "block");
                $(color1).css("color", "rgb(174, 160, 236)");
            } else {  
                $(id).css("display", "none");  
                $(color1).css("color", "rgb(34, 34, 34)"); 
            }
        });

        $(".close").on("click", function(){
            $(this).parent().siblings().children("p").css("color", "rgb(34, 34, 34)");
        });



        function ShowSliderValue(result, rangeId)
        {
            var obValueView1 = rangeId.siblings("span");
            obValueView1.html(result);
        }

        var RangeSlider = function(rangeId){
            var range = $(rangeId);
            
            range.on('input', function(){		
                var roomVal = this.value;
                var result = "";

                if(roomVal < 10000){
                    result = roomVal + "만원 이하"
                    ShowSliderValue(result, rangeId);
                }
                else{
                    var val1 = parseInt(roomVal / 10000);
                    var val2 = parseInt(roomVal % 10000);
                    if(val2 == 0) {
                        result = val1 + "억 ";
                    }else{
                        result = val1 + "억 " + val2 + "만원"
                    }
                    ShowSliderValue(result, rangeId);
                }

            });
        };
        RangeSlider($("#customRange1"));
        RangeSlider($("#customRange2"));
        RangeSlider($("#customRange3"));

    </script>
</body>
</html>