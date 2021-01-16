$(document).ready(function(){
    $(".container").fadeIn(1000);
    $(".s2class").css({"color":"#white"});
    $(".s1class").css({"color":"#white"}); 
    $("#left").removeClass("left_hover");
    $("#right").addClass("right_hover");
    $(".Brokersignup").css({"display":"none"});
    $(".membersignup").css({"display":""});
    $("#attachFile").css({"display":"none"});
    $(".terms").css({"display":"none"});
 });
 $("#right").click(function(){
    $("#left").removeClass("left_hover");
    $(".s2class").css({"color":"#white;"});
    $(".s1class").css({"color":"#748194"});
    $("#right").addClass("right_hover");
    $(".Brokersignup").css({"display":"none"});
    $(".membersignup").css({"display":""});
 });
 $("#left").click(function(){
    $(".s1class").css({"color":"#white"});
    $(".s2class").css({"color":"#748194"}); 
    $("#right").removeClass("right_hover");
    $("#left").addClass("left_hover");
    $(".membersignup").css({"display":"none"});
    $(".Brokersignup").css({"display":""});
 });

 /* 약관 열기 */
   $(".open").on("click", function(){
      if($(this).next().css('display')!='none'){	
         $(this).next().hide();
         $(".c1").css("height","1000px");
         $(".c2").css("height","920px");
      }else{
         $(".open").next().hide();
         $(this).next().show();
         $(".c1").css("height","1200px");
         $(".c2").css("height","1120px");
      }

   });

/* 약관 전체동의 */
$("#checkAll").on("click", function(){
   if($("#checkAll").is(":checked")){
      $(".n-check").prop("checked", true);
   }else{
      $(".n-check").prop("checked", false);
   }
});

/* 한개 체크박스 선택해제시 전체선택 체크박스해제 */
$(".agree-item").on("click", function(){
   $("#checkAll").prop("checked", false)
}); 

/* 파일선택 버튼 클릭시 파일선택 열리게 */
(function(){
   $("#img0").hide();

   $("#fileselect").on("click", function(){
      $("#img0").click();
   })
})();

//멤버-----------------------------------------------------------------------

//회원가입 유효성 검사 객체
var validateCheck = {
	"userid" : false,
	"password" : false,
	"confirm-password" : false,
	"email" : false,
	"nickname" : false,
	"usertel" : false,
	"agreement" : false
}

//아이디 유효성 검사
//영어 대,소문자 + 숫자, 총 5-20글자
$("#userid").on("input", function(){
	var regExp = /^[a-zA-Z\d]{5,20}$/;
	
	var value = $("#userid").val(); 
	
	//아이디 형식 유효하지 않을 때
	if(!regExp.test(value)){
        $(".checkId").text("아이디 형식이 유효하지 않습니다.").css("color","red");
        validateCheck.id = false;
    }else{
	//아이디 형식 유효할때 ajax로 중복검사진행
		$.ajax({
			url:"idDupCheck.do",
			data: {"userid": value},
			type: "post",
			success: function(result){
				if(result == 0){ // 중복되지 않은 경우
                    $(".checkId").text("사용 가능한 아이디 입니다.").css("color","green");
                    validateCheck.userid = true;
               }else{
                    $(".checkId").text("이미 사용중인 아이디 입니다.").css("color","red");
                    validateCheck.userid = false;
               }
			},
			error: function(){
				console.log("아이디 중복 검사 실패");
			}
		});
		
	}
	
});



//이메일 유효성 검사
$("#email").on("input",function(){
    var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
    
    var value = $("#email").val();
    if(!regExp.test(value)){
        $(".checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
        validateCheck.email = false;
    }else{
        $(".checkEmail").text("유효한 이메일 형식입니다.").css("color","green");
        validateCheck.email = true;
    }
});


//비밀번호 검사
$("#password").on("input",function(){
	var regExp =/^[a-zA-Z\d]{6,20}$/;
    var value1= $("#password").val(); 
	var value2 = $("#confirm-password").val(); 
	
	if(!regExp.test(value1)){
        $(".checkPw").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
        validateCheck.password = false;
    }else{
		 $(".checkPw").text("유효한 비밀번호 형식입니다.").css("color","green");
        validateCheck.password = true;
	}
	//비밀번호가 유효하지 않은 상태에서 비밀번호 확인 작성 시
    if(!validateCheck.password && value2.length > 0){
        swal("유효한 비밀번호를 먼저 작성해주세요");
        $("#confirm-password").val(""); 
        $("#password").focus(); 
    }else{
        // + 비밀번호, 비밀번호 확인의 일치여부 
        if(value1.length == 0 || value2.length == 0){
            $(".checkPw2").html("&nbsp;");
        }else if(v1 == v2){
            $(".checkPw2").text("비밀번호 일치").css("color","green");
            validateCheck.pwd2 = true;
        }else{
            $(".checkPw2").text("비밀번호 불일치").css("color","red");
            validateCheck.pwd2 = false;
        }
    }
});

//닉네임 유효성 검사
$("#nickname").on("input",function(){
	 var regExp = /^[가-힣]{2,}$/; // 한글 두 글자 이상
    
    var value = $("#nickname").val();
    if(!regExp.test(value)){
        $(".checkNick").text("이름 형식이 유효하지 않습니다.").css("color","red");
        validateCheck.name = false;
    }else{
       $.ajax({
			url:"nickDupCheck.do",
			data: {"nickname": value},
			type: "post",
			success: function(result){
				if(result == 0){ // 중복되지 않은 경우
                    $(".checkNick").text("사용 가능한 닉네임 입니다.").css("color","green");
                    validateCheck.nickname = true;
               }else{
                    $(".checkNick").text("이미 사용중인 닉네임 입니다.").css("color","red");
                    validateCheck.nickname = false;
               }
			},
			error: function(){
				console.log("닉네임 중복 검사 실패");
			}
		});
    }
});


//전화번호 유효성 검사
// 전화번호 유효성 검사
$(".usertel").on("input", function(){
    // input 태그에 number 타입은 maxvalue 설정이 안되기때문에
    // 전화번호 input 태그에 4글자 초과 입력하지 못하게 하는 이벤트
   if ($(this).val().length > 13) {
      $(this).val( $(this).val().slice(0, 13));
    }
    
    var regExp = /^[\d]{3}-[\d]{4}-[\d]{4}$/;

    var value = $("#usertel").val();

    if(!regExp1.test(value)){
        $(".checkPhone").text("전화번호 형식이 유효하지 않습니다.").css("color", "red");
        validateCheck.usertel = false;
    }else{
        $(".checkPhone").text("유효한 형식의 전화번호 입니다.").css("color", "green");
        validateCheck.usertel = true;
    }

});




//------------------------------------------------------------------
function validate(){
	// 유효성 검사 여부 확인
    for(var key in validateCheck){
        if(!validateCheck[key]){
            var msg;
            switch(key){
                case "userid"  : msg = "아이디가"; break;
                case "password":  
                case "confirm-password": msg = "비밀번호가"; break;
                case "nickname": msg = "닉네임이 "; break;
                case "usertel": msg = "전화번호가"; break;
                case "email": msg = "이메일이"; break;
            }

            swal(msg + " 유효하지 않습니다.");

            $("#"+key).focus();

            return false; 
        }
    }

	//약관동의 검사
	if($("input:checkbox[class=required-agree-item]:checked").length == 3) {
		validateCheck.agreement = true;
	}else{
		swal("필수 약관에 동의해주세요.");
		return false;
	}

}