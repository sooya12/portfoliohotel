<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dining.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<%
DiningVO param = (DiningVO) request.getAttribute("vo");
DiningVO data = (DiningVO) request.getAttribute("data");
%>

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
    <title>>The Oasis Summer Package</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        <div class="banner oasis">
            <div class="banner-center">
                <div class="banner-text">
                    <h2><%=data.getName() %></h2>
                    <h3>호텔의 시그니처 레스토랑 '페스타 바이 민구'는<br>
                    	내추럴하고 트렌디한 ‘어번 그린 다이닝’을 <br>
                    	선보입니다. <br><br><br>
                    	초록빛 정원과 오아시스 풀장을 <br>
                    	품고 있는 프라이빗 빌라에서 미쉐린 2스타 <br>
                    	레스토랑 밍글스의 오너 셰프이자 페스타 총괄 <br>
                    	셰프인 강민구 셰프의 터치로 완성되는 자유분방하면서
                   	         정성이 담긴 유러피안 캐주얼 푸드를 <br>
                   	         경험해보세요. 
					</h3>
                </div>
            </div>
        </div>
        <div class="contents-center">
            <div class="logo-post"><img src="../img/promotion/promotion-logo.jpg"></div>
            <div class="contents-info clear">
                <div class="contents-left">
                    <table>
                    	<tr>
                            <td class="table-list">운영기간 시작일</td>
                            <td><h2><%=data.getStartdate()%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">운영기간 종료일</td>
                            <td><h2><%=data.getEnddate()%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">예약 가능기간</td>
                            <td><h2><%=data.getBook_period()%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">가격</td>
                            <td><h2><%=data.getPrice() %></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">안내</td>
                            <td class="td-lh">
                                <h2><%=data.getInfo()%></h2>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="contents-right">
                    <h3>예약 및 이용문의</h3>
                    <h4>전화</h4>
                    <h4>02 0000 0000</h4>
                    <%
                    String reserStartDate = DateUtil.getDayDateAdd(data.getBook_period()*-1, data.getStartdate()); 
                    String today = DateUtil.getToday();
                    //out.print(DateUtil.getToday());
                    //out.print(reserStartDate);
                    //out.print(DateUtil.getDiff(DateUtil.getToday(), reserStartDate));
                    if (DateUtil.getDiff(today, reserStartDate) >= 0 && DateUtil.getDiff(today, data.getEnddate()) < 0) {
                    %>
                    <a href="/dining/dining_origin_book.do">온라인 예약</a>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
</html>