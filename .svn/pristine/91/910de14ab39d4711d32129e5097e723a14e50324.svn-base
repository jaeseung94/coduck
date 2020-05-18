/**
 * lecture js
 */
$(function() {
        $("#subNav li").on('click', function () {
            const name = $(this).attr('class');
            
            if (name == 'questions' || name == 'dashboard') return;
            // offset() 지정한 엘리먼트의 꼭다리 값 알려줌 
            const scrollTop = $("#" + name).offset().top - 70;
            // animate({name:value}, 속도ms); jquery에 애니메이션 기능 함수
            $('html, body').animate({
                scrollTop
            }, 800);
        });
        
        // 스크롤시 애니메이션 처리
        $(window).scroll(function() {
            var scrollTop = $(this).scrollTop();
           if(scrollTop > 300) {
               $(".lecture-floating-btn").css("top",'260px');
           } else {
              $(".lecture-floating-btn").css("top",'176px');
           }
       })
    });

// 이미지 슬라이더
  $(document).ready(function(){
    $('.slider').bxSlider({
    	auto:true 		// 자동으로 애니메이션 시작
    	, speed:500		// 애니메이션 속도
    	, pause:5000	// 애니메이션 유지시간 (1000 = 1s)
    	, mode: 'horizontal'	// 슬라이드 모드 ('fade', 'vertical')
    	, autoControls:true	// 시작 및 중지버튼 표시
    	, pager:true 		// 페이지 표시
    	, captions:true		// 이미지 위에 텍스트 넣기
    });
  });
