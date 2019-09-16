<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="pkg.*" %>
<%@ page import="util.*" %>
<%
ArrayList<PkgVO> plist = (ArrayList<PkgVO>)request.getAttribute("plist");
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
    <link rel="stylesheet" href="/css/special_promotion.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/slick-slide.js"></script>
    <title>Document</title>

</head>
<body>
<jsp:include page="/header_menu" flush="true"/>
    <div id="container">
		<div class="banner">
			<h2>
				EXPERIENCE <br/>
				BEYOND <br/>
				EXPECTATIONS  
			</h2>
		</div>
		<div class="contents">
			<div class="contents-center">
				<h3>PACKAGE</h3>
				
				<%
				for(int i=0; i<plist.size(); i++) {
				%>
				<div class="package-box" OnClick="location.href='/pkg/detail_page/pkg_detail_page?no=<%=plist.get(i).getNo()%>'">
					<div id="f<%=i+1 %>" class="package<%=i+1 %> clear">
						<div class="package-bg"></div>
						<div class="package-text">
							<h4>
								<%=plist.get(i).getKname() %><span><%=plist.get(i).getEname() %></span>
							</h4>
							<table>
								<tr>
		                            <td>기간</td>
		                            <td class="table-a"><%=plist.get(i).getStartdate()%> ~ <%=plist.get(i).getEnddate()%></td>
		                        </tr>
		                        <tr>
		                            <td>가격</td>
		                            <td class="table-a"><%=Function.toPriceComma(plist.get(i).getPrice()) %>원</td>
		                        </tr>
		                        <tr>
		                            <td>포함내역</td>
		                            <td class="table-a"><%=plist.get(i).getPkg() %></td>
		                        </tr>
		                        <tr class="event">
		                            <td>이벤트</td>
		                            <td class="table-a-event"><%=plist.get(i).getEvent()%></td>
		                        </tr>
		                        <tr>
		                            <td>안내</td>
		                            <td class="table-a-info"><%=plist.get(i).getGuide()%></td>
		                        </tr>
							</table>
						</div>
					</div>
				</div>
				<%
				}
				%>
				
			</div>
		</div>
	</div>
	
    <jsp:include page="/footer" flush="true" />
</body>
</html>