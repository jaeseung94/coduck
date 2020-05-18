/**
 * lecture main.js
 */

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
