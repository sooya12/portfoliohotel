<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/slick.css">
        <link rel="stylesheet" href="/css/slick-theme.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/default.css">
        <link rel="stylesheet" href="/css/header.css">
        <link rel="stylesheet" href="/css/promotion.css">
        <link rel="stylesheet" href="/css/footer.css">
        <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="/js/gnb.js"></script>
        <script type="text/javascript" src="/js/slick.js"></script>
        <script type="text/javascript" src="/js/slick-slide.js"></script>
        <script type="text/javascript" src="/js/aos.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            
                //AOS 플러그인 시작구문
                AOS.init();            
            
                 //마우스 휠 플러그인 사용구문
 
                //delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

                $("#container > div").mousewheel(function(event,delta){    
                        event.preventDefault();    

                        //마우스 휠을 올렸을때	
                        if (delta > 0) {  
                            var prev = $(this).prev().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":prev});
                        }
                    
                        //마우스 휠을 내렸을때	
                        else if (delta < 0) {  
                           var next = $(this).next().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":next});
                        }
                });
            });
        </script>
    <title>The Reasonable</title>
</head>
<body>
    <%@ include file="../../header_menu.jsp" %>
    
    <div id="container">
        <div class="banner reasonable">
            <div class="banner-center">
                <div class="banner-text">
                    <h2>더 리즈너블
                        <span>The Reasonable</span>
                    </h2>
                    <h3>밤이 깊어질수록 매력을 더하는<br/> 문 바에서 봄 바람이 불어오는 밤에 즐거움을 더할 위스키 세트를 선보입니다.
                    </h3>
                    <p>
                        싱글 몰트 위스키의 향기와 조화를 이루는 치즈&과일 플래터, 소프트 드링크로 구성된 ‘더 리즈너블’과 함께 더욱 깊이 있는 밤을 즐겨보세요.
                    </p>
                </div>
            </div>
        </div>
        <div class="contents-center">
            <div class="logo-post"><img src="/img/promotion/promotion-logo.jpg"></div>
            <div class="contents-info clear">
                <div class="contents-left">
                    <table>
                        <tr>
                            <td class="table-list">기간</td>
                            <td>상시 운영</td>
                        </tr>
                        <tr>
                            <td class="table-list">시간</td>
                            <td>18:00 ~ 02:00 (Last Oder 01:30)</td>
                        </tr>
                        <tr>
                            <td class="table-list info">메뉴</td>
                            <td class="td-lh">문 세트 374,000원 <br/>
                                - 발베니(Balvenie) 12년 1병  <br/>
                                - 소프트 드링크 2잔  <br/>
                                - 과일 플래터 또는 치즈 플래터 중 택 1  <br/>
                                <br/>
                                남산 세트 437,000원  <br/>
                                - 글렌피딕(Glenfiddich) 15년 1병  <br/>
                                - 소프트 드링크 2잔  <br/>
                                - 과일 플래터 또는 치즈 플래터 중 택 1
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list place">장소</td>
                            <td>문 바 (20F)</td>
                        </tr>
                    </table>
                </div>
                <div class="contents-right">
                    <h3>예약 및 이용문의</h3>
                    <h4>전화</h4>
                    <h4>02 2250 8000</h4>
                    <a href="/book/dining_pkg_book">온라인 예약</a>
                </div>
            </div>
        </div>
    </div>
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
                    <li><a href="#"><img src="/img/sns1.png"></a></li>
                    <li><a href="#"><img src="/img/sns2.png"></a></li>
                    <li><a href="#"><img src="/img/sns3.png"></a></li>
                    <li><a href="#"><img src="/img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="/img/footericon1.png"></li>
                    <li><img src="/img/footericon2.png"></li>
                    <li><img src="/img/footericon3.png"></li>
                    <li><img src="/img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>