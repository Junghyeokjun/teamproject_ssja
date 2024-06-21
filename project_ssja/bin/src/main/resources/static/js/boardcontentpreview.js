              
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
        
        choiceTextColor();

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

        function choiceTextColor(){

            $(".recent_post").each(function(){
                // var canvas=document.getElementById('myCanvas');
                var canvas = document.createElement('canvas');
                var ctx = canvas.getContext('2d');

                // Canvas에 이미지를 그림
                var img = this.children[0];
                canvas.width = img.width;
                canvas.height = img.height;
                ctx.drawImage(img, 0, 0, img.width, img.height);

                var text_width=$(this.children[1]).css("width").replace("px","");
                var text_height=$(this.children[1]).css("height").replace("px","");

                // Canvas에서 이미지 데이터를 가져와서 처리
                var imageData = ctx.getImageData(0, img.height-text_height, text_width, text_height);
            
                var data = imageData.data;
                var totalR = 0, totalG = 0, totalB = 0, totalA=0;

                // 이미지의 평균 색상 계산
                for (var i = 0; i < data.length; i += 4) {
                    totalR += data[i];
                    totalG += data[i + 1];
                    totalB += data[i + 2];
                    totalA += data[i+3];
                }

                var avgR = Math.floor(totalR / (data.length / 4));
                var avgG = Math.floor(totalG / (data.length / 4));
                var avgB = Math.floor(totalB / (data.length / 4));
                var avgA = Math.floor(totalA / (data.length / 4));

                // 평균 색상 값에 따라 텍스트의 색상을 결정
                var textElement = this.children[1];
                var textColor = calculateTextColor(avgR, avgG, avgB,avgA); // 평균 색상을 기준으로 텍스트 색상 계산
                textElement.style.color = textColor;
            })       
        }   
        // 평균 색상에 따라 텍스트 색상을 결정하는 함수
        function calculateTextColor(r, g, b,a) {

            console.log(r+" "+g+" "+b+" "+a);
            if(a==0){
                return 'black';
            }
            // RGB 색상값을 기준으로 흑백으로 변환할 수 있는 알고리즘을 사용하여 색상 결정
            var brightness = (r * 0.299 + g * 0.587 + b * 0.114);
            return brightness > 186  ? 'black' : 'white'; // 임계값에 따라 검정 또는 흰색 선택
        }
})


    

