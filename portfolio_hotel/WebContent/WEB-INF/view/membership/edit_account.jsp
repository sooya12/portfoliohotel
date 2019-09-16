<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
/* ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list"); */
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
MemberVO data = (MemberVO)request.getAttribute("data");
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
    <link rel="stylesheet" href="/css/edit_account.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>회원정보수정</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>

/*  function goSave() {
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
}  */
function goSave() {  
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
	
	// 비밀번호 유효성체크
	// if(!validPassword($("#password"))) return false;
	
	/* $.ajax ({
		type:'POST',
		url:"/manage/member/emailcheck",
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
	} */

	return true;
	//$("#frm").submit();  
}


</script>
</head>
<body>
<div id="zipcode_layer" style="display:none;position:fixed;overflow:hidden;z-index:999;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../room_offer.html">Room Package</a></li>
                                                <li><a href="../room_offer.html">Dining Package</a></li>
                                                <li><a href="../room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="../room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="../room-detail-subpage.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="../room-detail-subpage.html">Namsan Presidential Suite</a></li>
                                                <li><a href="../room-detail-subpage.html">Spa Sanctuary Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="#">The Festa</a></li>
                                                <li><a href="#">Granum Dining Lounge</a></li>
                                                <li><a href="#">Moon Bar</a></li>
                                                <li><a href="#">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="#">Meeting</li>
                                                <li><a href="#">Wedding</a></li>
                                                <li><a href="#">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilities.html#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop facil-right">
                                                
                                                <ul class="Dining">
                                                    <li><a href="#">Troon Golf Academy</a></li>
                                                    <li><a href="#">Foresta Beauty Salon</a></li>
                                                </ul>
                                            </div>
                                        </div>
                            </div>
                        
                    </li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="../notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../qna.html">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                    <%if(sessionMember == null){ %>
                 <li><a href="/membership/sign_in">Sign in</a> </li>
                
                <%}else{ %>
                 <li><a href="/membership/mypage">My page</a> </li>
                <%} %>
                </ul>
              
            </div>
        </div>
    </div>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>개인정보수정</h2>
                    <h3>Edit Account</h3>
                </div>
        </div>
        <div class="notice">
            <div class="support-list">
                <ul class="support-list-center">
                    <li class="on"><a href="edit_account">회원정보수정</a></li>
                    <li><a href="edit_password">비밀번호변경</a></li>
                    <li><a href="delete_account">회원탈퇴요청</a></li>
                </ul>
            </div>
            <div class="section-edit">
                <h2>회원정보</h2>
                <div class="edit-table">
                    <div class="edit-table-right">
                       <!--  <form method="POST"> -->
                        <form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post" onsubmit="return goSave();">
                        
                            <div class="name clear">
                                <div class="name1">
                                    <label for="first-name">성</label>
                                    <input type="text" name="f_name" id="f_name" maxlength="2" >
                                </div>
                                <div class="name2">
                                    <label for="middle-name">이름</label>
                                    <input type="text" name="l_name" id="l_name" maxlenght="10" >
                                </div>
                            </div>
                        
                            <div class="birth">
                                <label for="birth-y">생년월일</label>
                                <input type="text" id="birthday_year" name="birthday_year" placeholder="년(4자)" maxlength="4" >
                                <input type="text" id="birthday_month" name="birthday_month" placeholder="월" maxlength="2" minlength="2">
                                <input type="text" id="birthday_day" name="birthday_day" placeholder="일" maxlength="2" minlength="2">
                            </div>
                            <!-- <div class="email">
                                <label for="email">이메일</label>
                                <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" maxlength="40">
                            </div> -->
                            <div class="tel">
                                <label for="account-contact">연락처</label>
                                <input type="text" id="f_tel" name="f_tel"  maxlength="3">
                                <input type="text" id="m_tel" name="m_tel"  maxlength="4">
                                <input type="text" id="l_tel" name="l_tel"  maxlength="4">
                                
                            </div>

                            <div class="adress clear">
                                <label for="adress">주소</label>
                                <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly >
                                <input type='button' class="ad-button zipcodeBtn" onclick="sample2_execDaumPostcode()" value="우편번호" >                              
                                <input type="text" id="addr" name="addr" placeholder="기본주소"  readonly>
                                <input type="text" id="addr_detail" name="addr_detail" placeholder="상세주소" >
                            </div>
                            <input type="hidden" name="cmd" value="edit_account">
                            <input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=sessionMember.getNo()%>"/>

                            <div class="">
                                    <!-- <input type="submit" value="수정하기" class="submit-button" onclick="goSave();"> -->
                                    <input type='button' class="submit-button" onclick="$('#frm').submit();" value="수정하기">
                                    
                            </div>
                            
                        </form>
                    </div>
                    
                </div>
            </div>
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