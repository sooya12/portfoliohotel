<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/join.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_로그인페이지</title>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    $(function(){
    	$("#emailCheckBtn").click(function(){
    		if ($("#email").val()==""){
    			alert("이메일을 입력하세요");
    		}else{
    		$.ajax ({
    			type:'POST',
    			url:"/membership/emailcheck",
    			data:$("[name=frm]").serialize(), //serialize() 직렬로 정렬
    			async:false,
    			success:function(data) {
    				var val = data.trim();
    				if (val == "0") {
    					alert("사용가능한 이메일입니다.");
    					$("#emailcheck").val("1");
    					$("#email").attr("readonly","readonly");
    				} else {
    					alert("존재하는 이메일입니다.");
    					$("#email").val("");
    					$("#emailcheck").val("0");
    					return false;
    				}
    			}
    		
    		});
    		}
    	});
    });
    
function goSave() {
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}
	 
	/* if(!validPassword($("#password"))) return false;   */
	 
	if ($("#password").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return false;
	}
	
	if ($("#passwordCheck").val() == "") {
		alert("비밀번호 확인을 입력해주세요.");
		$("#passwordCheck").focus();
		return false;
	}
	
	
	if ($("#f_name").val() == "") {
		alert("성을 입력해주세요.");
		$("#f_name").focus();
		return false;
	}
	if ($("#l_name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#l_name").focus();
		return false;
	}
	

	if ($("#birthday_year").val() == "") {
		alert("생년월일을 입력해주세요.");
		$("#birthday_year").focus();
		return false;
	}
	if ($("#birthday_month").val() == "") {
		alert("월을 입력해주세요.");
		$("#birthday_month").focus();
		return false;
	}
	if ($("#birthday_month").val().length < 2) {
		alert("월은 2자리로 입력해주세요.");
		$("#birthday_month").focus();
		return false;
	}
	if ($("#birthday_day").val() == "") {
		alert("일을 입력해주세요.");
		$("#birthday_day").focus();
		return false;
	}
	if ($("#birthday_day").val().length < 2) {
		alert("일은 2자리로 입력해주세요.");
		$("#birthday_day").focus();
		return false;
	}

	if ($("#f_tel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#f_tel").focus();
		return false;		
	}
	if ($("#m_tel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#m_tel").focus();
		return false;		
	}
	if ($("#l_tel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#l_tel").focus();
		return false;		
	}
	
	if ($("#zipcode").val() == "") {
		alert("우편번호를 입력해주세요.");
		$("#zipcode").focus();
		return false;		
	}
	
	if ($("#addr").val() == "") {
		alert("주소를 입력해주세요.");
		$("#addr").focus();
		return false;		
	}
	if ($("#addr_detail").val() == "") {
		alert("상세주소를 입력해주세요.");
		$("#addr_detail").focus();
		return false;		
	}
	
	/* if($("#password").val()!=$("#passwordCheck").val()){
		alert("비밀번호가 다릅니다.");
		$("#password").focus();
		return false;
	} */
	
	$.ajax ({
		type:'POST',
		url:"/membership/emailcheck",
		data:$("[name=frm]").serialize(), //serialize() 직렬로 정렬
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#emailcheck").val("1");
			} else {
				alert("존재하는 이메일입니다.");
				$("#emailcheck").val("0");
				return false;
			}
		}
	});
	if ($("#emailcheck").val() == "0") {
		return false;
	}
	
	/* $.post("/membership/idcheck",$("[name=frm]").serialize(), function (data, status) {
		var val = data.trim();
		if (val == "0") {
			$("#idcheck").val("1");
			r = true;
		} else {
			alert("존재하는 아이디입니다.");
			r = false;
		}
		$("#idcheck").val(data.trim());
	}).fail(function() {   
		alert('아이디체크실패');
		r = false;
	}); */
	
	return true;
	//$("#frm").submit();  
}

	</script>

	

</head>
<body>
	<div id="zipcode_layer" style="display:none;position:fixed;overflow:hidden;z-index:999;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" 
		style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
    <jsp:include page="/header_menu" flush="true" />
    
    <div id="container">
        <!-- account section 영역 -->
        <div class="account-section">
            <h2>멤버십 회원가입</h2>
            <h3>Account</h3>
        <!-- account section title 영역 끝 -->
            <div class="account-box clear">
                <div class="account-box-logo"><img src="/img/header-logo.png"></div>
                <div class="account-form">
                    <form name="frm" id="frm" action="join_insert" method="post" onsubmit="return goSave();">
                        <div class="account-form1">
                        <div class="email">
                                <label for="account-email">이메일</label>
                                <input type="text" name="email" id="email" placeholder="이메일을 입력하세요.">                                                                                                   
                                <input type="button" value="중복체크"  id="emailCheckBtn" style="height:35px; border:none; border-radius: 5px; background-color:#0e693f; color:#fff; width:60px; padding:0;"/>
                            </div>
                            <!-- <label for="account-id">아이디</label>
                            <input type="text" name="account-id" id="account-id" placeholder="ID를 입력하세요.">
                            <input type="submit" id="check-id" value="중복확인"> -->
                            <label for="account-password">비밀번호</label>
                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요.">
                            <label for="check-password">비밀번호 재입력</label>
                            <input type="password" name="password2" id="passwordCheck" placeholder="비밀번호를 재입력하세요.">
                        </div>
                        <div class="account-form2 clear">
                            <div class="account-name">
                                <div class="first-name">
                                    <label for="first-name">성</label>
                                    <input type="text" name="f_name" id="f_name" placeholder="성">
                                </div>
                                <div class="middle-name">
                                    <label for="middle-name">이름</label>
                                    <input type="text" name="l_name" id="l_name" placeholder="이름">
                                </div>
                            </div>
                            <div class="account-sex">
                                <label for="male">남성</label>
                                <input type="radio" name="gender" id="male" value="1">
                                <label for="male" class="female">여성</label>
                                <input type="radio" name="gender" id="female" value="2">
                            </div>
                            <div class="account-birthday clear">
                                <div class="birth-form">
                                    <label for="birth-y">생년월일</label>
                                    <input type="text" name="birthday_year" id="birthday_year" placeholder="년 (4자)" maxlength="4">
                                </div>
                                <div class="birth-form">
                                    <input type="text" name="birthday_month" id="birthday_month" placeholder="월" maxlength="2" >
                                </div>
                                <div class="birth-form">
                                    <input type="text" name="birthday_day" id="birthday_day" placeholder="일" maxlength="2" >
                                </div>                                
                            </div>
                        </div>
                        
                        
                        <div class="account-form3">
                            
                            <div class="account-contact clear">
                            <div class="tel-form">
                                <label for="account-contact">연락처</label>                                
                                <input type="text" name="f_tel" id="f_tel"  maxlength="3">
                          	</div>
                          	<div class="tel-form">
                                <input type="text" name="m_tel" id="m_tel"  maxlength="4">
                            </div>
                            <div class="tel-form">
                                <input type="text" name="l_tel" id="l_tel"  maxlength="4">
                            </div>
                              
                            </div>

                            <div class="adress clear">
                                <label for="adress">주소</label>
                                <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly >
                                <input type='button' class="ad-button zipcodeBtn" onclick="sample2_execDaumPostcode()" value="우편번호" >                              
                                <input type="text" id="addr" name="addr" placeholder="기본주소" readonly>
                                <input type="text" id="addr_detail" name="addr_detail" placeholder="상세주소">
                            </div>
                            <input type="submit" href="#" value="가입하기">
                            <input type="hidden" name="cmd" value="join">
                            <%-- <input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="idcheck" id="idcheck" value="0"/> --%>
							<input type="hidden" name="emailcheck" id="emailcheck" value="0"/>
                            
                        </div>
                    </form>
                </div>
            </div><!--acoount-box 끝-->
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('zipcode_layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    //document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr_detail").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

</html>