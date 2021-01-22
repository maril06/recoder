<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- reset -->
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/message.css">


    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- font awesome -->
    <script src="${contextPath}/resources/js/fontawesome.js" crossorigin="anonymous"></script>

    <title>-</title>
</head>
<body>
    <div class="wrapper">
        <!-- header -->
		<!-- WEB-INF/views/common/header.jsp 여기에 삽입(포함) -->
		<jsp:include page="../common/header.jsp"></jsp:include>


        <!-- message -->
        <section class="message clearfix">
            <h1>쪽지 함</h1>
            <div class="msg_box">
                <ul>
                	<c:forEach var="message" items="${message}">
                    <li class="member_list clearfix">
                        <div class="msg_left">
                            <img src="${contextPath}/resources/images/homepage/mail_open.png" alt="">
                            <div class="circle"></div>
                            <div class="mcnt" id="mcnt"><i class="fas fa-comment-plus"></i></div>
                            <span class="name">${message.memNick}</span>
                            <input type="hidden" value="${message.memSend }" name="memNo" class="aa">
                        </div>

                        <p class="msg_text" id="msgText">
                        	${message.msgContent}
                        </p>

                        <div class="msg_right">
                            <span class="msg_date">
                            	<fmt:formatDate value="${message.createDate}" pattern="hh:mm"/>
                            </span>
                            <div class="msg_button_check"><span>확인</span></div>
                            <div class="msg_button_delete"><span>삭제</span></div>
                        </div>
                    </li>
                    
                    </c:forEach>
                    
                    
                </ul>
            </div>
            <div class="message_his">
                <ul>
                    <li class="you clearfix">
                        <span class="name">상대방</span>
                        <p>
                            네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요

                            <span class="msg_date">11:54</span>  
                        </p>
                    </li>
                    <li class="me clearfix">
                        <span class="name">나</span>
                        <p>
                            네 안녕하세요
                            <span class="msg_date">11:54</span>  
                        </p>
                    </li>
                    <li class="me clearfix">
                        <span class="name">나</span>
                        <p>
                            네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요네 안녕하세요
                            <span class="msg_date">11:54</span>  
                        </p>
                    </li>
                </ul>
                <div class="message_send">
                    <form action="" class="input_form clearfix">
                        <!-- <input type="textarea" placeholder="내용"> -->
                        <textarea name="" id="" cols="30" rows="10" placeholder="내용" ></textarea>
                        <button id="send">전송</button>
                    </form>
                </div>
            </div>
        </section>
        
        <footer class="footer">
            <div class="footer_wrap ft">
                <div class="footer_top clearfix">
                    <ul class="about">
                        <li><a href="">회사소개</a></li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보처리방침</a></li>
                        <li><a href="">매물관리규정</a></li>
                        <li><a href="">자동저장서비스</a></li>
                    </ul>
                    <div id="gotoTop"><i class="fas fa-arrow-up"></i>TOP</div>
                </div>
                <div class="footer_mid">
                    <p>
                        (주)스테이션3 <br>
                        대표 : 한유순, 유형석 <br>
                        사업자 번호: 220-88-59156 &nbsp;통신판매업신고번호 : 제2013-서울 강남-02884호<br>
                        주소 : 서울시 서초구 서초대로 301 동익 성봉빌딩 10층 (주)스테이션3 <br>
                    </p>
                    <p>
                        고객센터 : 02-1899-6840(평일 10:00 ~ 18:30 토•일요일, 공휴일 휴무) <br>
                        팩스 : 02-554-9774프로모션/사업 제휴문의 : biz@station3.co.kr허위매물 신고 : clean@dabangapp.com
                    </p>
                </div>
                <div class="footer_bottom">
                    <span>Station3, Inc. All rights reserved.</span>
                    <ul class="clearfix">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fas fa-comment"></i></a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>

    <script src="${contextPath}/resources/js/message.js"></script>
    <script type="text/javascript">
    	$(".msg_button_delete").on('click', (e)=> {
    		
    			
    		
    		/*
    		확인 시연할 ajax
    		
    		$.ajax({
				url : "",
				type : "post",
				data: {"userPw": inputPw},
				success : function(result){

				}, error : function(){
					
				}		
			});
    		
    		*/
    		
    	})
    	
    </script>
</body>
</html>