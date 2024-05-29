<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
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

   <style>

    
    body{
        font-family: "Noto Sans KR", sans-serif;
        background-color: #f7f0e8;
    }
   </style>
   <script>

    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');

        $(document).ready(function(){
            let find_id_btn=$("#find_id");
            let email=$("#email");
            let id=$("#id");
            find_id_btn.on("click",function(){
                console.log(email.val())
                $.ajax({
                    type : 'POST',      
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },  
                    url : '/sign/findPw',
                    async : false,
                    dataType : 'text',
                    data :{
                        email : email.val(),
                        id : id.val()
                    },    
                    success : function(result) {
                        alert("해당 이메일로 비밀번호 재설정링크를 전송하였습니다.");
                    },    
                    error : function(request, status, error) {
                        alert("에러가 발생하였습니다.")  
                    }
                })
                window.close();
            })
        })    
    
   </script>
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column vh-100">
        <!-- 홈화면링크 -->
        <a id="logo_toHome" href=""><img src="/images/utilities/big_logo.png" alt=""></a>
        <!-- 실제 적용시 method post로 변경  -->
        <br>
        <h3>이메일정보와 아이디를 입력해주세요</h3>
        <br>
        <input id="email" type="text" class="form-control mb-2" style="width: 300px;" placeholder="이메일">
        <input id="id" type="text" class="form-control" style="width: 300px;" placeholder="아이디">
        <br>
        <button id="find_id" class="btn btn-dark">비밀번호 찾기</button>
    </div>
</body>
</html>