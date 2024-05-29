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
  <title>SSJA</title>
 
</head>

<body>
  <script>
 
	  
  let reject = confirm("소셜 로그인 유저는 마이페이지를 이용하실 수 없습니다. \n 회원으로 가입하시겠습니까?");
  
  if(reject){
	  
	  window.location.href="/test/sign_up_before";
 	 }else{
 		 
	  window.location.href="/home";
 		 
 	 }
  

  </script>

</body>

</html>