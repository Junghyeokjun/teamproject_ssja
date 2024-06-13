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
    


  </style>
  <script>
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
    history.replaceState({}, null, location.pathname);
    $(document).ready(function(){

      let img_update=$("#img_update");
      let content=$("#content");

      let insert_btn=$("#insert_btn");
      let img_insert_dtn=$("#img_insert_dtn");
      let cancel_btn= $("#cancel_btn");

      let m_no_val=$("#m_no").val();
      let m_NickName_val=$("#m_NickName").val();
      let randomNum=(new Date().getTime());
    
      
      cancel_btn.on('click',function(){
        $.ajax({
          type:'DELETE', 
          url: '/community/tempImg/'+randomNum,
          dataType: 'text',
          success: function(data) {

          },
          error: function(e) {
            alert("error:" + e);
          }          
        });
        location.href="/community/main";

      })

      img_insert_dtn.on('click',function(){
        var form=$("#uploadForm")[0];
        var formData=new FormData(form);
        
        $.ajax({
          type:'post', 
          enctype:"multipart/form-data", // 업로드를 위한 필수 파라미터
          url: '/community/content/tempImg/'+randomNum,
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
              $("#update_content").css("min-height","30px");
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
      insert_btn.on("click",function(){
        var title=$("#title").val();
        var content=$("#update_content").text();
        var bno;
        $.ajax({
          type : 'POST',
          url : '/community/post',
          async : false,
          beforeSend: function(xhr) {
              xhr.setRequestHeader(header, token);
          },
          contentType:"application/json",
          dataType : 'text',
          data :JSON.stringify({
            title : title,
            content : content,
            category : 40,
            writer : m_NickName_val,
            mno : m_no_val
          }),    
          success : function(result) {
            bno=result;
          },    
          error : function(request, status, error) {
            alert(error);
          }
        })


        var form=$("#uploadForm")[0];
        var formData=new FormData(form);

        $.ajax({
          type:'post', 
          enctype:"multipart/form-data", // 업로드를 위한 필수 파라미터
          url: '/community/content/img/'+bno,
          data: formData,
          processData: false,   // 업로드를 위한 필수 파라미터
          contentType: false,   // 업로드를 위한 필수 파라미터
          success: function(data) {

          },
          error: function(e) {
            alert("error:" + e);
          }
        });
        
        $.ajax({
            type:'DELETE', 
            url: '/community/tempImg/'+randomNum,
            contentType: 'text',
            success: function(data) {
            },
            error: function(e) {
              alert("error:" + e);
            }
          });
        location.assign("/community/content/"+bno);
      })  
    })

  </script>
</head>

<body>

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
    <!-- <c:if test="${principal == null}">
        <script>
          location.href="/community/main"
        </script>
    </c:if> -->
  </header>

  <div id="side_bar"> 
    <div id="side_links" class="w-100"></div>
</div>

  <main>
    <div id="main_container" class="border-start border-end container">
        
      <div class="d-flex flex-column align-items-center mt-3 container-fluid">
        <input class="w-100 ps-3 py-2 mb-3 border-top border-bottom fs-3" id="title" style="border-right: 0px; border-left: 0px;"> 
        <div class="w-100 mb-3 d-flex flex-column align-items-center" id="content" style="min-height: 400px;" contentEditable >
          <div contentEditable="true" id="update_content" class="w-75" style="min-height: 400px;"></div>

        </div>
        <div class="ps-3 py-2 w-100 border-bottom d-flex flex-row justify-content-end">
          	<span>
              <button type="button" class="btn btn-secondary" id="cancel_btn">취소</button>
              <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >이미지 삽입</button>
              <button class="btn btn-primary" id="insert_btn" >글쓰기</button>
            </span>

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
          <button type="button" class="btn btn-primary" id="img_insert_dtn">업로드</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>