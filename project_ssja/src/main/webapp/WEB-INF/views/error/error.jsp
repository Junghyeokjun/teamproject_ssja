<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
      </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    
    .errorImage {
    	width : 120px;
    	height : 120px;
    	content: url("/images/error/ErrorImage.png");
    	margin-right: 100px
    }
    
    #errorTemplate{
    	width: 50%
    }
    
    
    @media screen and (max-width: 880px) {
        .errorImage {
            display: none;
        }
    }
    
    @media screen and (max-width: 770px) {
    	#errorTemplate{
    		width : 100%;
    	}
    }
   </style>
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column">
    	<div class="main_whitespace p-5 my-2">
    	</div>
       	<div id="errorTemplate" class="text-center rounded bg-light p-5">
			<h1 class="h1 text-success">에러가 발생했습니다.</h1>
			<div id="errorContainer" class="d-flex align-items-center justify-content-center mb-3 " >
				<img class="errorImage" alt="Error Image">			
				<div class="text-success">
    				<p class="text-success" style="font-size: 4em; margin: 0 auto; font-weight: bold;">${statusCode}</p>
    				<p class="text-success" style="font-size: 1em; ">${errorMessage}</p>
    			</div>
    		</div>
    		<a href="/" class="btn btn-success">메인화면으로 돌아가기</a>       	
       	</div>    
     </div>
     <script>
     $(document).ready(function() {
         function checkWindowSize() {
             if ($(window).width() <= 880) {
                 $('.errorImage').remove();
             } else {
                 if ($('#errorContainer').find('.errorImage').length === 0) {
                     $('#errorContainer').prepend('<img class="errorImage" alt="Error Image">');
                 }
             }
         }

         // 초기 체크
         checkWindowSize();

         // 윈도우 리사이즈 이벤트에 체크 함수 연결
         $(window).resize(checkWindowSize);
     });
     </script>
</body>
</html>
