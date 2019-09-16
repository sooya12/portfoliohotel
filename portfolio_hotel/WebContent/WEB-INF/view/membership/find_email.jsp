<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
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
    <link rel="stylesheet" href="/css/find-account.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>이메일찾기</title>
    <script>

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
	if ($("#birthday_day").val() == "") {
		alert("일을 입력해주세요.");
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
	

	$("#frm").submit();  
}
</script>
</head>


<body>
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
                    <li><a href="sign_in.do">Sign in</a></li>
                   <!--  <a href="sign_in.do">SIGN IN</a> -->
                </ul>
                
            </div>
        </div>
    </div>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>아이디/비밀번호 찾기</h2>
                    <h3>Account</h3>
                </div>
        </div>
        <div class="notice">
            <div class="support-list">
                <ul class="support-list-center">
                    <li ><a href="find_email">이메일 찾기</a></li>
                    <li class="on"><a href="find_pw">비밀번호 찾기</a></li>
                </ul>
            </div>
            <div class="section-edit">

                <div class="edit-table">
                        <h3>이메일을 잊으셨나요?</h3>
                        <p>정보를 입력하시면 이메일을 확인하실 수 있습니다.</p>
                    <div class="edit-table-right">
                        <!-- <form method="POST"> -->
                        <form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
                        
                            
                            <ul class="name clear">
                                <li>
                                    <input type="text" id="f_name" name="f_name" placeholder="성" maxlength="2">
                                </li>

                                <li>
                                    <input type="text" id="l_name" name="l_name" placeholder="이름" maxlength="12">
                                </li>
                                
                            </ul>
                            <ul class="birth clear">
                                    <li>
                                        <input type="text" id="birthday_year" name="birthday_year" placeholder="●●●●(생년)" maxlength="4">
                                    </li>
                                    <li>
                                        <input type="text" id="birthday_month" name="birthday_month"  placeholder="●●(월)" maxlength="2">
                                    </li>
                                    <li>
                                        <input type="text" id="birthday_day" name="birthday_day" placeholder="●●(일)" maxlength="2">
                                    </li>
    
                                    
                                    
                            </ul>
                            <ul class="birth clear">  
                            <li>                                                                             
                                <input type="text" id="f_tel" name="f_tel" placeholder="연락처" maxlength="3" >                             
                                
                                </li>
                                
                                <li>                               
                                <input type="text" id="m_tel" name="m_tel"  maxlength="4" >
                         		</li>
                         		
                         		<li>
								<input type="text" id="l_tel" name="l_tel"  maxlength="4">
								</li>
                            </ul>
                            
                            <input type="hidden" name="cmd" value="find_email">
                            <input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							
                     
                            <div class="">
                                    <!-- <input type="submit" value="이메일 찾기" class="submit-button" > -->
                                    <input type='button' class="submit-button" href="#" onclick="goSave();" value="이메일 찾기">
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
</html>