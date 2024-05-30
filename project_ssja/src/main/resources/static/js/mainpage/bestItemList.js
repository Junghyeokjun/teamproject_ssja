let $best_item_content = $("#best_item_content");
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
let bestItemPageNum = 0;

let getListBestToServer = function (pageNum) {
    $.ajax({
        type: "get",
        contentType: "application/json",
        url: "/product/best-mainpage",
        data: { 'page': pageNum },
        success: function (data) {
            console.log(data);
            $best_item_content.empty();

            let $list_content_dv = $("<div>").addClass("d-flex flex-column");
            let $row;
            data.forEach(function (e, index) {
                if (index % 4 === 0) {
                    $row = $("<div>").addClass("d-flex flex-row w-100");
                    $list_content_dv.append($row);
                }

                let $item_content_dv = $("<div>").addClass("item-content-div")
                    .css({ "max-width": "25%", 'height': '20em' })
                    .hover(
                        function () {
                            $item_img_dv.css('background-size', '115%');
                            $(this).css('background-color', '#eee').css('cursor', 'pointer');
                        },
                        function () {
                            $item_img_dv.css('background-size', 'cover');
                            $(this).css('background-color', 'white').css('cursor', 'auto');
                        }
                    ).on('click', function () {
                        window.location.href = '/product_detail?PRO_NO=' + e.pro_NO;
                    });

                let $item_img_dv = $("<div>").addClass("item-img-div mx-1")
                    .css({
                        "max-width": "100%", "min-height": "40%", "background-image": 'url(' + e.pro_BANNERIMG + ')',
                        "background-size": "cover", "background-position": "center", "overflow": "hidden"
                    });


                let $item_info_dv = $("<div>").addClass("m-0 mx-1").attr('id', 'item-info-div')
                    .css({ "margin": "1em", "width": "100%", 'height': '10em', "padding-bottom": "1em" ,'padding':'1em'});

                let $item_title_dv = $("<div>").addClass("item-title-div")
                .css({  "font-size": "1em",  "overflow": "hidden",  "text-overflow": "ellipsis",  "white-space": "nowrap"  })
                .append($("<p>").text(e.pro_NAME));
                
                let $item_bizname_dv = $("<div>").addClass("item-bizname-div")
                    .text(e.pro_BIZNAME + " 확인용 상품번호: " + e.pro_NO)
                    .css({ "font-weight": "bold", "font-size": "0.9em", "margin-bottom": "0.5em" }); 

                let $item_price_dv = $("<div>").addClass("item-price-div")
                    .text(formatNumber(e.pro_PRICE) + "원")
                    .css({ "margin-left": "auto", "margin-right": "1em" });

                let $item_review_wish_dv = $("<div>").addClass("d-flex flex-row justify-content-between")
                .attr('id', 'item-review-wish-div')
                    .append(
                        $("<div>").append($("<img>").attr("src", "/images/utilities/star_icon.jpg")
                        		.css("width", "1.5em"), $("<span>").text(e.rating_avg)),
                        		
                        $("<div>").append($("<span>").text(e.pro_WISH).css("color", "#f06575"),
                        		
                            $("<img>").attr("src", "/images/utilities/wish_icon.png").css("width", "1.5em")
                            .on("click", function (event) {
                                event.preventDefault();
                                let countwish = wish_click(e.pro_NO);
                                $(this).prev("span").text(countwish);
                                return false;//상품상세 링크 이동 방지                         
                                })
                        )
                    );

                $item_info_dv.append($item_title_dv, $item_bizname_dv, $item_price_dv, $item_review_wish_dv);
                $item_content_dv.append($item_img_dv, $item_info_dv);
                $row.append($item_content_dv);
            });
            $best_item_content.append($list_content_dv);
        },
        error: function (xhr, status, error) {
            console.log("Error:", xhr.responseText);
        }
    });
}

$("#more_best_item_btn").on('click', function () {
    window.location.href = "/product/best-list";
})

let wish_click = function (productnumber) {
    let count = 0;
    $.ajax({
        type: "put",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: JSON.stringify({ "pro_no": productnumber }),
        url: "/wishlist",
        async: false,
        contentType: "application/json",
        success: function (data) {
            count = data;
        }, error: function (e) {
            console.log(e);
            window.location.href = "/login";
        }
    });
    return count;
};
let changePageNum = function () {
    if (bestItemPageNum < 3) {
        bestItemPageNum++;
    } else {
        bestItemPageNum = 0;
    }
}
let MovePageBest = function () {
    changePageNum();
    getListBestToServer(bestItemPageNum);
}
setInterval(MovePageBest, 5000);

getListBestToServer(bestItemPageNum);
