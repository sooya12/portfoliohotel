<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dining.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<%
DiningVO dvo = (DiningVO) request.getAttribute("dvo");
DiningVO ddata = (DiningVO) request.getAttribute("ddata");
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
    <title><%=ddata.getName() %></title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        <div class="banner dining<%=ddata.getNo()%>">
            <div class="banner-center">
                <div class="banner-text">
                    <h2><%=ddata.getName() %></h2>
                    <h3 class="dining"><%=ddata.getInclusion() %></h3>
                </div>
            </div>
        </div>
        <div class="contents-center">
            <div class="logo-post"><img src="/img/logo_bg.png"></div>
            <div class="contents-info clear">
                <div class="contents-left">
                    <table>
                    	<tr>
                            <td class="table-list">운영기간 시작일</td>
                            <td><h2><%=ddata.getStartdate()%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">운영기간 종료일</td>
                            <td><h2><%=ddata.getEnddate()%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">예약 가능기간</td>
                            <td><h2><%=DateUtil.getDayDateAdd(-ddata.getBook_period(), ddata.getStartdate())%> ~ <%=DateUtil.getDayDateAdd(-ddata.getBook_period(), ddata.getEnddate())%></h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">가격</td>
                            <td><h2><%=Function.toPriceComma(ddata.getPrice()) %> 원 ~</h2></td>
                        </tr>
                        <tr>
                            <td class="table-list">안내</td>
                            <td class="td-lh">
                                <h2><%=ddata.getInfo()%></h2>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="contents-right">
                    <h3>예약 및 이용문의</h3>
                    <h4>전화</h4>
                    <h4>02 0000 0000</h4>
                    <%
                    String reserStartDate = DateUtil.getDayDateAdd(ddata.getBook_period()*-1, ddata.getStartdate()); 
                    String today = DateUtil.getToday();
                    //out.print(DateUtil.getToday());
                    //out.print(reserStartDate);
                    //out.print(DateUtil.getDiff(DateUtil.getToday(), reserStartDate));
                    if (DateUtil.getDiff(today, reserStartDate) >= 0 && DateUtil.getDiff(today, ddata.getEnddate()) < 0) {
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