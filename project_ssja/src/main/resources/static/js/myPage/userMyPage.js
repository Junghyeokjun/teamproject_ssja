	/*
	 $.ajax({
	 type : `http method type`,
	 url : `url`,
	 data : `서버에 전송할 데이터`,
	 contentType : "전송할 데이터 타입",
	 //기본 값 : "application / x-www-form-urlencoded; charset = UTF-8"  
	 dataType : '서버로 부터 수신할 데이터 타입',
	 //아무것도 지정하지 않으면 jQuery는 응답의 MIME 유형을 기반으로 해석을 시도
	 error : `에러 발생시 수행할 함수`,
	 success : `성공시 수행할 함수`
	}); 
	 */
	
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	let email_auth_code='00000000';
	const withdrawl_comment = '회원을 탈퇴하시면 계정이 삭제 되며 내가 쓴글, 구매내역, 리뷰, 채팅 등 모든 정보가 삭제됩니다.<br>' 
		+'계정 삭제 후 7일 간에 유보기간이 주어지며, 유보기간 동안 마이페이지 > 회원정보로 오셔서 탈퇴 취소를 누르시면 다시 회원으로 지내실 수 있습니다.';
		let $modi_email_auth_btn = $("<button>");
		let $modi_email_change_btn = $("<button>").css("width",'90px');
		
		
		  function openCenteredWindow(url, width, height) {
	            const screenWidth = $(window).width();
	            const screenHeight = $(window).height();

	            const left = (screenWidth / 2) - (width / 2);
	            const top = (screenHeight / 2) - (height / 2);

	            window.open(url, '_blank', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
	        }
		

	let myPageUserInfo = function() {
		
		$.ajax({
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					url : "/user/info", // 정적인 URL 사용
					dataType : "json", // 받을 데이터의 유형 지정
					success : function(data) {
						const userInfo = data;
						console.log(userInfo);
						let $h2title = $("<h2>").attr('id','myPageTitle').text("회원 정보");
						let $myPageContent = $("#MyPage_content_container").removeClass().empty();
						let $myPageTitle = $("#MyPage_content_name");
						$myPageTitle.empty().append($h2title);
						//탈퇴 유보 기간에 속할 경우 보여질 부분
						/*
						if(userInfo.m_deletedate !== null){
							
							return
						}*/

						let $userInfo_dv1 = $("<div>").attr("id",
								"userInfo_dv1").addClass("w-100 my-3 mx-3");
						let $userInfo_name = $("<h2>").css("font-weight",
								"bold").text(userInfo.m_NickName);
						let $userInfo_txt1 = $("<span>").text('님의 등급은');
						let $userInfo_grade = $("<h2>").css("font-weight",
								"bold").text(userInfo.m_Grade);
						let $userInfo_txt2 = $("<span>").text('입니다.');

						$userInfo_dv1.css({'margin-top':'2em','margin-bottom':'2em'}).append($userInfo_name, $userInfo_txt1,
								$userInfo_grade, $userInfo_txt2);

						let $userInfo_dv2 = $("<div>").attr("id",
								"userInfo_dv2").addClass(" my-3 mx-3").css(
								"background-color", "#eee");
						let $userInfo_orders = $("<div>").attr("id",
								"userInfo_orders").append($("<h4>").text("구매"),
								$("<span>").text(userInfo.countPurchase)).on('click',function(){
									 openCenteredWindow('https://www.naver.com', 800, 550);
								});
						let $userInfo_wishs = $("<div>").attr("id",
								"userInfo_wishs").append(
								$("<h4>").text("위시리스트"),
								$("<span>").text(userInfo.countWish));
						let $userInfo_points = $("<div>").attr("id",
								"userInfo_points").append(
								$("<h4>").text("포인트"),
								$("<span>").text(userInfo.m_Point));
						let $userInfo_coupons = $("<div>").attr("id",
								"userInfo_coupons").append(
								$("<h4>").text("쿠폰"),
								$("<span>").text(userInfo.countCoupon));

						$userInfo_dv2.append($userInfo_orders, $userInfo_wishs,
								$userInfo_points, $userInfo_coupons);
						
						$userInfo_dv2.children("div").hover(function() {
						    $(this).css("cursor", "pointer");
						},
						function(){
						    $(this).css("cursor", "auto");
						})

						let $password_title = $("<h4>").addClass("mx-5 my-3")
								.text("비밀 번호 ");
						let $modify_password = $("<a>").attr("href",
								"/myPage/password/change")
								.addClass("btn btn-dark").text("변경하기").on('click',function(){
									if(userInfo.auth === 'social'){
										  let reject = confirm("소셜 로그인 유저는 비밀번호를 변경하실 수 없습니다. \n 회원으로 로그인하시겠습니까?");
										  if(reject){
											 
											$(this).attr('href','/login');
										 	 }else{
											  return false;
										 	 }
							    	}
								});
						
						let $userInfo_dv3 = $("<div>")
								.attr("id", "userInfo_dv3")
								.css("border-top", "1px solid #cccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($password_title, $modify_password);

						let $email_title = $("<h4>").addClass("mx-5 my-3")
								.text("이메일");
						
						let $userInfo_email = $("<input>").attr("type","email").addClass("mx-1").attr("id","modi_email_input")
						.val(userInfo.m_Email).prop("disabled",true);
						
						let $email_change_btn = $("<button>").addClass("btn btn-dark").text("변경");
						let $email_auth_input = $("<input>").attr("id","email_auth_input").css('width','6em');
						
						let $modi_email_btn = $("<button>") .attr("id", "modify_email_btn").addClass("btn btn-dark mx-3")
					    .text("수정").on('click', function() {
					    	$email_change_btn.remove();
					    	$email_auth_input.remove();
					    	
					    	
					        $userInfo_email.prop('disabled', false).focus();
					        $userInfo_dv4.append($email_auth_input, $email_change_btn.on('click',function(){
								
								if(email_auth_code !== $email_auth_input.val()){
									return;
									}
								request_email_change();
							}));
					        $(this).removeClass("btn-dark").addClass("btn-outline-secondary").text("인증").on('click',function(e){
					        	if(userInfo.m_Email === $userInfo_email.val()){
						    		alert('변경 이메일과 기존 이메일이 같습니다.');
						    		return false;
						    	}
						    	
					        	$(this).addClass("btn-secondary");
					        	$email_auth_input.focus();
					        	
					        	request_email_auth();
					        });
					        
					    });
						
						
						let $userInfo_dv4 = $("<div>")
								.attr("id", "userInfo_dv4")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($email_title, $userInfo_email,$modi_email_btn
										);

						let $address_title = $("<h4>").addClass("mx-5 my-3")
								.text("배송지");
						let $userInfo_address1 = $("<div>")
								.attr("id", "your_address")
								.addClass('mx-5')
								.html(
										'우편번호 : <input type="text" id="zip_code" name="zip_code" value="' + userInfo.m_ZipCode + '"><br>' +
									    '주소 : <input type="text" id="address" name="address" style="width:100%;" value="' + userInfo.m_Address1 + '"><br>' +
									    '상세 : <input type="text" id="extra_address" name="extra_address" style="width:70%;" value="' + userInfo.m_Address2 + '"><br>' +
									    '<input type="hidden" id="address_detail" name="detail"><br>'

								);
						let $chang_address_btn = $("<button>").attr("id",
								"chang_address_btn").addClass(
								"btn btn-dark m-3").text("변경").on('click',function(){
									change_address();
								});
						let $modify_address = $("<button>").attr("id",
								"address_modify_btn").addClass("btn btn-dark")
								.text("조회").on('click', function() {
									search_address();
								});

						let $userInfo_dv5 = $("<div>")
								.attr("id", "userInfo_dv5")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($address_title, $userInfo_address1,
										$modify_address, $chang_address_btn);

						let $phone_title = $("<h4>").addClass("mx-5 my-3")
								.text("전화 번호 ");
						let $user_phone_info = $("<div>").addClass("py-2 px-4").css('background-color','#eee').text(formatterphone(userInfo.m_Phone));
						
						
						let $userInfo_dv6 = $("<div>")
								.attr("id", "userInfo_dv6")
								.css("border-top", "1px solid #ccc")
								.addClass(
										"py-3 my-3 mx-3 d-flex flex-row align-items-center")
								.append($phone_title, $user_phone_info);

						let $withdrawl_title = $("<h4>").addClass("mx-5 my-3").text("회원 탈퇴");
						
						let $withdrawl_btn = $("<button>").attr('id','withdrawl_btn').addClass("btn btn-outline-danger").text('탈퇴하기').on('click',function(){
							$("#wd_detail_dv1").empty();
							
							let $wd_detail_1 = $("<h4>").text(userInfo.m_NickName+'님과 이별인가요? 너무 아쉬워요')
							.css('font-weight','bold').addClass("my-3").appendTo($wd_detail_dv1);
							
							
							let $wd_detail_2 = $("<div>").addClass("mx-5").html(withdrawl_comment).appendTo($wd_detail_dv1);
							
							let $wd_detail_3 = $("<input>").addClass("my-3").attr("type","checkbox").attr('id',"withdrawl_check").appendTo($wd_detail_dv1);
							
							let $wd_detail_4 = $("<p>").text("위에 대해 확인하였고 탈퇴하겠습니다.").appendTo($wd_detail_dv1);
							let $wd_detail_5 = $("<div>").addClass("d-flex flex-row my-3 justify-conten-center align-items-center").appendTo($wd_detail_dv1);
							
							let $delete_ok_btn = $("<button>").addClass('btn btn-dark mx-1').text('탈퇴').on('click',function(){
								 if($wd_detail_3.is(':checked')===false){
										$wd_detail_6.text('확인란에 체크해 주시길 바랍니다.');
										return ;
									} 
									 $.ajax({
											type : "delete",
											beforeSend : function(xhr) {
												xhr.setRequestHeader(header, token);
											},
											url : "/user",
											success : function(data){
												alert('삭제 되었습니다.');
											},
											error : function(data){
												alert('에러 발생');
											}
										})
									
								});
							let $delete_no_btn = $("<button>").addClass("btn btn-outline-secondary mx-1").text('취소').on('click',function(){
								$wd_detail_dv1.empty();
							});
							
							$wd_detail_5.append($delete_ok_btn,$delete_no_btn);
							
							let $wd_detail_6 =$("<div>").addClass('text-center').css('color','red').appendTo($wd_detail_dv1);
						}
						);
						let $withdrawl_main = $("<div>").addClass("d-flex flex-row align-items-center")
						.attr("id","withdrawl_main").css("display","flex").append($withdrawl_title,$withdrawl_btn );
							let $wd_detail_dv1 = $("<div>").addClass("d-flex flex-column align-items-center justify-content-center")
							.attr("id","wd_detail_dv1").css("widh","90%");
						
						let $userInfo_dv7 = $("<div>")
						.attr("id", "userInfo_dv7")
						.css("border-top", "1px solid #ccc")
						.addClass(
								"py-3 my-3 mx-3 d-flex flex-column justify-content-center").append($withdrawl_main,$wd_detail_dv1);
						
						
						$myPageContent.append($userInfo_dv1, $userInfo_dv2,
								$userInfo_dv3, $userInfo_dv4, $userInfo_dv5,
								$userInfo_dv6,$userInfo_dv7);

					}
				});
	};


	let change_address = function() {
		
		if($("#extra_address").val() == null || $("#extra_address").val() == ""){
			alert("상세주소를 입력해주세요.");
			return;
		}
		let address_data = {
			zip_code : $("#zip_code").val(),
			address : $("#address").val(),
			extra_address : $("#extra_address").val()
		};

		$.ajax({
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			data : JSON.stringify(address_data),
			contentType : "application/json",
			url : "/user/address",
			dataType : "json",
			success : function(data){
				alert('주소가 변경되었습니다');
				myPageUserInfo();
			}
		})
	}
	
	let request_email_auth = function() {
	    $.ajax({
	        type: "post",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			  data: JSON.stringify({'receiver': $("#modi_email_input").val()}),
	        contentType: "application/json",
	        url: "/user/email/auth",
	        success: function(data) {
	        	console.log(email_auth_code);
	        	
	            alert('해당 이메일로 인증번호를 전송하였습니다. \n 인증을 완료해주세요.');
	            email_auth_code = data.authNum;
	            console.log(email_auth_code);
	        }
	    });
	};
	let request_email_change = function() {
	    $.ajax({
	        type: "PATCH",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			//async:false,
		    data: $("#modi_email_input").val(),
	        contentType: "application/json",
	        url: "/user/email",
	        success: function(data) {
	        	alert('이메일이 변경되었습니다.');
	        	myPageUserInfo();
	        }
	    });
	};

	let search_address = function() {

		console.log('눌림');

		new daum.Postcode({
			onComplete : function(data) {
				let addr = ''; // 주소 변수
				let extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				if (data.userSelectedType == 'R') {
					/* if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += databname;
					} */
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("extra_address").value = extraAddr;
				} else {
					document.getElementById("extra_address").value = '';
				}
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("address").value = addr;

				document.getElementById("extra_address").focus();
			}
		}).open();
	}

	$("#myPage_userInfo_Select").on('click', function() {
		if($("#myPageTitle").text() === '회원 정보')return false;
		myPageUserInfo();
	});

					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });
    
    let formatterphone = function(phoneNum){
    	if(phoneNum.length === 11){
    		  let p1 = phoneNum.substring(0, 3);
    		    let p2 = phoneNum.substring(3, 7);
    		    let p3 = phoneNum.substring(7, 11);
    		    
    		    return p1+'-'+p2+'-'+p3;
    	}
    	return phoneNum;
    }
    $("#go_qna").on('click', function(){
    	window.location.href="/board/list/20";
    })
    $("vendor_apply").on('click', function(){
    	window.location.href="/vender/list/20";
    })
    