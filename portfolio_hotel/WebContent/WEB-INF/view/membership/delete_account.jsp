<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*"%>
<%@ page import="util.*"%>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");
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
    <title>탈퇴사유</title>
    
    <script>
    function goDelete(){
    	if ($("#password").val() == "") {
    		alert("비밀번호를 입력해주세요.");
    		$("#password").focus();
    		return false;
    	}
    	if($("#secession_reason").val()==0){
    		alert("탈퇴사유를 입력해주세요.");
    		return false;
    	}
    
    	$("#frm").submit(); 
    }
    
    </script>
</head>

<%-- <script>
	
	function goDelete() {
		 if(!validPassword($("#password")))
			
		 getObject("password").focus();
			 return false; 
		
		
		
		var del = confirm ('탈퇴하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
		
	}
</script> --%>
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
                    <li><a href="edit_account">회원정보 수정</a></li>
                    <li><a href="edit_password">비밀번호 변경</a></li>
                    <li class="on"><a href="delete_account">탈퇴요청</a></li>
                </ul>
            </div>
            <div class="section-edit">
                <p>멤버십 회원 탈퇴 시, 보유하신 포인트가 삭제됩니다.</p>

                <div class="edit-table">
                    <div class="edit-table-right">
                        <!-- <form method="POST"> -->
                       <form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
                            <div class="section01_del">
                                <input type="password" id="password" name="password" placeholder="사용자 비밀번호 입력">
                            </div>
                            <div class="section02_del">
                                <select id="secession_reason" name="secession_reason">
                                    <option value="0">탈퇴사유</option>
                                    <option value="1">더 이상 서비스를 사용하지 않음</option>
                                    <option value="2">서비스가 불편함</option>
                                    <option value="3">시스템 장애(속도 저조, 에러등)</option>
                                    <option value="4">장기간 부재(군 입대, 유학등)</option>
                                    <option value="5">기타사유</option>
                                </select>
                            </div>
                            
                            <input type="hidden" name="cmd" value="delete_account">
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=sessionMember.getNo()%>"/>

                            <div class="submit">
                                    <!-- <input type="submit" value="탈퇴확인" class="submit-button" onclick="goDelete();"> -->
                                    <input type='button' class="submit-button" href="#" onclick="goDelete();" value="탈퇴확인">
                                    
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