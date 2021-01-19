<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
             height: 25%;
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
        
       .filter_btn_submit{
            text-align: center;
            height: 100PX;
        }

        #filter_btn_submit{
            height: 50PX;
        }

        #filter_btn_submit_2{
            height: 50%;
            margin-top: 100px;
        }

        #layer5{
            width:500px; height:700px;
        }

     </style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrapper">
        <div class="row">
                <div class="row2 subHeader">
                
                <!-- 지역 검색 기능 -->
                    <div class="search_area"><!-- ${contextPath}/searchKeyword.do -->
                    <form action="${contextPath}/searchKeyword.do" method="get" class="text-center" id="searchForm">
                        <input type="text" name="keyword" class="search_Keyword" id="keyword2" placeholder="종로구" autocomplete="off">
                        <button id="searchBtn">검색</button>
                        
                        <!-- 
                        <svg width="18" height="18" viewBox="0 0 18 18" type="submit">
                            <g fill="none" fill-rule="evenodd" stroke="#222">
                                <circle cx="7.5" cy="7.5" r="6.5"></circle>
                                <path d="M12 12l5 5"></path>
                            </g>
                        </svg>
                        
                        -->
                    </form>
                    </div>
                    
                    
                    <!-- 검색필터 -->
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
                                        <input class="form-check-input" type="checkbox" value="1" id="layer1_check1" name="roomType">
                                        <label class="form-check-label" for="layer1_check1">원룸</label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="2" id="layer1_check2" name="roomType">
                                        <label class="form-check-label" for="layer1_check2"> 투룸 </label>
                                      </div>
                                      <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="3" id="layer1_check3" name="roomType">
                                        <label class="form-check-label" for="layer1_check3"> 쓰리룸 이상 </label>
                                      </div>
                                      <div class="filter_btn_submit">
                                          <button type="submit" id="filter_btn_submit" class="btn btn-primary">확인</button>
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
                                      <div class="filter_btn_submit">
                                          <button type="submit" id="filter_btn_submit" class="btn btn-primary">확인</button>
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
                                      <div class="filter_btn_submit">
                                          <button type="submit" id="filter_btn_submit" class="btn btn-primary">확인</button>
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
                                      <div class="filter_btn_submit">
                                          <button type="submit" id="filter_btn_submit" class="btn btn-primary">확인</button>
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
                                    <div class="filter_btn_submit">
                                          <button type="submit" id="filter_btn_submit" class="btn btn-primary">확인</button>
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
                	<c:forEach var="room" items="${rList}">
                		<c:forEach var="thumbnail" items="${fList}" varStatus="status">
									<c:if test="${room.roomNo == thumbnail.parentRoomNo}">
                        <div class="roomItem_area test1" id="${room.roomNo }">
                            <div class="imgArea">
                            	
											<!-- 현재 출력하려는 게시글 번호와 썸네일 목록 중 부모 게시글 번호가 일치하는 썸네일 정보가 잇다면 -->
										<img src="${contextPath}/resources/images/rooms/${thumbnail.roomImgName}" alt="" id="${thumbnail.roomImgNo}" class="img-responsive">
											

                            </div>
                            <div class="infoArea">
                                <span id="rent_type">${room.typeOfRent }</span><br>
                                <span id="fee">200/50</span>
                                <p id="roomTitle">상세 매물 제목 구간 상세 매물 제목 구간 상세 매물 제목 구간 </p>
                            </div>
                        </div>

									</c:if>
						</c:forEach>
                    </c:forEach>
</div>

<%---------------------- Pagination ----------------------%>
		<%-- 페이징 처리 주소를 쉽게 사용할 수 있도록 미리 변수에 저장 --%>
		<c:choose>
			<%-- 검색 내용이 파라미터에 존재할 때 == 검색을 통해 만들어진 페이지인가? --%>
			<c:when test="${!empty param.keyword}">
				<c:url var="pageUrl" value="${contextPath}/searchKeyword.do" />
				<!-- 쿼리스트링으로 사용할 내용을 변수에 저장 -->
				<c:set var="searchStr" value="&keyword=${param.keyword}" />
			</c:when>
			

			<c:otherwise>
				<c:url var="pageUrl" value="/room/searchRoom.do" />
			</c:otherwise>

		</c:choose>
		
		
		
		<!-- 화살표에 들어갈 주소를 변수로 생성 -->
		<%-- 
            검색을 안했을 때 : /board/list.do?cp=1
            검색을 했을 때 :  /search.do?cp=1&sk=title&sv=49
          --%>

		<c:set var="firstPage" value="${pageUrl}?cp=1${searchStr}" />
		<c:set var="lastPage"
			value="${pageUrl}?cp=${pInfo.maxPage}${searchStr}" />

		<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다. --%>
		<%--
          <fmt : parseNumber> : 숫자 형태를 지정하여 변수 선언 
          integerOnly="true" : 정수로만 숫자 표현(소수점 버림)
         --%>

		<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10}"
			integerOnly="true" />
		<fmt:parseNumber var="prev" value="${c1 * 10}" integerOnly="true" />
		<c:set var="prevPage" value="${pageUrl}?cp=${prev}${searchStr}" />

		<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }"
			integerOnly="true" />
		<fmt:parseNumber var="next" value="${ c2 * 10 + 1}" integerOnly="true" />
		<c:set var="nextPage" value="${pageUrl}?cp=${next}${searchStr}" />



		<div class="paging">
			<ul class="pagination justify-content-center pagination-sm">
				<%-- 현재 페이지가 10페이지 초과인 경우 --%>
				<c:if test="${pInfo.currentPage > 10}">
					<li>
						<%-- 첫 페이지로 이동(<<) --%> <a class="page-link" href="${firstPage}" tabindex="-1" aria-disabled="true">&laquo;</a>
					</li>
					<li>
						<%-- 이전 페이지로 이동(<) --%> <a class="page-link" href="${prevPage}">&lt;</a>
					</li>
				</c:if>

				<!--  페이지 목록   -->
				<c:forEach var="page" begin="${pInfo.startPage}"
					end="${pInfo.endPage}">
					<c:choose>
						<c:when test="${pInfo.currentPage == page}">
							<li><a class="page-link">${page}</a></li>
						</c:when>

						<c:otherwise>
							<li><a class="page-link"
								href="${pageUrl}?cp=${page}${searchStr}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<%-- 다음 페이지가 마지막 페이지 미만인 경우 --%>
				<c:if test="${ next <= pInfo.maxPage}">
					<li>
						<%-- 다음 페이지로 이동(>) --%> <a class="page-link" href="${nextPage}">&gt;</a>
					</li>
					<li>
						<%-- 마지막 페이지로 이동(>>) --%> <a class="page-link" href="${lastPage}">&raquo;</a>
					</li>
				</c:if>

			</ul>
		</div>
 
            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            <div class="mapArea">
            	<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				    
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8035352f3860f77b021b6c64824a3b93&libraries=services"></script>

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
        
        
    	// 게시글 상세보기 기능 (jquery를 통해 작업)

		$(".itemList .roomItem_area")
				.on(
						"click",
						function() {

							// 게시글 번호 얻어오기
							var roomNo = $(this).attr('id');
							// 클릭이 되는지 테스트
							console.log(roomNo);
							var url = "${contextPath}/room/view.do?cp=${pInfo.currentPage}&no="
									+ roomNo + "${searchStr}";

							location.href = url;

						});

		//검색내용이 잇을경우 검색착에 해당 내용을 작성해두는 기능
		(function() {
			/* var searchKey = "${param.sk}";
			//파라미터 중 sk가 있을 경우 ex)"49"
			//파라미터 중 sk가 없을 경우 ex) "" */

			var searchValue = "${param.keyword}";

			//검색창 select의 option을 반복 접근
/* 			$("select[name=sk] > option").each(function(index, item) {
				//index : 현재 접근중인 요소의 인덱스
				//item : 현재 접근중인 요소

				if ($(item).val() == searchKey) {
					$(item).prop("selected", true);
				}
			}); */

			//검색어 입력창에 searchValue값 출력
			$("input[name=keyword]").val(searchValue);
			
/* 			var para2=[];
			$("input[name='roomType']:checked").each(function(i){
				para2.push(($this).val());
			});
			
			var postData = {"para1":"para1", "chklist" : para2};
			
			$.ajax({
				url : "${contextPath}/RoomFilterController.do",
				type : 'post',
				data : postData,
				traditional : true,
				error: function(){
					alert('오류발생');
				},
				success : function(result){
					if(result > 0){
						swal.fire("성공!", 'success');
		            }else{
						swal.fire("실패", 'error');
		            }
				}
			}); */

		})();
		
		
/* 		$("#layer1 #filter_btn_submit").on("click", function(){
			console.log("아악");
			
			var isSeasonChk = false;


			
			var para2=[];

	        var arr_Season = document.getElementsByName("roomType");
	        for(var i=0;i<arr_Season.length;i++){
	            if(arr_Season[i].checked == true) {
	            	para2.push(arr_Season[i].value);
	            }
	        }
			
	            	console.log(para2);
			var postData = {"para1":"para1", "chklist" : para2};
			
			$.ajax({
				url : "${contextPath}/RoomFilterController.do",
				type : 'post',
				data : postData,
				traditional : true,
				error: function(){
					alert('오류발생');
				},
				success : function(result){
					if(result > 0){
						alert('성공');
		            }else{
		            	alert('헉');
		            }
				}
			});
		});*/

		
		
		// ----------------------------------------------------------------------------------


	

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

/* 	
	
	
	<c:forEach var="roomList" items="${roomList }">
		console.log('${roomList.roomAddr}');
	</c:forEach>
	
		console.log('${fn:length(roomList)}'*1);
	
 */
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	
	
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch($("input[name=keyword]").val(), placesSearchCB); 

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
	
	
	
	
	
	
	var listData =  new Array();
	
	<c:forEach var="roomList" items="${roomList }">
	
	listData.push({ groupAddress : '${roomList.roomAddr}', title : '${roomList.roomTitle}' });
		
	</c:forEach>
		console.log(listData);
	
		console.log('${fn:length(roomList)}'*1);
	

	
	
	
	

	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	
	
	
	
	
	
	
	var yj = [
	    {
	        groupAddress: '제주특별자치도 제주시 첨단로 242',
	        name: '제주1'
	    },
	    {
	        groupAddress: '제주특별자치도 제주시 첨단로 241', 
	        name: '제주2'
	    }
	];
	
	    
	for (let i=0; i < listData.length ; i++) {
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: listData[i].title
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	})


	};    
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
/* 	    {
	        content: '카카오', 
	        latlng: new kakao.maps.LatLng(37.56341845478246, 127.02054239196552)
	    },
	    {
	        content: '<div>생태연못</div>', 
	        latlng: new kakao.maps.LatLng(37.565390891471075, 127.0162029528835)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    } */
	];

	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
		


	
	

		
		
		
    </script>
</body>
</html>