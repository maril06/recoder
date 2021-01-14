$(function(){
    $('.visual .slide').slick({
        arrows: false, // 화살표
        dots: false, // 인디케이스 제거
        fade: true, // 페이드 효과
        autoplay: true, // 자동재생
        autoplaySpeed: 4000, // 재생시간
        pauseOnHover: false, // 마우스 호버시 정지
        pauseOnFocus: false // 포커스시 정지
    })
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


$(window).on('scroll resize', function(){
    scrollTop = $(document).scrollTop();
    noticeMotion();
});

function noticeMotion(){
    if(scrollTop > 170 && scrollTop <1500){
        $('.notice .notice_list li').addClass('slide');
        $('.notice .notice_list h2').addClass('slide');
        
        
    }else{
        $('.notice .notice_list li').removeClass('slide');
        $('.notice .notice_list h2').removeClass('slide');
    }
}

$(window).on('scroll resize', function(){
    scrollTop = $(document).scrollTop();
    popularMotion();
});

function popularMotion(){
    if(scrollTop > 750){
        $('.popular .popular_list h2').addClass('slide');
        $('.popular .popular_list > a').addClass('slide');
        $('.popular .popular_list ul li').addClass('slide');
    }else{
        $('.popular .popular_list h2').removeClass('slide');
        $('.popular .popular_list > a').removeClass('slide');
        $('.popular .popular_list ul li').removeClass('slide');
    }
}

// 위로 부드럽게
$("#gotoTop").click(function() {
    $('html').animate({
        scrollTop : 0
    }, 400);
});

$('.autoplay').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
});

$('#delete').on('click', function(){
    Swal.fire({
        title: '비밀번호를 입력하세요',
        input: 'text',
        inputAttributes: {
          autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: '입력',
        showLoaderOnConfirm: true,
        
      }).then((result) => {
          if(result.value == 'aaa'){
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })
          
          swalWithBootstrapButtons.fire({
            title: '정말 탈퇴하시겠습니까?',
            text: "계정 복구가 불가능 합니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
          }).then((result) => {
            if (result.isConfirmed) {
              swalWithBootstrapButtons.fire(
                '삭제되었습니다!',
                '',
                'success'
              )
            } else if (
              /* Read more about handling dismissals below */
              result.dismiss === Swal.DismissReason.cancel
            ) {
              swalWithBootstrapButtons.fire(
                '취소되었습니다',
                '',
                'error'
              )
            }
        })
        }else if(result.value != undefined){
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })
            swalWithBootstrapButtons.fire(
                '비밀번호가 다릅니다.',
                '올바른 비밀번호를 입력하세요',
                'error'
            )
        }
    })
});
