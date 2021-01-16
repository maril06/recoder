$('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.slider-nav'
  });
  
  $('.slider-nav').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: false,
    centerMode: true,
    focusOnSelect: true,
    arrows: false
  });
          

// 헤더 이벤트
var scrollTop = 0;
scrollTop = $(document).scrollTop();

$(window).on('scroll resize', function(){
    scrollTop = $(document).scrollTop();
    fixHeader();
});

function fixHeader(){
    if(scrollTop > 1){
        $('header').addClass('on');
    }else{
        $('header').removeClass('on');
    }
}

  
// 위로 부드럽게
$("#gotoTop").click(function() {
  $('html').animate({
      scrollTop : 0
  }, 400);
});

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

// 드래그
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}

// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
$(function () {
  $("#fileArea").hide();

 $(".img_list").on("click",function(){
   var index = $(".img_list").index(this);
   $("#img" + index).click();
 });
});


// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function LoadImg(value, num) {
  if (value.files && value.files[0]) {
    var reader = new FileReader();
    // 자바스크립트 FileReader
     // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
    
    reader.readAsDataURL(value.files[0]);
    // FileReader.readAsDataURL()
    // 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.
    
     // FileReader.onload
    // load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
    reader.onload = function (e) {
      //console.log(e.target.result);
      // e.target.result
      // -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)
      
      $(".img_list").eq(num).children("img").attr("src", e.target.result);
    }

  }
}




// 매물 등록 (ajax)
$("#addRoom").on("click", function(){
  var roomTitle = $('#roomTitle').val().trim();
  var roomInfo = $('#roomInfo').val().trim();

  var roomAddr = $('#roomAddr').val();
  var careFee = $('#careFee').val();
  var typeOfRent = $('#typeOfRent').val();
  var deposit = $('#deposit').val();
  var monthRent = $('#monthRent').val();
  var roomStruc = $('#roomStruc').val();
  var roomFloor = $('#roomFloor').val();
  var pubSize = $('#pubSize').val();
  var realSize = $('#realSize').val();
  var roomCount = $('#roomCount').val();
  var stationAddr = $('#stationAddr').val();

  var airCon = $('#airCon');
  var washing = $('#washing');
  var bed = $('#bed');
  var parking = $('#parking');
  var closet = $('#closet');
  var tv = $('#tv');
  var internet = $('#internet');
  var fridge = $('#fridge');
  var womanOnly = $('#womanOnly');
  var pet = $('#pet');

  var having = $('#having > li')
  var optionList = $("#optionList > li");

  var options = [];

  
  $.each(having,  function(index, item){ 
    options[index] = item.id;

	// form태그 요소 선택
	// <input type="hidden" name="options" value="item.value">
	// form.append(input)
    
  })
  
  console.log(roomTitle);
  console.log(roomInfo);
  console.log(options);

//  
//	options=1&optinos=2&options=3

  // 배열 받기 request.getParameterValues()

			// 회원번호를 얻어와서 변수에 저장
			// var replyWriter = "${loginMember.memberNo}";
		
		
		/*
			
			//  js 배열 형식을 바꾸기위한 구문
			$.ajaxSettings.traditional = true;
			//	options=1&optinos=2&options=3
			$.ajax({
				url : "roomInsert.do",
				data : {"replyWriter" : replyWriter,
						"options" : options,
			            "roomTitle" : roomTitle, 
			            "roomInfo" : roomInfo,
			            "roomAddr" : roomAddr,
			            "careFee" : careFee,
			            "typeOfRent" : typeOfRent,
			            "deposit" : deposit,
			            "monthRent" : monthRent,
			            "roomStruc" : roomStruc,
			            "roomFloor" : roomFloor,
			            "pubSize" : pubSize,
			            "realSize" : realSize,
			            "roomCount" : roomCount,
			            "stationAddr" : stationAddr            
			          },
				type : "post",
				success : function(result){
						console.log("성공");

				},
				error : function(){
					console.log("댓글 등록 실패");
				}
					
			});
		

*/
// e.preventDefault(); // 임시 
	
});

function insertteValidate(e){
	// 옵션 유효성 검사
	
	if($("#optionList > li").length>0){
		alert("모든 옵션을 옮겨주세요");
		return false;
	}
		
	
	// 변수들
	var airCon = $('#airCon');
	var washing = $('#washing');
	var bed = $('#bed');
	var parking = $('#parking');
	var closet = $('#closet');
	var tv = $('#tv');
	var internet = $('#internet');
	var fridge = $('#fridge');
	var womanOnly = $('#womanOnly');
	var pet = $('#pet');
	
	var having = $('#having > li')
	var none = $("#none > li")
	
	var optionList = $("#optionList > li");
	
	var options = [];
	var options2 = [];
	var options3 = [];
	var yes = [];
	var no = []
	
	// 있을 때
	$.each(having,  function(index, item){ 
		options[index] = item.id;
	
//		var input = $("<input type='hidden' name='options[index]'>").val(item.id);
//		var input2 = $("<input type='hidden' name='options2'>").val(item.id);
//		var input2 = $("<input type='hidden' name='options2'>").val(item.id);
		
		// var input = $("<input type='hidden' name='"+ yes[index] +"'>").val(item.id);
		//  yes = $("<input type='hidden' name='"+ options[index] +"'>").val("Y");
		
		
		
		var input2 = $("<input type='hidden' name='options2'>").val(item.id);
		//var input = $("<input type='hidden' name='"+ options[index] +"'>").val("Y");
		yes = $("<input type='hidden' name='"+ options[index] +"'>").val("Y");
		$("#insertForm").append(yes);
		$("#insertForm").append(input2);
		
	
		// form태그 요소 선택
		// <input type="hidden" name="options" value="item.value">
		// form.append(input)
	    
	  })

	// 없을 때
	$.each(none,  function(index, item){ 
		options3[index] = item.id;
	
//		var input = $("<input type='hidden' name='options[index]'>").val(item.id);
//		var input2 = $("<input type='hidden' name='options2'>").val(item.id);
//		var input2 = $("<input type='hidden' name='options2'>").val(item.id);
		
		// var input = $("<input type='hidden' name='"+ yes[index] +"'>").val(item.id);
		
		var input3 = $("<input type='hidden' name='options3'>").val(item.id);
		no = $("<input type='hidden' name='"+ options3[index] +"'>").val("N");
		$("#insertForm").append(no);
		$("#insertForm").append(input3);
		
	
		// form태그 요소 선택
		// <input type="hidden" name="options" value="item.value">
		// form.append(input)
	  })



}




