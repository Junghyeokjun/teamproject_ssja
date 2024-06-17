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

    textarea{
        resize: none;
    }
    
   </style>
   
   <script>
        var header = $("meta[name='_csrf_header']").attr('content');
        var token = $("meta[name='_csrf']").attr('content');
        $(document).ready(function(){        
            let modify_btn = $("#modify_btn");
            let term1 = $("#terms1");
            let term2 = $("#terms2");


            modify_btn.on("click",function(){
                $.ajax({
                type : 'POST',
                url : '/sign/terms_modify',
                async : false,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                contentType:"application/json",
                dataType : 'text',
                data :JSON.stringify({
                    term1 : term1.val(),
                    term2 : term2.val()
                }),    
                success : function(result) {
                    location.reload(true);
                },    
                error : function(request, status, error) {
                    alert(error);
                }
                })
            })
        })

    
   </script>
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column">
        <!-- 홈화면링크 -->
         <a id="logo_toHome" href="/"><img src="/images/utilities/big_logo.png" alt=""></a>

        <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="principal"/>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">    
            ${principal.userInfo.auth}
        </sec:authorize>
         <form action="${pageContext.request.contextPath}/sign/terms_modify" method="post">
            <table>
                <tr>
                    <td colspan="2">
                        <textarea id="terms1" cols="50" rows="10">${term1}</textarea>
                    </td>
                </tr>        
 
                <tr>
                    <td colspan="2">
                        <textarea id="terms2" cols="50" rows="10">${term2}</textarea>
                    </td>
                </tr>

            </table>
            <div class="text-center mt-3">
                <input type="button" class="btn btn-dark me-3" id="modify_btn" value="수정" >
                <a href="${pageContext.request.contextPath}/"><input type="button" class="btn" value="취소" style="background-color: #bec1c4; color: white;"></a> 
                <!-- 홈화면링크 -->
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
</body>
</html>