<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dining_res.*"%>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%
Dining_resVO read = (Dining_resVO) request.getAttribute("read");
MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo");
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
    <title>다이닝 예약 완료</title>
    <script>
    function setComma(v) {
    	var rV = "";
    	var vS = new String(V), leng=vS.length;
    	
    	var remnant = leng%3;
    	if(remnant==0) remnant=3;
    	
    	while( leng>3 ) {
    		rV += vS.substr(0,remnant)+",";
    		vS = vS.substr(remnant);
    		
    		leng=vS.length;
    		remnant=3;
    	}
    	rV += vS;
    	
    	return rV;
    }
    </script>
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
                <h1>* 다이닝 예약 확정 *</h1>
                <div class="completion-form">
                    <!-- 이름 - p span 태그 이용 -->
                    <%
                    if(member_vo != null) {
                    %>
                    <h3><span><%=member_vo.getF_name()%><%=member_vo.getL_name()%></span>님의 예약이 확정되었습니다.</h3>
                    <%	
                    } else {
                    %>
                     <h3>예약이 확정되었습니다.</h3>
                    <%	
                    }
                    %>

                    <ul class="guest clear">
                            <li>투숙객 이름</li>
                            <li class="second"><%=read.getGuest_lname()%><%=read.getGuest_fname()%></li>
                    </ul>
                    <ul class="reservation_number clear">
                            <li>예약번호</li>
                            <li class="second"><%=read.getNo()%></li>
                    </ul>
                    <ul class="dining_name clear">
                            <li>다이닝 이름</li>
                            <li class="second"><%=read.getDining_name()%></li>
                    </ul>
                    <ul class="dining_number clear">
                        	<li>다이닝 예약날짜</li>
                        	<li class="second"><%=read.getD_day()%></li>
                    </ul>
                    <ul class="check_in clear">
                            <li>다이닝 예약시간</li>
                            <li class="second"><%=read.getD_time()%></li>
                    </ul>
                    <ul class="check_out clear">
                            <li>인원수</li>
                            <li class="second">성인 <%=read.getAdult() %>명 / 어린이 <%=read.getKid() %>명 [총 <%=read.getAdult() + read.getKid() %>명]</li>
                    </ul>
                    <ul class="check_in clear">	
                    	<li></li>
                    	<li></li>
                    </ul>
                    <ul class="check_in clear">
                            <li>예약신청일</li>
                            <li class="second"><%=DateUtil.getStrTimestamp(read.getRegdate())%></li>
                    </ul>
                    <ul class="payment clear">
                        <h3>* 총 결제금액</h3>
                        <li>KRW <%=Function.toPriceComma(read.getTotal_price())%>원</li>
                        <%
                        double charge_d = read.getTotal_price()*0.1;
                        int charge = (int)charge_d;
                        %>
                        <li class="second">세금 및 봉사료 KRW <%=Function.toPriceComma(charge)%>원 포함</li>
                    </ul>
                </div>
            </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
</html>