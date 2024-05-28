let homePageRender = function(){
	
	$.ajax({
	    type: "get",
	    url: "/home/event-banners",
	   
	    success: function(data) {
	    	
	        data.forEach(function(e,index){
	        	let now_slide= index + 1;
	        	let next_slide = index + 2;
	        	
	        	 let $event_car_btn = $("<button>").attr("type", "button")
                 .attr("data-bs-target", "#carouselExampleIndicators")
                 .attr("data-bs-slide-to", now_slide)
                 .attr("aria-label", "Slide " + next_slide);

			$(".carousel-indicators").append($event_car_btn);
	        	
	        	let $event_contents = $("<div>").addClass("carousel-item").append(
	        		    $("<a>").attr("href", e.ev_page).append(
	        		        $("<img>").attr("id",'event_banners').attr("src", e.ev_banner)
	        		        .addClass("d-block w-100").attr("alt", "Event Banner")
	        		    )
	        		);
	        		$("#event_banner_content").append($event_contents);
	        		
	        		
	        
	        })
	    },
	    error: function(xhr, status, error) {
	        console.log("실패" ,error);
	    }
	});
};

homePageRender();