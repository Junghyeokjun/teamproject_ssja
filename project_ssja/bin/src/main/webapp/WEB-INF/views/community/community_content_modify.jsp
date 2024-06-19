<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0"> 
  <title>SSJA</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="/js/barscript.js">

  </script>
  <script src="/js/footer.js">

  </script>
   <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/barstyle.css?after" rel="stylesheet">

  <link rel="stylesheet" href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

  <style>
    @font-face {
      font-family: 'fonts';
      src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css") fotmat('font1');
    }

    body {
      font-family: 'fonts', NanumSquare;
      background-color: #f7f0e8;
    }

    #logo_img {
      width: 3.5em;
      height: 3em;
      width:90%;
    }
    .product:hover{
      cursor: pointer;
    }


  </style>
  <script>
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
    history.replaceState({}, null, location.pathname);
    $(document).ready(function(){
    
      let img_update=$("#img_update");
      let product_update=$("#product_update");
      let content_box=$("#content");
      let search_keyword=$("#search_keyword");
      let productlist=$("#productlist");
      let product_no=$("#product_no");
      let product_has=$("#product_has");

      let update_btn=$("#update_btn");
      let img_modify_dtn=$("#img_modify_dtn");
      let search_btn=$("#search_btn");
      let cancel_btn= $("#cancel_btn");
      let product_remove= $("#product_remove_btn")

      let bno_val=$("#bno").val();
      let m_no_val=$("#m_no").val();
      let m_NickName_val=$("#m_NickName").val();
      let img_path="/images/board_content/board_img_"+bno_val+".png";

      //검색조건에 맞는 상품목록을 불러오는 메서드
      function getProductList(keyword){
        
        $.ajax({
            type:'GET', 
            url: '/community/product',
            contentType: 'text',
            data: {keyword: keyword},
            success: function(data) {
              
              if(data.length==0){
                productlist.append($("<h1>해당 상품은 존재하지 않습니다.</h1>"))
              };
              data.forEach(function(e){
                productlist.append($('<div class="product" class="my-2" style="background-color: white;" imgPath="'+ e.pro_BANNERIMG+'" pro_no="'+e.pro_NO+'" pro_name="'+e.pro_NAME+'" >'+
                                          '<div class="d-flex flex-row align-items-center my-3">'+
                                          '<img src="'+e.pro_BANNERIMG+'" style="width: 120px; height: 80px;">'+
                                          '<div class="d-flex flex-column justify-content-center" id="orders_product_Info" style="width: 290px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin-left: 1em;"><span style="font-weight: bold;">'+e.pro_BIZNAME+'</span>'+
                                            '<span style="color: black; text-decoration: none; font-weight: bold;">'+e.pro_NAME+'</span>'+
                                          '</div>'+
                                          '</div>'+
                                      '</div>'))
                    
              });
            },
            error: function(e) {
              alert("error:" + e);
            }
          });
      }

      cancel_btn.on('click',function(){
        $.ajax({
            type:'DELETE', 
            url: '/community/tempImg/'+bno_val,
            contentType: 'text',
            success: function(data) {
            },
            error: function(e) {
              alert("error:" + e);
            }
          });
        location.href="/community/content/"+bno_val;
      })

      img_modify_dtn.on('click',function(){
        var form=$("#uploadForm")[0];
        var formData=new FormData(form);
        
        $.ajax({
          type:'post', 
          enctype:"multipart/form-data", // 업로드를 위한 필수 파라미터
          url: '/community/content/tempImg/'+bno_val,
          data: formData,
          processData: false,   // 업로드를 위한 필수 파라미터
          contentType: false,   // 업로드를 위한 필수 파라미터
          success: function(data) {
            $("#modal_close").click();

            if(data=="null"){
              return;
            }
            if($("#view_img").attr("src")==undefined){
              $("#content").prepend('<img src="'+data+'?'+(new Date().getTime())+'" alt="" id="view_img" class="w-75 d-inline-block mb-5 ">')
              img_update.val("true");
              return;
            }

            $("#view_img").attr("src","");

            $("#view_img").attr("src",data+"?"+(new Date().getTime()));

            img_update.val("true");
            },
            error: function(e) {
              alert("error:" + e);
            }
          });
      })
      update_btn.on("click",function(){
        var title=$("#title").val();
        var content=$("#update_content").text();
        if(title==""){
          alert("제목을 입력해주세요.");
          return;
        }else if(content==""){
          alert("내용을 입력해주세요.");
          return;
        }
        $.ajax({
          type : 'POST',
          url : '/community/content/modify/'+bno_val,
          async : false,
          beforeSend: function(xhr) {
              xhr.setRequestHeader(header, token);
          },
          contentType:"application/json",
          dataType : 'text',
          data :JSON.stringify({
            title : title,
            content : content
          }),    
          success : function(result) {
          },    
          error : function(request, status, error) {
            alert(error);
          }
        })
        if($("#view_img").attr("src")==undefined){
          $.ajax({
            type : 'DELETE',
            url : '/community/content/img/'+bno_val,
            async : false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType : 'text',    
            success : function(result) {

            },    
            error : function(request, status, error) {
              alert(error);
            }
          })
          //false 일경우 이미지를 교체하지 않음
        }else if(img_update.val()=="true"){
          var form=$("#uploadForm")[0];
          var formData=new FormData(form);

          $.ajax({
            type:'post', 
            enctype:"multipart/form-data", // 업로드를 위한 필수 파라미터
            url: '/community/content/img/'+bno_val,
            data: formData,
            processData: false,   // 업로드를 위한 필수 파라미터
            contentType: false,   // 업로드를 위한 필수 파라미터
            async : false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(result) {
            },    
            error : function(request, status, error) {
              alert(error);
            }
          });
        }
        if(product_update.val()=="true"){

          var pro_no=product_no.val();

          $.ajax({
            type:'post', 
            url: '/community/product/',
            beforeSend : function(xhr) {
					    xhr.setRequestHeader(header, token);
            },
            dataType:"json",
            contentType:"application/json",
            data: JSON.stringify({
              'bno':bno_val,
              'proNo':pro_no,
            }),

		        success: function(data) {
		        	}
		        });
        }



        location.assign("/community/content/"+bno_val);
      })

      //상품 선택 버튼 
      $(document).on("click",".product",function(){
        $("#product_modal_close").click();
        product_update.val("true");
        product_no.val(this.getAttribute("pro_no"));
        product_has.text(this.getAttribute("pro_name")+"상품이 선택된 상태입니다.");
      })

      search_btn.on("click",function(){
        productlist.empty();
        getProductList(search_keyword.val());
      })
      //상품 삭제 버튼
      product_remove.on("click",function(){
        product_update.val("true");
        product_no.val(0);
        product_has.text("선택된 상품이 없습니다.");
      })

      getProductList(search_keyword.val());
    })

  </script>
</head>

<body>
  <c:if test="${content==null}">
    <script>
        window.location="/community/main";
    </script>
  </c:if>
  <header>
    <div id="title_bar" class=" fixed-top">
      <div class="py-2 px-1" id="top-bar">

        <button type="toggle-button" class="top_btn" id="top_btn"></button>
        <a id="logo_toHome" href=""><img id="logo_img" src="/images/utilities/logoSSJA.png"></a>
        <form action="http://www.naver.com" id=searchForm method="get">
         
        </form>
        <button id="search_icon"></button>
        <a id="cart_link"><img id="cart_img"></a>
        <a id="user_link"><img id="login_img"></a>
      </div>

    </div>
    <nav id="total_bar">
      <div id="home_user_bar"> </div>
      <div id="sub_bar"></div>
    </nav>
    <sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal" var="principal"/>
    </sec:authorize>
    <input type="hidden" id="m_no" value="${principal.userInfo.m_No}">
    <input type="hidden" id="m_NickName" value="${principal.userInfo.m_NickName}">
  </header>

  <div id="side_bar"> 
    <div id="side_links" class="w-100"></div>
</div>

  <main>
    <input id="bno" type="hidden" value="${content.bno}">
    <div id="main_container" class="border-start border-end container">
        
      <div class="d-flex flex-column align-items-center mt-3 container-fluid">
        <input class="w-100 ps-3 py-2 mb-3 border-top border-bottom fs-3 " id="title" style="border-right: 0px; border-left: 0px;" value="${content.btitle}" > 
        <div class="w-100 mb-3 d-flex flex-column align-items-center" id="content" contentEditable >
          <c:if test='${!content.img_path.equals("/images/board_content/temp.png")}'>
            <img src="${content.img_path}" alt="" id="view_img" class="w-75 d-inline-block mb-5 ">
          </c:if>
          <input type="hidden" id="update_img" value="${content.img_path}">
          <div contentEditable="true" id="update_content" class="w-75" style="min-height:30px">${content.bcontent}</div>
        </div>
        <div class="ps-3 py-2 w-100 border-bottom d-flex flex-row justify-content-end">
          	<span>
              <button type="button" class="btn btn-secondary" id="cancel_btn" >취소</button>
              <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#productModal" >상품 태그</button>
              <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >이미지 수정</button>
              <button class="btn btn-primary" id="update_btn" >수정하기</button>
            </span>

        </div>
        
      
      
      </div>



      </div>
    </div>
  </main>

  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

  <!-- modal 부분 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="uploadForm" >
            <input type="file" name="image" multiple="multiple" accept=".png, .jpg, .jpeg"/>
          </form>
          <input type="hidden" id="img_update" value="false">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="modal_close" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="img_modify_dtn">업로드</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header flex-column">
          <h1 class="modal-title fs-5" id="exampleModalLabel">관련상품을 선택해주세요</h1>
          <p class="m-0" id="product_has">
            <c:if test="${content.prono==0}">
              선택된 상품이 없습니다
            </c:if>
            <c:if test="${content.prono!=0}">
              상품이 선택된 상태입니다.
            </c:if>
          </p>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" >
          <input type="hidden" id="product_update" value="false">
          <input type="hidden" id="product_no" value="null">
          <div id="productlist" style="min-height: 200px;">
          </div>
          <div class="d-flex justify-content-center my-2">
            <input type="text" id="search_keyword" class="ms-2">
            <button type="button" id="search_btn" class="btn btn-primary btn-sm ms-1" >검색</button>  
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="product_modal_close" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-secondary" id="product_remove_btn" >삭제</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>