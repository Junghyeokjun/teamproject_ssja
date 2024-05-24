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
        //csrf토큰 변수
        var header = $("meta[name='_csrf_header']").attr('content');
        var token = $("meta[name='_csrf']").attr('content');
        

        $(document).ready(function(){
            let sign_up_form=$("#sign_up_form");
            let id=$("#id");
            let id_check=$("#id_check");
            let id_limit=$("#id_limit");
            let password=$("#password");
            let password_check=$("#password_check");
            let password_limit=$("#password_limit");
            let nickname=$("#nickname");
            let nickname_check=$("#nickname_check");
            let nickname_limit=$("#nickname_limit");
            let email=$("#email");
            let domain=$("#domain");
            let domain_select=$("#domain_select");
            let send=$("#send");
            let auth=$("#auth");
            let auth_check=$("#auth_check");
            let name=$("#name");
            let tel=$("#tel");
            let birth=$("#birth");
            let post=$("#post");
            let address=$("#address");
            let detail_address=$("#detail_address");
            let sign_up=$("#sign_up");
            let post_search_btn=$("#post_search_btn");
            let random;

            //이메일 인증번호 전송 메서드
            
            function email_auth(){
                $.ajax({    type : 'GET',         
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },  
                    url : '/testrest/emailAuth',
                    async : true,
                    headers : { 
                        "Content-Type" : "application/json; charset:UTF-8" },
                    dataType : 'text',
                    data :{
                                email : email.val()+"@"+domain},    
                    success : function(result) {
                        console.log(result);
                            if(result=="true"){
                                id_limit.text("중복되지 않은 아이디입니다.").css("color","blue")
                            }else{
                                id_limit.text("중복된 아이디입니다.").css("color","red")
                            }
                        },    
                    error : function(request, status, error) {
                       console.log(error)    }
                })
            }
            


            
            //아이디 중복여부 확인
            id_check.on("click",function(){
            	$.ajax({    type : 'GET',         
                            beforeSend: function(xhr){
                              xhr.setRequestHeader(header, token);
                            },  
   						    url : '/testrest/idCheck',
   						    async : true,
   						    headers : { 
   						    	"Content-Type" : "application/json; charset:UTF-8" },
   						    dataType : 'text',
   						    data :{
										id : id.val()},    
							success : function(result) {
                                console.log(result);
                                    if(result=="true"){
                                        id_limit.text("중복되지 않은 아이디입니다.").css("color","blue")
                                    }else{
                                        id_limit.text("중복된 아이디입니다.").css("color","red")
                                    }
                                },    
							error : function(request, status, error) {
								 console.log(error)    }})
            })
            //아이디 변경시 중복여부 확인 초기화
            id.on("keyup",function(){
                id_limit.text("ㅤ")
            })
            //패스워드확인 일치여부 확인과 패스워드 규약에 맞는지 확인
            password.on("keyup",function(){
                //패스워드에 규약을 부여할시 들어갈 함수

                if(password.val()===password_check.val()){
                    password_limit.text("패스워드가 일치합니다.").css("color","blue")
                }else{
                    password_limit.text("패스워드가 동일하지 않습니다.").css("color","red")
                }
            })
             //닉네임 중복여부 확인
             nickname_check.on("click",function(){
                //닉네임 중복확인 함수
                $.ajax({    type : 'GET',         
                            beforeSend: function(xhr){
                              xhr.setRequestHeader(header, token);
                            },  
   						    url : '/testrest/nickNameCheck',
   						    async : true,
   						    headers : {
   						    	"Content-Type" : "application/json; charset:UTF-8" },
   						    dataType : 'text',
   						    data :{
                                    nickName : nickname.val()},    
							success : function(result) {
                                console.log(result);
                                    if(result=="true"){
                                        nickname_limit.text("중복되지 않은 닉네임입니다.").css("color","blue")
                                    }else{
                                        nickname_limit.text("중복된 닉네임입니다.").css("color","red")
                                    }
                                },    
							error : function(request, status, error) {
								 console.log(error)    }})
            })
            //닉네임 변경시 중복여부 확인 초기화
            nickname.on("keyup",function(){
                nickname_limit.text("ㅤ")
            })
            //패스워드확인 일치여부 확인
            password_check.on("keyup",function(){
                if(password.val()===password_check.val()){
                    password_limit.text("패스워드가 일치합니다.").css("color","blue")
                }else{
                    password_limit.text("패스워드가 동일하지 않습니다.").css("color","red")
                }
            })
            //도메인셀렉트박스의 값이 바뀔시
            domain_select.on("change",function(){
                if(domain_select.val()==="직접입력"){
                    domain.val("").removeAttr("readonly");
                }else{
                    domain.val(domain_select.val()).attr("readonly","readonly");
                }
            })
            //전송버튼 클릭시
            send.on("click",function(){
                if(email.val()=="" || domain.val()==""){
                    alert("올바른 이메일 형식을 입력해주세요");
                    return;
                }
                $.ajax({    type : 'GET',         
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },  
                    url : '/testrest/emailCheck',
                    async : true,
                    headers : {
                        "Content-Type" : "application/json; charset:UTF-8" },
                    dataType : 'text',
                    data :{
                            email : email.val()+"@"+domain.val()},    
                    success : function(result) {
                        console.log(email.val()+"@"+domain.val());
                            if(result=="false"){
                                window.alert("이미 가입된 이메일 입니다.");
                            }else{

                                if(send.val()==="전송"){
                                    send.val("재전송");
                                }
                                send.attr("disabled","disabled")
                                setTimeout(function(){
                                    send.removeAttr("disabled");
                                }, 5000)
                            }
                        },
                    error : function(request, status, error) {
                            console.log(error)    }})

            })
            //인증버튼 클릭시
            auth.on("click",function(){
                //랜덤값과 인증값 비교함수

                //인증이 성공했을시
                email.attr("readonly","readonly");
                domain.attr("readonly","readonly");
                domain_select.attr("disabled","disabled")
                auth_check.text("인증이 완료되었습니다.").css("color","blue")
            })
            post_search_btn.on("click",function(){
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("extra_address").value = extraAddr;
                        
                        } else {
                            document.getElementById("extra_address").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('post').value = data.zonecode;
                        document.getElementById("address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("detail_address").focus();
                    }
                }).open();
            })

            // 유효성검사
            sign_up.on("click",function(){
                if(id.val()===""){
                    alert("id를 입력해주세요.");
                    id.focus();
                }else if(id_limit.text()==="ㅤ"){
                    alert("아이디 중복확인을 완료해주세요")
                    id.focus();
                }else if(id_limit.text()==="중복된 아이디입니다."){
                    alert("중복되지 않은 아이디를 사용해주세요");
                    id.focus();
                }else if(password.val()===""){
                    alert("패스워드 입력을 완료해주세요")
                    password.focus();
                }else if(password_check.val()===""){
                    alert("패스워드 확인을 입력해주세요")
                    password_check.focus();
                }else if(nickname.val()===""){
                    alert("닉네임을 입력해주세요.");
                    nickname.focus();
                }else if(nickname_limit.text()==="ㅤ"){
                    alert("닉네임 중복확인을 완료해주세요")
                    nickname.focus();
                }else if(nickname_limit.text()==="중복된 닉네임입니다."){
                    alert("중복되지 않은 닉네임를 사용해주세요");
                    nickname.focus();
                }else if(password_limit.text()==="패스워드가 동일하지 않습니다."){
                    alert("동일한 패스워드를 입력해주세요")
                    password_check.focus();
                }else if(email.val()===""||domain.val()==""){
                    alert("이메일 입력을 완료해주세요")
                    email.focus();
                }else if(auth_check.text()==="인증을 진행해주세요"){
                    alert("이메일 인증을 완료해주세요")
                }else if(tel.val()===""){
                    alert("전화번호 입력을 완료해주세요.")
                    tel.focus();
                }else if(name.val()===""){
                    alert("이름 입력을 완료해주세요.")
                    name.focus();
                }else if(birth.val()===""||birth.val().length!=6){
                    alert("생년월일 입력을 완료해주세요.")
                    birth.focus();
                }else if(post.val()===""){
                    alert("우편번호를 입력해주세요")
                    post.focus();
                }else if(address.val()===""){
                    alert("주소를 입력해주세요")
                    address.focus();
                }else if(detail_address.val()===""){
                    alert("상세주소를 입력해주세요")
                    detail_address.focus();
                }else{
                    sign_up_form.removeAttr("onsubmit");
                    sign_up_form.submit();
                }

            })

        })

   </script>
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column">
        <!-- 홈화면링크 -->
        <a id="logo_toHome" href=""><img src="/images/utilities/big_logo.png" alt=""></a>
        <!-- 실제 적용시 method post로 변경  -->
        <form action="${pageContext.request.contextPath}/testrest/signUp" method="post" onsubmit="return false" id="sign_up_form">
            <table>
                <tr>
                    <td><p>아이디</p></td>
                    <!-- dto와 name을 맞춰준다. -->
                    <td><input type="text" size="24" id="id" name="M_ID" placeholder="몇자이상의 아이디를 입력해주세요"></td>
                    <td><input type="button"value="중복확인" id="id_check"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p style="font-size: 10px;"class="mb-0" id="id_limit">ㅤ</p></td>
                </tr>
                <tr>
                    <td><p class="mb-1">비밀번호</p></td>
                    <td><input type="password" size="24" class="mb-1" id="password" name="M_PW" placeholder="특정 규약에 맞춰 패스워드를 입력해주세요"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인ㅤ</td>
                    <td><input type="password" size="24" id="password_check" placeholder="동일한 패스워드를 입력해주세요"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p style="font-size: 10px;" class="mb-0" id="password_limit">ㅤ</p></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" size="24" id="nickname" name="M_NICKNAME" placeholder="중복되지 않은 닉네임을 입력해주세요"></td>
                    <td><input type="button"value="중복확인" id="nickname_check"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p style="font-size: 10px;"class="mb-0" id="nickname_limit">ㅤ</p></td>
                </tr>
                <tr>
                    <td><p class="mb-1">이메일</p></td>
                    <td>
                        <!-- 서버에서 둘을 합쳐 이메일로 구분 -->
                        <input type="text" size="8" class="mb-1" id="email" name="email"> @
                        <input type="text" size="5" class="mb-1" id="domain"name="domain">
                    </td>
                    <td>
                        <select name="" id="domain_select" class="mb-1">
                            <option value="직접입력">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.com">hanmail.net</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>인증번호</td>
                    <td>
                        <input type="text" size="11" placeholder="인증번호를 입력해주세요"> 
                        <input type="button" value="전송" id="send">
                        <input type="button" value="인증" id="auth" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><p style="font-size: 10px;" class="mb-2" id="auth_check">ㅤ</p></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" size="24" class="mb-2" id="name" name="M_NAME"> 
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>
                        <input type="text" size="24" class="mb-2" id="tel" name="M_PHONE" placeholder="-를 제외한 전화번호를 입력해주세요"> 
                    </td>
                </tr>

                <tr>
                    <td><p class="mb-3">생년월일</p></td>
                    <td><input type="text" size="24" class="mb-3" id="birth" name="M_BIRTH" placeholder="ex)000000"></td>
                </tr>

                <tr>
                    <td><p class="mb-1">우편번호</p></td>
                    <td>
                        <input type="text" size="10" class="mb-1" id="post" name="M_ZIPCODE">
                        <input type="button" value="우편번호 찾기" class="mb-1" id="post_search_btn">
                    </td>
                </tr>
                <tr>
                    <td><p class="mb-1">주소</p></td>
                    <td><input type="text" size="24" class="mb-1" id="address" name="M_ADDRESS1"></td>
                </tr>                
                <tr>
                    <td><p class="mb-1">상세주소</p></td>
                    <td>
                        <input type="text" size="10" class="mb-1" id="detail_address" name="M_ADDRESS2">
                        <input type="text" size="6" class="mb-1" id="extra_address" name="extra_address">
                    </td>
                </tr>
                
            </table>
            
            <div class="text-center mt-3">
                <input type="submit" class="btn btn-dark me-3" id="sign_up" value="회원가입">
                <a href="${pageContext.request.contextPath}/"><input type="button" class="btn" value="취소" style="background-color: #bec1c4; color: white;"></a> 
                <!-- 홈화면링크 -->
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
</body>
</html>