<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="pkg.*"%>
<%@ page import="pkg.res.*"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*" %>
<%
PkgVO pkg_param = (PkgVO) request.getAttribute("pkg_param");
PkgVO prdata = (PkgVO) request.getAttribute("prdata");
/* Pkg_resVO prparam = (Pkg_resVO) request.getAttribute("prparam"); */
%>
<%
MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");

// 변수를 선언해놓고 memberInfo가 null이 아닐경우에는 변수에 값을 넣어준다.
/* String email = "";

if (memberInfo != null) {
	
} else {
	
} */
%>
<%
Pkg_resVO res_data = (Pkg_resVO) request.getAttribute("res_data");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/header-fixed.css">
    <link rel="stylesheet" href="/css/dining_book_channel.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript" src="/js/datepicker.js"></script>
    <title>정보입력</title>
</head>
<script>
function goSave() {
	if ($("#guest_name1").val() == "") {
		alert('이름을 입력하세요.')
		$("#guest_kname1").focus();
		return false;
	}
	return true;
}
	
function cal_price() {
	var pkg_price = $("#pkg_price").val();
	var pkg_count = $("#pkg_count").val();
	var price = Number(pkg_price) * Number(pkg_count);
	$("#total_price").val(price);
}
//전화번호칸에 입력받은 값이 숫자가 아닐경우
<%-- <%
if (guest_tel1 != ) {
	alert('숫자만 입력해주세요');
} else if(guest_tel2 != ) {
	alert('숫자만 입력해주세요');
} else if(guest_tel3 != ) {
	alert('숫자만 입력해주세요');
}
%> --%>
$(function(){
	<%
	if(memberInfo != null) {%>
		$("#member_pk").val(<%=memberInfo.getNo()%>);
	<%} else {%>
		$("#member_pk").val(0);
	<%}%>
	
});

</script>
<body>
    <jsp:include page="/header_menu" flush="true"/>

    <div id="container">
        <!-- 베너 영역 -->
        <div class="banner">
                <h1 class="head-title">패키지 예약 신청<br/>
                    <p>RESERVATION FOR PACKAGE</p></h1>
        </div>

        <!-- 내용입력 구역 -->
        <div class="option_channel clear">
            
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <form name="frm" id="frm" action="/book/confirm_pkg/process?" method="POST" onsubmit="return goSave()">
                <div class="section-wrap clear">

                    <!-- 왼쪽 정보 입력 박스 구역 -->
                    <div class="left-section">
                        
                        <div class="add01">
                            <div class="sec01-title">
                                <p>예약고객 정보 입력</p>
                            </div>

                            <div class="name_ko">
                                    <label for="name_ko">성명 (한글)＊</label>
                                    <input type="text" id="guest_name1" name="guest_name1" placeholder="성" value="<% if(memberInfo!=null) out.print(memberInfo.getF_name());%>" style="color:#000000">
                                    <input type="text" id="guest_name2" name="guest_name2" placeholder="이름" value="<% if(memberInfo!=null) out.print(memberInfo.getL_name());%>" style="color:#000000">
                            </div>
                            
                            <div class="phoneNumber">
                                    <label for="phoneNumber">연락처＊</label>
                                    <input type="text" id="guest_tel1" name="guest_tel1" value="<% if(memberInfo!=null) out.print(memberInfo.getF_tel());%>" placeholder="숫자만 입력가능" style="color:#000000">
                                    <input type="text" id="guest_tel2" name="guest_tel2" value="<% if(memberInfo!=null) out.print(memberInfo.getM_tel());%>" placeholder="숫자만 입력가능" style="color:#000000">
                                    <input type="text" id="guest_tel3" name="guest_tel3" value="<% if(memberInfo!=null) out.print(memberInfo.getL_tel());%>" placeholder="숫자만 입력가능" style="color:#000000">
                            </div>

                            <div class="email">
                                    <ul class="email_adress clear">    
                                        <li class="email-title">
                                            <label for="email">이메일＊</label>
                                        </li>
                                    
                                        <li>
                                            <input type="text" id="email" name="email" value="<% if(memberInfo!=null) out.print(memberInfo.getEmail()); %>" title="이메일 아이디 입력" maxlength="40" style="color:#000000">
                                        </li>
                                    </ul>
                            </div>
                        </div>

                        <div class="add01 card">
                            <div class="sec01-title">
                                    <p>예약 날짜 및 시간</p>
                            </div>

                            <div class="cardType">
                                    <label for="name_ko">예약 상품<span>＊</span></label>
                                    <input type="text" id="pkg_name" name="pkg_name" value="<%=prdata.getEname() %>" style="color:#000000;" readonly>
                            </div>
                            
                            <div class="cardType">
                                    <label for="name_ko">가격 &nbsp &nbsp &nbsp &nbsp <span>＊</span></label>
                                    <input type="text" id="pkg_price" name="pkg_price" value="<%=prdata.getPrice() %>" style="color:#000000;" readonly>
                            </div>                             
                            
                            <div class="cardType">
                                    <label for="name_ko">예약 날짜<span>＊</span></label>
                                    <input type="text" id="start-date" name="use_date" placeholder="클릭하시면 날짜를 선택할 수 있습니다." style="color:#000000;">
                                   
                            </div>

                            <div class="cardType">
                                <label for="name_ko">예약 수량<span>＊</span></label>
                                <select id="pkg_count" name="pkg_count" onchange="cal_price()">
                                    <option>구매하시려는 패키지의 수량을 선택해주세요</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                </select>
                            </div>
                            
                            <div class="cardType">
                                    <label for="name_ko">총 가격 &nbsp &nbsp<span>＊</span></label>
                                    <input type="text" id="total_price" name="total_price" value="" style="color:#000000;" readonly>
                            </div>                            
                        </div>
                                                     
                    </div>

                    <!-- 오른쪽 구역 예약신청 버튼 -->
                    <div class="right-section">
                        <div class="confirmation-box">
                                
                                <div class="content-area03 area clear">
                                    
                                    <div class="next-but">
                                        <input id="countsubmit" type="submit" value="예약 신청">
                                    </div>

                                    <h4><span></span>예약 안내</h4>
                                    <p>· 10인 이상 예약을 원하시는 경우 전화로<br/>
                                        문의 부탁 드립니다.</p>
                                </div>

                                <div class="content-area04 area">
                                    <h4><span></span>예약문의 00-0000-0000</h4>
                                </div>
                                
                        </div>
                    </div>
                </div>
                <input type="hidden" name="cmd" value="write" />
                <input type="hidden" name="pkg_pk" value="<%=prdata.getNo() %>"/>
                <input type="hidden" id="member_pk" name="member_pk" value=""/>
            </form> 
        </div>
    </div>

    <!-- 푸터영역시작 -->
    <div id="footer">
            <!-- <div class="footer-logo"><img src="img/footer_logo.png"></div> -->
            
            <div class="footer-center">
                <div class="footer-top">
                    <ul class="company-info clear">
                        <li><a href="#">호텔소개</a></li>
                        <li><a href="#">오시는 길</a></li>
                        <li><a href="#">문의</a></li>
                        <li><a href="#">인재채용</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                    </ul>
                    <ul class="sns clear">
                        <li><a href="#"><img src="img/sns1.png"></a></li>
                        <li><a href="#"><img src="img/sns2.png"></a></li>
                        <li><a href="#"><img src="img/sns3.png"></a></li>
                        <li><a href="#"><img src="img/sns4.png"></a></li>
                    </ul>
                </div>
                <div class="footer-bottom">
                    <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                        서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                    </h5>
                    <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                    <ul class="support-logo clear">
                        <li><img src="img/footericon1.png"></li>
                        <li><img src="img/footericon2.png"></li>
                        <li><img src="img/footericon3.png"></li>
                        <li><img src="img/footericon4.png"></li>
                    </ul>
                </div>
            </div>
    </div>