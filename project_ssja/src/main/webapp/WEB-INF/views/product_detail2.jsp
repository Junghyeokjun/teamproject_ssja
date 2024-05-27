<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 디테일 페이지</title>
<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		fotmat('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}

.yellowStar {
	color: gold;
}

table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    unicode-bidi: isolate;
    border-spacing: 2px;
    border-color: gray;
}
body {
	font-family: Arial, sans-serif;
}

.container {
	padding: 60px 0 0 0;
	max-width: 950px;
	margin: 0 auto;
}

.image {
	height: 406px;
}

.line {
	border: solid 0.2px #ebebeb;
	width: 92%;
	margin: 10px 0;
}

.highlight {
	color: #ff6f61;
	font-weight: 800;
}

.select {
	appearance: none;
	-moz-appearance: none; /* Firefox */
	-webkit-appearance: none; /* Safari and Chrome */
	width: 100%;
	height: 40px;
	border: 1px solid rgb(236, 236, 236);
	color: rgb(196, 196, 196);
	padding-left: 12px;
	border-radius: 4px;
	font-size: 14px;
	background-image:
		url('data:image/svg+xml,%3Csvgxmlns="http://www.w3.org/2000/svg"width="12"height="6"viewBox="0 0 12 6"style="background:%23fff"%3E%3Cgfill="none"fill-rule="evenodd"transform="translate(-186 -365)"%3E%3Cpathfill="%23FFF"d="M0 0H375V2362H0z"/%3E%3Crectwidth="93"height="39"x="115.5"y="348.5"fill="%23FFF"stroke="%23ECECEC"rx="4"/%3E%3Cpathfill="%233B3B3B"fill-rule="nonzero"d="M196.145 365.15c.193-.197.509-.2.705-.007.197.193.2.51.007.707l-4.892 5c-.193.197-.508.2-.705.008l-5.11-5c-.197-.193-.2-.51-.008-.707.192-.198.508-.202.705-.009l4.754 4.652 4.544-4.644z"/%3E%3C/g%3E%3C/svg%3E');
	background-position-x: calc(100% - 12px);
}

.option-grid {
	width: 100%;
	height: 50px;
	box-sizing: border-box;
	border-radius: 4px;
	border: 1px solid rgb(236, 236, 236);
	background-color: rgb(248, 248, 248);
	color: rgb(59, 59, 59);
}

.button {
	background-color: rgb(255, 111, 97);
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	font-weight: bold;
}

.img-box {
	margin: 100px auto 30px auto;
	width: 57%;
	align-items: center;
}

ul {
	margin: 30px 0 0 0;
	padding: 0;
	list-style: none;
	height: 46px;
	width: 100%;
	display: flex;
}

ul li {
	flex: 1;
	cursor: pointer;
}

ul a {
	text-decoration: none;
	position: relative;
	height: 46px;
	line-height: 46px;
	text-align: center;
	display: block;
	color: rgb(64, 64, 64);
	font-size: 14px;
	border-top: 1px solid rgb(219, 219, 219);
	border-right: 1px solid rgb(219, 219, 219);
	border-bottom: 1px solid rgb(219, 219, 219);
	border-left: 1px solid rgb(219, 219, 219);
}

ul a.selected {
	border-color: rgb(255, 111, 97);
	background-color: rgb(255, 111, 97);
	color: rgb(255, 255, 255);
}

.content {
	display: none;
}

.content.active {
	display: block;
}
</style>
<script>
        function showContent(contentId) {
            // 모든 탭과 콘텐츠를 초기화합니다.
            var tabs = document.querySelectorAll('ul a');
            var contents = document.querySelectorAll('.content');
            tabs.forEach(function(tab) {
                tab.classList.remove('selected');
            });
            contents.forEach(function(content) {
                content.classList.remove('active');
            });
            // 클릭한 탭과 연결된 콘텐츠를 활성화합니다.
            document.querySelector('a[href="#' + contentId + '"]').classList.add('selected');
            document.getElementById(contentId).classList.add('active');
        }
        document.addEventListener('DOMContentLoaded', function() {
            var tabs = document.querySelectorAll('ul a');
            tabs.forEach(function(tab) {
                tab.addEventListener('click', function(event) {
                    event.preventDefault();
                    showContent(this.getAttribute('href').substring(1));
                });
            });
            // 첫 번째 탭을 기본으로 활성화합니다.
            showContent('product-description');
        });
    </script>
</head>
<body>
	<main class="container">
		<section>
			<div style="display: flex; align-items: flex-start;">
				<img class="image"
					src="https://danoshop.net/mall/upload/2021/03/22/ukx7m8boo5eby6nqllfx.png"
					alt="Product Image">
				<div>
					<div style="display: flex; justify-content: space-between;">
						<div>
							<h1>다노X디디미니 밀키트 2종</h1>
							<p>재료 손질 필요없이 근사한 한끼가 뚝딱!</p>
						</div>
						<div style="position: relative; bottom: 0;">
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="16"
								viewBox="0 0 20 16">
                            <g fill="none" fill-rule="evenodd">
                                <g stroke="#3B3B3B" stroke-width="1.2">
                                    <path
									d="M14.727 10.384L14.727 14.727 0 14.727 0 3.273 5.54 3.273"
									transform="translate(-1272 -368) translate(1273 368)"></path>
                                    <path
									d="M16.364 1.636L16.364 6.545 11.455 6.545"
									transform="translate(-1272 -368) translate(1273 368) scale(1 -1) rotate(-45 4.033 0)"></path>
                                    <path
									d="M16.926 4.09c-4.88-.835-8.34 1.075-10.38 5.728"
									transform="translate(-1272 -368) translate(1273 368)"></path>
                                </g>
                            </g>
                        </svg>
						</div>
					</div>
					<hr class="line">
					<div style="display: flex; align-items: center; padding: 6px 16px;">
						<div style="width: auto;">
							<p style="margin: 0; font-size: 13px; font-weight: bold;">최대혜택</p>
						</div>
						<div style="width: 82%; padding-left: 15px;">
							<p style="margin: 0; font-size: 13px; font-weight: bold;">
								<span class="highlight">로그인</span> 시 적립 혜택 제공
							</p>
						</div>
						<div style="position: relative; bottom: 0;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 16 16">
                            <path fill="none" fill-rule="evenodd"
									stroke="#A1A1A1" stroke-linecap="round" stroke-linejoin="round"
									d="M6.045 3.955L10.136 8.052 6.045 12.136"
									transform="rotate(90 7.91 8.045)"></path>
                        </svg>
						</div>
					</div>
					<hr class="line">
					<div style="display: flex; align-items: center; padding: 6px 16px;">
						<div style="width: auto;">
							<p style="margin: 0; font-size: 13px; font-weight: bold;">배송정보</p>
						</div>
						<div style="width: 82%; padding-left: 15px;">
							<p style="margin: 0; font-size: 13px; font-weight: bold;">
								무료배송 <br> <span class="highlight">지금 주문하면 4월 7일(수)
									출고예정입니다.</span><br> 제주 및 도서/산간 지역 <span class="highlight">1~2일
									추가 소요</span>
							</p>
						</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 16 16">
                            <path fill="none" fill-rule="evenodd"
									stroke="#A1A1A1" stroke-linecap="round" stroke-linejoin="round"
									d="M6.045 3.955L10.136 8.052 6.045 12.136"
									transform="rotate(90 7.91 8.045)"></path>
                        </svg>
						</div>
					</div>
					
					<div style="padding: 32px 16px 16px 10px;">
						<select class="select">
							<option>[필수] 옵션을 선택해 주세요</option>
							<option disabled="true">------------------</option>
							<option value="매콤달콤 양념 치킨(2~3인분) 15,400원">매콤달콤 양념
								치킨(2~3인분) 15,400원</option>
							<option value="스리라차 크림 쉬림프 리조또(2~3인분) 18,800원">스리라차 크림
								쉬림프 리조또(2~3인분) 18,800원</option>
							<option value="2종 세트 [15% 할인] 29,000원">2종 세트 [15% 할인]
								29,000원</option>
						</select>
					</div>
					
					<div class="option-grid" style="padding: 16px;">
						<div
							style="background: rgb(248, 248, 248); height: 98px; display: flex; align-items: center;">
							<div
								style="display: flex; flex-direction: column; align-items: center; width: 82%;">
								<p
									style="font-weight: bold; color: rgb(59, 59, 59); margin-bottom: 4px;">2종
									세트 [15% 할인]</p>
								<p
									style="font-weight: bold; color: rgb(59, 59, 59); margin-top: 0;">29,000원</p>
							</div>
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd"
										stroke="#EBEBEB">
                                    <path d="M0 0L24 24M0 24L24 0"></path>
                                </g>
                            </svg>
							</div>
						</div>
					</div>
					<div
						style="display: flex; align-items: center; justify-content: space-between;">
						<div style="width: auto;">
							<p style="font-size: 14px; font-weight: bold; margin: 0;">총
								상품금액</p>
						</div>
						<div>
							<p style="font-size: 18px; font-weight: bold; margin: 0;">29,000원</p>
						</div>
					</div>
					<div
						style="display: flex; align-items: center; justify-content: space-between;">
						<div style="width: auto;">
							<p
								style="font-size: 14px; font-weight: bold; color: #ff6f61; margin: 0;">-3,000원</p>
						</div>
						<div>
							<p style="font-size: 14px; font-weight: bold; margin: 0;">26,000원</p>
						</div>
					</div>
					<div style="padding: 0 10px 0 10px;">
						<button class="button" style="width: 100%; height: 52px;">구매하기</button>
					</div>
				</div>
			</div>
		</section>

		<section>
			<ul>
				<li><a class="selected" href="#product-description">상품정보</a></li>
				<li><a href="#detailed-description">리뷰</a></li>
				<li><a href="#reviews">사업자정보</a></li>
			</ul>
			<div id="product-description" class="content">
				<h2>상품설명</h2>
				<p>여기에 상품설명 내용을 작성합니다.</p>
			</div>
			<div id="detailed-description" class="content">
				<h2>상세설명</h2>
				<p>여기에 상세설명 내용을 작성합니다.</p>
			</div>
			<div id="reviews" class="content">
				<table class="production-selling-table ">
					<tbody>
						<tr>
							<th>상호명</th>
							<td>${productdetail.getV_BIZNAME()}</td>
						</tr>
						<tr>
							<th>사업자이름</th>
							<td>${productdetail.getM_NAME()}</td>
						</tr>
						<tr>
							<th>사업장소재지</th>
							<td>${productdetail.getM_ADDRESS1()}&nbsp;${productdetail.getM_ADDRESS2()}&nbsp;${productdetail.getM_ZIPCODE()}</td>
						</tr>
						<tr>
							<th>사업장전화번호</th>
							<td>${productdetail.getM_PHONE()}</td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td>${productdetail.getM_EMAIL()}</td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td>${productdetail.getV_LICENSE()}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</main>
	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>
</body>
</html>
