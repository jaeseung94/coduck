/**
 * commion.js
 */

	// header-navbar
	function xx () {
		
	    $(window).on('scroll', function() {
	        const scrollTop = $(this).scrollTop();
	
	        if (scrollTop < 150) {
	            $('.sy-navbar').removeClass('navbar-fixed-top');
	            $("#root").css("margin-top","0");
	            $(".sy-navbar").css("background","white");
	        } else {
	            $('.sy-navbar').addClass('navbar-fixed-top');
	            $("#root").css("margin-top","69px");
	            $(".sy-navbar").css({background: "rgb(255, 236, 171)"});
	            $(".sy-logo").css("color", "#f4b527");
	        }
	    });
	    
	    // 조건에 따른 수강생, 강사 링크 표시
    	var url = window.location.pathname.split('/')[1];
    	
    	if (url == 'teacher') {
    		$(".navbar-user #student").css('display', 'block');
    		$(".navbar-user #teacher").css('display', 'none');
    	} else {
    		$(".navbar-user #teacher").css('display', 'block');
    		$(".navbar-user #student").css('display', 'none');
    	}
	};

