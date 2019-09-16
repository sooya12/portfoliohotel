<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.res.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
int day_stay = (Integer)request.getAttribute("day_stay");
Room_resVO read = (Room_resVO)request.getAttribute("read");
ArrayList<Room_opt_resVO> list_o = (ArrayList<Room_opt_resVO>)request.getAttribute("list_o");
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
    <link rel="stylesheet" href="/css/confirm.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>객실 예약 완료</title>
</head>
<body>
<jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>예약 완료</h2>
                    <h3>Completion the Reservation</h3>
                </div>
        </div>

            <div class="section-edit">
                <h1>* 객실 예약 확정 *</h1>
                <div class="completion-form">
                    <!-- 이름 - p span 태그 이용 -->
                    <h3><span><%=read.getGuest_lastname() %><%=read.getGuest_firstname() %></span>님의 예약이 확정되었습니다.</h3>

                    <ul class="guest clear">
                            <li>투숙객 이름</li>
                            <li class="second"><%=read.getGuest_lastname() %><%=read.getGuest_firstname() %></li>
                    </ul>
                    <ul class="reservation_number clear">
                            <li>예약번호</li>
                            <li class="second"><%=read.getNo() %></li>
                    </ul>
                    <ul class="room_name clear">
                            <li>객실이름</li>
                            <li class="second"><%=read.getRoom_name() %></li>
                    </ul>
                    <ul class="check_in clear">
                            <li>체크인 날짜</li>
                            <li class="second"><%=Function.toDateKorean(read.getCheckin()) %></li>
                    </ul>
                    <ul class="check_out clear">
                            <li>체크아웃 날짜</li>
                            <li class="second"><%=Function.toDateKorean(read.getCheckout()) %></li>
                    </ul>
                    <ul class="room_number clear">
                        <li>객실수 및 숙박일수</li>
                        <li class="second">객실 1개 [<%=day_stay %>박]</li>
                    </ul>
                    <ul class="check_out clear">
                            <li>인원수</li>
                            <li class="second">성인 <%=read.getAdult() %>명 / 어린이 <%=read.getKid() %>명 [총 <%=read.getAdult() + read.getKid() %>명]</li>
                    </ul>

                    <div class="option">
                        <h3>* 추가옵션</h3>
                        <%
                        for(int i=0; i<list_o.size(); i++) {
                        %>
                        <ul class="option-form clear">
                                <li><%=list_o.get(i).getName() %></li>
                                <li class="second">[<%=list_o.get(i).getCount() %>개]</li>
                        </ul>
                        <%
                        }
                        %>
                    </div>

                    <ul class="payment clear">
                        <h3>* 총 결제금액</h3>
                        <li>KRW <%=Function.toPriceComma(read.getTotal_price()) %>원</li>
                        <li class="second">세금 및 봉사료 KRW <%=Function.toPriceComma(read.getCharge_price()) %>원 포함</li>
                    </ul>
                </div>
            </div>

    </div>
    <jsp:include page="/footer" flush="true" />
</body>
</html>