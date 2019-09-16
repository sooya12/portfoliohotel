<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.notice.*"%>
<%@ page import="util.*"%>
<%
NoticeVO nparam = (NoticeVO)request.getAttribute("nvo");
ArrayList<NoticeVO> nlist = (ArrayList)request.getAttribute("nlist");
int notice_totCount = (Integer)request.getAttribute("notice_totCount");
int notice_totPage = (Integer)request.getAttribute("notice_totPage");
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
    <link rel="stylesheet" href="/css/notice.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_로그인페이지</title>
<script>
function goSearch() {
	$("#searchForm").submit();
}
</script>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>Support</h2>
                    <h3>Notice</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>

        <div class="notice">
            <div class="support-list">
                <ul class="support-list-center">
                    <li class="on"><a href="/support/notice/notice">공지사항</a></li>
                    <li><a href="/support/faq/faq">FAQ</a></li>
                    <li><a href="/support/qna/qna">Q&A</a></li>
                </ul>
            </div>
            <div class="notice-table">
                <div class="table-box">
                    <table>
                        <tr class="table-head">
                            <th scope="col" class="firlst">제목</th>
                            <th scope="col" class="last">등록일</th>
                        </tr>
                        <%
                        	if (notice_totCount == 0) {
                        %>
                        	<tr>
                        		<td colspan="2">등록된 공지사항이 없습니다.</td>
                        	</tr>
                        <%
                        	} else {
                        		String targetUrl = "";
                        		NoticeVO data;
								for (int i=0; i<nlist.size(); i++) {
									targetUrl = "style='cusor:pointer;' onclick=\"location.href='"+nparam.getTargetURLParam("notice_watchonly", nparam, nlist.get(i).getNo())+"'\"";
                        %>
                        <%
                        	if (nlist.get(i).getTop() == 2) {
                        		targetUrl = "style='cursor:pointer; background-color:#bebebe', onclick=\"location.href='"+nparam.getTargetURLParam("notice_watchonly", nparam, nlist.get(i).getNo())+"'\"";
                        	}
                        %>
                        <%
                        	if (nlist.get(i).getDisplay() == 1) {
                        %>
                        	<tr>
								<td <%=targetUrl%>> <a href="#"><%=nlist.get(i).getTitle() %></a></td>
								<td <%=targetUrl%> class="table-date"><%=DateUtil.getDateFormat(nlist.get(i).getRegdate()) %></td>
							</tr>
						<%
                        	}
						%>
						<%
								}
                        	}
						%>
                    </table>
                </div>
                       <%=Page.userIndexList(nparam.getReqPageNo(), notice_totPage, request)%>
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