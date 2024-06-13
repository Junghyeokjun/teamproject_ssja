<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <title>SSJA</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
   <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

  <script src="/js/vendorbarscript.js">

  </script>

  <script src="/js/footer.js">

  </script>
  <link href="/css/footerstyle.css?after" rel="stylesheet">
  <link href="/css/vendorbarstyle.css?after" rel="stylesheet">
  <link href="/css/board.css?after" rel="stylesheet">
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

	header, main, footer{
		height: auto;
		overflow : hidden;
	}
	
    #logo_img {
      width: 3.5em;
      height: 3em;
    }
    
  </style>
  <style>
    .MyPage_btn {
      background-color: white;
      padding: 20px;

    }

    #MyPage_point {
      margin-left: auto;
    }

    #select_dv {
    
      margin: 2em;
      height: auto;
    }

    #content_dv {
      width: 80%;
      margin: 2em;
    }
    #MyPage_content_name{
      background-color: #f7f0e8;
      padding:3em;
     
    }
    #MyPage_content_name > h1{
    
      font-weight: bold;
      margin-left: 1em;

    }
    #select_MyPage{
      z-index:900;
      position: fixed;
      top:30%;
      left:5%;
      width:12%;
    }
    #select_mp_top{
      background-color: #f7f0e8;
      padding: 2em;
      height: auto;

    }
    #userInfo_dv1{
    display:flex;
    flex-direction:row;
    align-items:center;
  
    }
    #userInfo_dv1 > h2 {
    margin-left:1em;
    margin-right:1em;
    }
    
    #userInfo_dv2{
    display:flex;
    flex-direction:row;
    justify-content:space-evenly;
    align-items:center;
  	height:auto;
    }

    #userInfo_dv2 > div{
    font-weight:bold;
    margin-top:1em;
    margin-bottom:1em;
    padding:5px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
     height:auto;
     width:100%;
    }
    #your_address > input{
    border:none;
    }
    
	/* vendorpage */
    .mx-2.m-auto.input-group-text{
    	width : 8em;
        line-height: 3em; /* 높이와 동일하게 설정하여 수직 중앙 정렬 */
    	text-align: center;
    	display: flex;
   		justify-content: center;
    }
    
    .mx-2.m-auto.input-group-text, .form-control{
    	height: 3em;
    }  
	
 
 
 	.file-container_ {
 		padding : 0;
 	}
	/* 기존 파일 형식 없애기 */
	.file-container_ input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	
	/* 커스텀 시작1 - label */
	.file-container_ label {
	  display: inline-block;
	  padding: .5em .75em;
	  color: #857474;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  
	  /* 줄바꿈되지 않게 하기. 한 줄로 표시 */
	  white-space: nowrap;
	}
	
	/* 파일 업로드명 */
	.file-container_ .file-upload-name_ {
		/* 가능한 공간을 모두 차지하게 설정 */
		flex-grow : 1;		
		display: inline-block;
		padding: .5em .75em; /* label의 패딩값과 일치 */
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
	  
		/* 브라우저의 기본 스타일 제거 -> 커스텀 스타일이 적용되도록 하기 */
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	.file-container_.custom-primary label {
		color: #ffffff;
		background-color: #8c20ca;
		border-color: #7d22b3;
	}
	
	.file-container_.custom-primary label:hover {
		color: #ffffff;
		font-weight:bold;
		background-color: #aa6bce;
		border-color: #a85cd4;
	}
	
	.upload-image_{
		display: none;
	}
	
	.btn-danger.btn-tuning{
		background-color: #962626;	
	}

	.btn-danger.btn-tuning:hover{
		background-color: #c43c3c;	
	}

	.vendorName {
		border-bottom: 5PX SOLID #222222;
		background-color: white;
		padding: 3px;
		border-radius: 15 15 15 15;
		margin: auto;	
	}
	
	.vendorTitle{
		padding-top: 3px; 
	}
	
	.top_btn{
		font-size : 2em;

	}
@media screen and (max-width: 860px){	
	.vendorTitle {
		display: none;
	}
	
}	
  </style>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal.auth" var="myAuth"/>
    	<c:choose>		
			<c:when test="${myAuth != 'ROLE_VENDOR'}">
			<!-- 권한이 판매자가 아닌 경우 -->
				<script>
					$(document).ready(function() {
		                alert("접근할 수 없습니다.");
		                window.location.href = "/";
		            });
				</script>
			</c:when>
		</c:choose>
    </sec:authorize>
	<sec:authorize access="isAnonymous()">
	    <script type="text/javascript">
	    	$(document).ready(function(){
				alert("해당 게시판에 접근하기 위해서는 로그인이 필요합니다.");
			 	window.location.href = "/login";
	    	});
		</script>
	</sec:authorize>	
	<header class="fixed-top">
		<div id="title_bar" >
			<div class="py-2 px-1 d-flex justify-content-between" id="top-bar">
				<button type="toggle-button" class="top_btn"></button>
				<div class="mx-5 my-2 d-flex ">
					<h1 class="h1 vendorTitle" >판매자 :&nbsp;</h1>
					<!-- 
						땡땡땡땡 : 상호명
						로그인 시 vendorDto에 담기는 vendor.vbizname 또한 가져오기						
						그냥 조인을 쓴다면 vendorDto가 아니라 조인한 결과를 담는 다른 Dto가 필요할 것이다.
					 -->
        			<h1 class="h1 vendorNames"> 
        				&lt;
        				<sec:authorize access="isAuthenticated()">
        					<sec:authentication property="principal.userInfo" var="vendorMember"/>
        				</sec:authorize>
        				<input type="hidden" id="vendorData" value="${vendorMember.m_No}">
        				${vendorMember.m_Name}
        				&gt;</h1>      			
        		</div>
				<a id="user_link"><img id="login_img"></a>
			</div>
		</div>
		<nav id="total_bar">
		</nav>
	</header>
	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
<!-- 	   
		<div id="select_MyPage" class="d-flex flex-column">
		    <div id="select_mp_top" class="text-center">판매자 페이지</div>
		    <div id="select_content">
		        <button class="MyPage_btn w-100" id="myPage_userInfo_Select" style="border:1px solid #cccccc">회원 정보</button>
		        <button class="MyPage_btn w-100" id="myPage_orderInfo_Select" style="border:1px solid #cccccc">상품 등록</button>
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">등록 상품 목록</button>		        
		        <button class="MyPage_btn w-100" style="border:1px solid #cccccc">문의 및 요청</button>
		    </div>
		</div>
 -->
  <main>
  	<div class="main_whitespace p-5 my-2">
		<h1 class="h3 text-center ">상품 등록</h1>
	</div>
    <div id="main_container" class="d-flex flex-row align-items-center justify-content-center" >      	
        <div id="MyPage_content_container" class="border p-5">
        	<form id="productAdd" action="${pageContext.request.contextPath}/vendor/product/add" method="post" autocomplete="off" encType="multipart/form-data">
				<div id="ProductCategory" class="p-2 input-group w-100">   
				   <label class="mx-2 m-auto input-group-text" >1차 분류</label>
				   <!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 한 자리 수 -->
				   <select id="mainCategory" class="form-select w-25 mx-2" >
				   	<option value=""></option>
				   	<c:forEach var="proCate" items="${pcMains}">
					 	<option value="${proCate.pcNum}">${proCate.pcSubName}</option>				  
					</c:forEach>	
				   </select>
				</div>
				<div id="ProductCategory2" class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" >2차 분류</label>
				   <!-- 상품 카테고리를 해당 페이지에 뿌려줘야 함 : 10으로 나눈 값이 한 자리 수인 경우 -->
				   <select id="subCategory" class="form-select w-25 mx-2" name="P_C_NO">
				   </select>
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsName">상품명</label>
				   <input type="text" id="proName" name="PRO_NAME" class="border form-control mx-2" />
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsPrice">상품가격</label>
				   <input type="number" id="proPrice" name="PRO_PRICE" class="border form-control mx-2"/>
				</div>
				
				<div class="p-2 input-group w-100">
				   <label class="mx-2 m-auto input-group-text" for="gdsStock">상품수량</label>
				   <input type="number" id="proQuantity" name="PRO_QUANTITY" class="border form-control mx-2"/>
				</div>
				
				<div class="input-group mt-2 p-2 w-100 border-secondary d-flex align-items-center border-top">
				    <label class="mx-2 m-auto input-group-text">배너 이미지</label>
 					<div class="file-container_ form-control custom-primary m-2 d-flex align-items-center">
			            <input id="bannerFileText" class="file-upload-name_" placeholder="파일을 선택하세요" disabled="disabled">			
			            <label for="bannerFile" >올리기</label> 
			            <input type="file" id="bannerFile" class="upload-image_" name="bannerFile"> 
			         </div>
				</div>
				<div class="input-group mt-2 p-2 w-100 border-secondary d-flex align-items-center border-top">					
				    <label class="mx-2 m-auto input-group-text">커버 이미지</label>
 					<div class="file-container_ form-control custom-primary m-2 d-flex align-items-center">
			            <input id="coverFileText" class="file-upload-name_" placeholder="파일을 선택하세요" disabled="disabled">			
			            <label for="coverFile" >올리기</label> 
			            <input type="file" id="coverFile" class="upload-images_" multiple="multiple" name="coverFile[]" >			        
			        </div>			        
				</div>
				<div class="input-group w-100 p-2">	
					<label class="mx-2 m-auto input-group-text"></label>
					<div class="form-control m-2 p-0 " style="height: auto">								
		        		<ul id="uploadedCoverFiles" class=" w-100 list-group">			        		
			        	</ul>
		        	</div>
		        </div>		
				<div class="input-group mt-2 p-2 w-100 border-secondary d-flex align-items-center border-top">					
				    <label class="mx-2 m-auto input-group-text">설명 이미지</label>
 					<div class="file-container_ form-control custom-primary m-2 d-flex align-items-center">
			            <input id="explainFileText" class="file-upload-name_" placeholder="파일을 선택하세요" disabled="disabled">			
			            <label for="explainFile" >올리기</label> 
			            <input type="file" id="explainFile" class="upload-images_" multiple="multiple" name="explainFile[]" >			        
			        </div>			        
				</div>
				<div class="input-group w-100 p-2">	
					<label class="mx-2 m-auto input-group-text"></label>
					<div class="form-control m-2 p-0 " style="height: auto">								
		        		<ul id="uploadedExplainFiles" class=" w-100 list-group">			        		
			        	</ul>
		        	</div>
		        </div> 
				<div class="p-2 w-100 border-secondary border-top d-flex justify-content-end">
				   <input type="submit" id="register_Btn" value="등록" class="btn btn-primary btn-tuning border mx-2">
				   <input type="button" id="cancel_Btn" class="btn btn-danger btn-tuning border mx-2" value="취소">
				</div>				
			</form>
      	</div>    
      </div>
    <div class="main_whitespace p-5 my-2">
		
	</div>
  </main>	
  <footer>
    <div id="first_footer" class="p-3"></div>
    <div id="second_footer"></div>
    <div id="third_footer"></div>
  </footer>

</body>
<script type="text/javascript">
	$(document).ready(function(){		
		
		// 메인 카테고리 작업 중
		
		// 선택된 메인 카테고리 값
		// option:selected를 사용하지 않으면 값이 출력되지 않는 상황이 발생. 
		// 이후로도 안되면, 다른 방식을 찾아봄.
		
		$('#mainCategory').on('change',function(){	
			let $mainCategoryValue = $('#mainCategory option:selected').val();
			console.log("$mainCategoryValue : " + $mainCategoryValue);
			$.ajax({
				type: "GET",
				url: "/api/vendor/category",          
				data: {'categoryNo' : $mainCategoryValue},
				success: function(response) {
					// 기존에 있는 자식 요소들을 제거하기. 해당 처리를 하지 않으면 서브 카테고리들이 중첩되어 추가됨.
					$('#subCategory').empty();
					// window.location.href="/";
					console.log(response);
					for(let i=0; i< response.length; i++){
						$('#subCategory').append($('<option>', {
					        value: response[i].pcNum,
					        text: response[i].pcSubName							
					    }));
					}
				},
				error: function(xhr, status, error) {
					console.log("가져오기 실패");
					alert("카테고리 1차 분류 목록을 선택하세요.");
					console.error(xhr.responseText);
				}
			});
		}); 
		
		let bannerFile = $('#bannerFile');
		let coverFile = $('#coverFile');
		let explainFile = $('#explainFile');
		let uploadedExplainFiles = $('#uploadedExplainFiles');
		
		// 파일 정보를 담는 files 속성을 담기 위한 배열 3가지
		let selectedBannerFiles = [];
		let selectedCoverFiles = [];
		let selectedExplainFiles = [];
		
		function fileImageOnly(file){
			if (!file.type.match("image/.*")) {
					alert("이미지 파일만 업로드하셔야 합니다.");
					return false; // 전체 로직 종료
			}else{
				return true;
			}
		}

		// 배너 이미지 경로 가져오기
		bannerFile.change(function(e){
		    let filename = "";
		    let files = e.target.files;
		    let bannerDeleteButton = $('<button></button>').addClass('btn font-weight-bold').text('X').attr('id','BnDelBtn');

		    if (files.length > 0) {
		    	let file = files[0];
		    	// if (!file.type.match("image/.*")) {
				// 	alert("이미지 파일만 업로드하셔야 합니다.");
				// 	return; // 전체 로직 종료
				// }
				if(!fileImageOnly(file)){
					return;
				}
		        filename = files[0].name;
		        $(this).siblings('#bannerFileText').val(filename);
		        $('#bannerFileText').after(bannerDeleteButton);
		        selectedBannerFiles.push(file);
		    } else {
		    	// 이외의 경우에는 취소로 받아들이고 경고창을 띄우겠음.
		    	alert("배너 이미지 업로드가 취소되었습니다. 다시 올려주세요.");
		    	$(this).siblings('#bannerFileText').val('파일을 선택하세요');
				if($(this).children($('#BnDelBtn')).length !== 0){
					$(this).children($('#BnDelBtn')).remove();
				}
		    }		    
		    
		    bannerDeleteButton.on('click',function(){
		    	if($(this).parents().children('#bannerFileText').length != 0){
		       		$(this).parents().children('#bannerFileText').each(function(){
		       			// #bannerFileText의 텍스트 초기화
		       			// this가 가리키는 요소가 다름.
		       			$(this).val('');
		       		});
		       		$(this).remove();		
		       		
		       		let index = $(this).parent().index();
		       		if(index > -1){
		       			selectedBannerFiles.splice(index, 1);
		       		}
		       	}
		    });

			for(let i = 0; i < selectedBannerFiles.length ; i++){
				console.log("bannerFile : " + selectedBannerFiles[i]);
			}			
		});
		
		function fileCount(files,max,count){
			if ((count + files.length) > max) {
				alert("이미지는 최대 " + max +"개까지만 업로드할 수 있습니다.");
				return;
			}
		}
		
		function getMultiFiles(files, ul, text, delbtntext, selectFiles){
			for (let i = 0; i < files.length; i++) {
					let file = files[i];

					// 이미지 타입에 맞는가, 맞지 않는가를 확인
					// 정규식을 사용하여 MIME 타입이 image/로 시작하는지 확인
					if (!fileImageOnly(file)) {				
						return; // 전체 로직 종료
					}

					// 파일 리스트를 보여주기 위한 <li>
					let newItem = $('<li></li>').addClass('list-group-item');				

					// 현재 파일명
					let fileName = file.name;

					// 삭제 버튼
					let deleteButton = $('<button></button>').addClass('btn font-weight-bold').text('X').attr('id', delbtntext);
					
					// <li>에 삭제 버튼 및 파일이름 추가
					newItem.text(fileName).append(deleteButton);

					// 새로운 li 요소 생성 및 ul에 추가
					ul.append(newItem);

					// 삭제 버튼을 클릭할 때 파일을 삭제하는 이벤트를 추가
					deleteButton.on('click', function() {
						// 삭제 버튼을 포함한 파일 아이템을 삭제
						$(this).parent().remove();
						text.val('');
						
						let index = $(this).parent().index();
			       		if(index > -1){
							selectFiles.splice(index, 1);
			       		}
					});
				}
		}

		// 커버 이미지 경로 가져오기
		coverFile.change(function(e) {
			let files = e.target.files;
			let maxFiles = 5;
			let uploadedFilesCount = $('#uploadedCoverFiles li').length;
			
			// 파일을 선택한 경우 첫 번째 파일명 표시
			if (files.length > 0 && (uploadedFilesCount + files.length) <= maxFiles) {			
				getMultiFiles(files,$('#uploadedCoverFiles'), $('#coverFileText'), "cvDelBtn", selectedCoverFiles);

				let filename = files[0].name;
											
				// explainFile의 형제인 #explainFileText(파일명 출력 공간)의 텍스트 값 입력
				$(this).siblings('#coverFileText').val(filename);
				
				for (let i = 0; i < files.length; i++) {
					selectedCoverFiles.push(files[i]);
				}
			} else {
				
				fileCount(files,maxFiles,uploadedFilesCount);
				console.log(files);
				if(files.length == 0){
					alert("업로드가 취소되었습니다.");
					return;
				}
				
				if($(this).children($('#cvDelBtn')).length !== 0){
					$(this).children($('#cvDelBtn')).remove();
				}
			}

			for(let i = 0; i < selectedCoverFiles.length ; i++){
				console.log("coverFile : " + selectedCoverFiles[i].name);
			}
			console.log("==")
		});
		
		
		// 설명 이미지 경로 가져오기
		explainFile.change(function(e) {
			let files = e.target.files;
			let maxFiles = 30;
			let uploadedFilesCount = $('#uploadedExplainFiles li').length;	

			// 파일을 선택한 경우 첫 번째 파일명 표시
			if (files.length > 0 && (uploadedFilesCount + files.length) < maxFiles) {
				getMultiFiles(files,$('#uploadedExplainFiles'), $('#explainFileText'), "exDelBtn", selectedExplainFiles);

				
				let filename = files[0].name;
				
				// explainFile의 형제인 #explainFileText(파일명 출력 공간)의 텍스트 값 입력
				$(this).siblings('#explainFileText').val(filename);

				for (let i = 0; i < files.length; i++) {
					selectedExplainFiles.push(files[i]);
				}
			} else {
				fileCount(files,maxFiles,uploadedFilesCount);
				
				console.log(files);
				if(files.length == 0){
					alert("업로드가 취소되었습니다.");
					return;
				}
				
				if($(this).children($('#exDelBtn')).length !== 0){
					$(this).children($('#exDelBtn')).remove();
				}
			}

			console.log("files : " + files);
		});

		console.log("proprice val 타입 : " + typeof $("#proPrice").val());

		$('#productAdd').on('submit',function(e){
			e.preventDefault();
			// 기존 submit 동작 중지
			let formData = new FormData(this);

			// 기존 키에 대한 값을 삭제.
			formData.delete($('#coverFile').attr('name'));

			// 새로운 값을 배열로 추가.
			// 각 파일을 formData.append를 통해 동일한 키에 추가하면, 서버 측에서 이를 배열 형태로 처리할 수 있다. 
			// 이는 FormData 객체의 내부 동작이다. 따라서 기본 파일 업로드로 진행할 경우에는 별도의 배열 처리를 개발자가 하지 않아도 됨.
			selectedCoverFiles.forEach(function(value){
				formData.append($('#coverFile').attr('name'), value);
			});

			// 기존 키에 대한 값을 삭제.
			formData.delete($('#explainFile').attr('name'));

			// 새로운 값을 배열로 추가.
			selectedExplainFiles.forEach(function(value){
				formData.append($('#explainFile').attr('name'), value);
			});

			for(let pair of formData.entries()){
				console.log(pair[0] + ", " + pair[1]);
				if(pair[0].includes('[]') && Array.isArray(pair[0])){
					console.log(pair[0] + "의 개수 : " +  pair[0].length);
				}
			}

			if($("#subCategory").val()=="" || $("#subCategory").val()==null){
				alert("1차 분류를 선택한 후, 2차 분류를 선택하십시오.");
				return;
			}else if($("#proName").val()=="" || $("#proName").val()==null){
				alert("상품명을 입력하셔야 합니다.");
				return;
			}else if($("#proName").length() <= 5){
				alert("상품명은 다섯 글자 이상 입력하셔야 합니다.");
				return;
			}else if($("#proPrice").val()=="" || $("#proPrice").val()==null){
				alert("상품 가격을 입력하셔야 합니다.");
				return;
			}else if( Number($("#proPrice").val()) < 0){
				alert("상품 가격은 음수가 될 수 없습니다.");
				return;
			}else if( !Number.isInteger(Number($("#proPrice").val()))){
				alert("상품 가격에 소수는 입력하시면 안됩니다.");
				return;
			}else if($("#proQuantity").val()=="" || $("#proQuantity").val()==null){
				alert("상품수량을 입력하셔야 합니다.");
				return;
			}else if( Number($("#proQuantity").val()) < 0 ){
				alert("상품 수량은 음수가 될 수 없습니다.");
				return;
			}else if( !Number.isInteger(Number($("#proPrice").val()))){
				alert("상품 수량에 소수는 입력하시면 안됩니다.");
				return;
			}else{
				// 위 제약조건에 해당되지 않는 나머지 경우에 한해, 로직을 실행한다.	

			}
		});

		$("#cancel_Btn").on("click",function(){
			if (confirm("취소하시겠습니까?")){
				window.location.href = "/vendor";
			}else{
				return;
			}			
		});
	}); 
</script>


<script>
					 
  let select_dv = $("#select_content");
    
    $("#select_mp_top").on('click', function() {
        select_dv.toggle();
    });

	

</script>

</html>