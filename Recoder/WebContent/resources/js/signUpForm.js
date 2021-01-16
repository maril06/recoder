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

//닉네임 유효성 검사 & 중복검사







//비밀번호 유효성 검사
$("#password").on("input", function(){
	
	var regExp = /^[a-zA-Z\d]{5,20}$/;
	var  = $("#password").val(); 
	var value2 = $("#confirm-password").val(); 
	
	if(!regExp.test(value)){
        $(".checkPw").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
        validateCheck.password = false;
    }else{
		 $(".checkPw").text("유효한 비밀번호 형식입니다.").css("color","green");
        validateCheck.password = true;
	
	//비밀번호가 유효하지 않은 상태에서 비밀번호 확인 작성 시
    if(!validateCheck.password && value2.length > 0){
        swal("유효한 비밀번호를 먼저 작성해주세요");
        $("#confirm-password").val(""); //비밀번호 확인에 입력한값 삭제
        $("#password").focus(); // pwd1으로 포커스 이동
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
}
	
});




