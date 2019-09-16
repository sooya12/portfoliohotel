<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/nonmember.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>비회원 예약 조회 페이지</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true" />

    <div id="container">
        <div class="nonmember-section">
            <h2>비회원 예약 조회 페이지</h2>
            <h3>GUEST RESERVATION STATUS</h3>
            <div class="nonmember-box clear">
                <!-- <form action="#" method="POST"> -->
                <form name="frm" id="frm" method="post" action="/book/room/guest_res">
                    <div class="nonmember-box-logo"><img src="/img/header-logo.png"></div> 
                    <div class="nonmember-board clear">
                        <div class="nonmember-box-left">
                            <!-- email 구역 -->
                            <input type="text" id="guest_email" name="guest_email" placeholder="이메일">
                            <!-- 예약 번호 구역 -->
                            <input type="text" id="no" name="no" placeholder="예약 번호">
                        </div>
                        <div class="nonmember-board-right">
                            <input type="submit" value ="예약 확인" class="nonmemberBtn"/>
                        </div>
                    </div> 
                </form>    
            </div>    
        </div>
    </div>
    <jsp:include page="/footer" flush="true" />
</body>
</html>