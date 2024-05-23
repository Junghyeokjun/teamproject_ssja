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
 <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <style>
    @font-face {
      font-family: 'fonts';
      src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css") fotmat('font1');
    }

    body {
      font-family: 'fonts', NanumSquare;
      background-color: #f7f0e8;
    }

    textarea{
        resize: none;
    }
    
   </style>
   
  
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column" style="margin-top:10%;">
        <a href="${pageContext.request.contextPath}/"><img src="/images/utilities/big_logo.png" alt=""></a>
        <form id="change_password_form"action="" method="get">
        <div class="d-flex felx-row justify-content-center align-items-center">
        <div>
       <div id="text-pass" style="margin-top:20px;"> 현재 비밀번번호 : </div>
       <div id="text-pass" style="margin-top:20px;">   변경 비밀 번호 :</div>
       <div id="text-pass" style="margin-top:20px;">  재확인 비밀 번호 : </div> 
        </div>
        <div>
        <div id="password-now" class="d-flex flex-row">
      <input type="password" id="current_password"class="mx-3"style="margin-top:20px;">
        </div>
   <input type="password" id="first_change_password"class="mx-3"style="margin-top:20px;"><br>
 <input type="password" id="second_change_password"class="mx-3"style="margin-top:20px;">
        <input type="hidden" name="_csrf" value="{{_csrf.token}}" /> 
        </div>
        </div>
        <div id="button_dv" class="my-3 d-flex flex-row justify-content-center align-items-center">
        <button type="submit" id="change_password_submit"class="btn btn-dark mx-1" style="width:100px; height:50px;">변경하기</button>
<a href="${pageContext.request.contextPath}/myPage" class="mx-1 btn btn-secondary btn-lg align-items-center justify-content-center" style="background-color:#aaa; border:none; width:100px; height:50px; display:flex; align-items:center; justify-content:center;">취소</a>
        </div>
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
</body>
<script>


let checkValue = function(){
	let $fcp = $("#first_change_password").val();
	let $scp = $("#second_change_password").val();
	if ($fcp == $scp){
		return true;
	}
	alert('변경 비밀 번호가 다릅니다.');
	$fcp.text("");
	$scp.text("");
	
	return false;
}

//csrf추가
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
console.log(token);
console.log(header);
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$("#change_password_form").on('submit', function(event){
    event.preventDefault(); 
    if (!checkValue()) {
        return;
    }
    
    console.log("제출함");
    let password_change_val = {
        currentPassword: $("#current_password").val(),
        newPassword: $("#first_change_password").val()
    };

    $.ajax({
        type: "post",
        url: "/user/password-change",
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json",
        data: JSON.stringify(password_change_val),
        success: function(response) {
            alert("비밀번호 변경이 완료되었습니다.\n 다시 로그인해주시길 바랍니다.");
            window.location.href = "/login";
        },
        error: function() {
            alert("기본 비밀 번호가 틀렸습니다.");
        }
    });
});

</script>
</html>