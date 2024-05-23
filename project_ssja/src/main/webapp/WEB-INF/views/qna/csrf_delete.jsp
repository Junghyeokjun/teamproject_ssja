<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<script type="text/javascript">
// ajax 요청시 사용할 csrf 글로벌 변수설정
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
</script>

<script type="text/javascript">
$(document).ready(function (){
   
    function deleteBoard(id){
       
      $.ajax({
         type:"DELETE",
         url: "/boards/" + id,
         success: function(result){
            console.log(result);
         },
           beforeSend : function(xhr){
               //ajax호출 중 처리
               //글로벌 변수로 설정한 csrf token 셋팅
               xhr.setRequestHeader(header,token);
           },
         error: function(e){
            console.log(e);
         }
      });
    }
   
    deleteBoard(1082);
   
});
</script>

</head>
<body>

</body>
</html>