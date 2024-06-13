              
$(document).ready(function(){

    let recent_post_wrap=$("#recent_post_wrap");
    
    

    //최신게시물 추가하는 부분
    $.ajax({
        type : "GET",
        async : false,
        dataType:"json",
        url : "/community/post",
        data :{
        pageNum : 1,
        amount : 11
        },    
        success : function(data) {
        var temp_node;
        var temp_child;
        data.postList.forEach(function(e, idx){
            temp_node=$('<span class="recent_post"></span>');
            temp_child=$('<img  src="'+e.img_path+'" alt=""></img>')
            temp_child.on("click",function(){
            window.location="/community/content/"+e.bno;
            })

            temp_node.append(temp_child);
            temp_node.append('<span>'+e.bwriter +'</span>');
            recent_post_wrap.append(temp_node);
        })

        temp_node=$('<a id="img_link" href="/community/main"></a>');
        temp_node.append($('<img src="/images/utilities/arrow1.png" alt="">'));
        temp_node.append($('<span>더보기</span>'));
        recent_post_wrap.append(temp_node);
        
        },    
        error : function(request, status, error) {
        alert(error);
        }
    })

    //최신게시물 화살표 이벤트
    $(document).on("click","#next_btn",function(){
        $("#recent_post_wrap").css("animation","next_full_post 0.3s ease-in-out forwards");
        $("#prev_btn").removeAttr("hidden");
        $("#next_btn").attr("hidden","hidden");
        })
        // $("#prev_btn").css("display","inline");
        // $("#next_btn").css("display","none");

        $(document).on("click","#prev_btn",function(){
            $("#recent_post_wrap").css("animation","prev_full_post 0.3s ease-in-out forwards");
            $("#next_btn").removeAttr("hidden");
            $("#prev_btn").attr("hidden","hidden");
            // $("#next_btn").css("display","inline");
            // $("#prev_btn").css("display","none");
            
        })
        $("#prev_btn").attr("hidden","hidden");
    })


    

