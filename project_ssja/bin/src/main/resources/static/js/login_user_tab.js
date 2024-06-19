	  $(window).on('scroll resize', function() {
	      let userLinkPosition = $('#user_link').offset();
	      
	      $('#login_user_div').css({
	          'left': userLinkPosition.left,
	      });
	  });
  
  
        let $login_user_div = $("<div>").attr("id", "login_user_div")
        .css({'border-radius':'5px','display':'none'}).appendTo($("#user_link"));
        
        $("<button>").text("마이페이지")
            .css('white-space', 'nowrap')
            .on('click', function(e) {
            	 e.preventDefault();
                window.location.href = "/myPage";
            }).appendTo($login_user_div);

        $("<button>").text("나의 주문")
            .css('white-space', 'nowrap')
            .on('click', function(e) {
            	e.preventDefault();
                window.location.href = "/myPage/orderInfo";
            }).appendTo($login_user_div);

        $("<button>").text("Q&A")
            .css('white-space', 'nowrap')
            .on('click', function(e) {
            	e.preventDefault();
                window.location.href = "/board/list/20";
            }).appendTo($login_user_div);

        let csrf_token = $("meta[name='_csrf']").attr("content");
        $("<form>").attr({ 'action': '/logout', 'method': 'post' })
        .append(
            $("<input>").attr({ 'type': 'hidden', 'name': '_csrf', 'value': csrf_token }),
            $("<button>").css('white-space', 'nowrap').text('로그아웃').attr('type', 'submit')
        ).appendTo($login_user_div);
        
        
        $("#user_link").hover(
        	    function() {
        	        $login_user_div.show();
        	    },function() {
                    $login_user_div.hide();
                }
        	);