<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    textarea{
        resize: none;
    }
    
   </style>
   
   <script>
        let temp_terms_str="선거운동은 각급 선거관리위원회의 관리하에 법률이 정하는 범위안에서 하되, 균등한 기회가 보장되어야 한다. 형사피해자는 법률이 정하는 바에 의하여 당해 사건의 재판절차에서 진술할 수 있다. 제1항의 지시를 받은 당해 행정기관은 이에 응하여야 한다. 환경권의 내용과 행사에 관하여는 법률로 정한다. 혼인과 가족생활은 개인의 존엄과 양성의 평등을 기초로 성립되고 유지되어야 하며, 국가는 이를 보장한다. 법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 대법원장은 국회의 동의를 얻어 대통령이 임명한다. 정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다. 비상계엄이 선포된 때에는 법률이 정하는 바에 의하여 영장제도, 언론·출판·집회·결사의 자유, 정부나 법원의 권한에 관하여 특별한 조치를 할 수 있다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다. 군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다. 이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대한민국은 국제평화의 유지에 노력하고 침략적 전쟁을 부인한다. 사면·감형 및 복권에 관한 사항은 법률로 정한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다. 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다. 재판의 심리와 판결은 공개한다. 다만, 심리는 국가의 안전보장 또는 안녕질서를 방해하거나 선량한 풍속을 해할 염려가 있을 때에는 법원의 결정으로 공개하지 아니할 수 있다. 모든 국민은 법률이 정하는 바에 의하여 납세의 의무를 진다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다. ";

        $(document).ready(function(){
            let terms1=$("#terms1");
            let terms2=$("#terms2");             
            let terms1_check=$("#terms1_check");
            let terms2_check=$("#terms2_check");             
            let agree=$("#agree"); 
            
            //차후에 서버에서 ajax형태로 약관을 받아 해당 terms에 세팅 
            terms1.val(temp_terms_str);
            terms2.val(temp_terms_str);

            //약관동의시 버튼 활성화
            terms1_check.change(function(){
                if(terms1_check.is(":checked")&&terms2_check.is(":checked")){
                    agree.removeClass("btn-outline-dark");
                    agree.addClass("btn-dark");
                    agree.removeAttr("disabled");
                }else{
                    agree.removeClass("btn-dark");
                    agree.addClass("btn-outline-dark");
                    agree.attr("disabled","disabled");
                }
            });            
            terms2_check.change(function(){                
                if(terms1_check.is(":checked")&&terms2_check.is(":checked")){
                    agree.removeClass("btn-outline-dark");
                    agree.addClass("btn-dark");
                    agree.removeAttr("disabled");
                }else{
                    agree.removeClass("btn-dark");
                    agree.addClass("btn-outline-dark");
                    agree.attr("disabled","disabled");
                }
            });
            
        })

    
   </script>
</head>
<body>
    <div class="d-flex align-items-center justify-content-center flex-column">
        <!-- 홈화면링크 -->
         <a id="logo_toHome" href=""><img src="/images/utilities/big_logo.png" alt=""></a>
        <!-- 실제 적용시 method post로 변경, 링크 변경  -->
        <form action="${pageContext.request.contextPath}/test/sign_up" method="post">
            <table>
                <tr>
                    <td colspan="2">
                        <textarea id="terms1" cols="50" rows="10" readonly></textarea>
                    </td>
                </tr>        
                <tr>
                    <td><input type="checkbox" class="mb-3" id="terms1_check"> 해당 약관을 확인하였고 동의합니다.</td>
                </tr>   
                <tr>
                    <td colspan="2">
                        <textarea id="terms2" cols="50" rows="10"readonly></textarea>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" class="mb-3" id="terms2_check"> 해당 약관을 확인하였고 동의합니다.</td>
                </tr>
            </table>
            <div class="text-center mt-3">
                <input type="submit" class="btn btn-outline-dark me-3" id="agree" value="동의" disabled>
                <a href="${pageContext.request.contextPath}/"><input type="button" class="btn" value="취소" style="background-color: #bec1c4; color: white;"></a> 
                <!-- 홈화면링크 -->
            </div>
        </form>
    </div>
</body>
</html>