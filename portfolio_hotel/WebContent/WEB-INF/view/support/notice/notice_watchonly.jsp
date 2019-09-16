<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.notice.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
NoticeVO notice_param = (NoticeVO)request.getAttribute("notice_vo");
NoticeVO notice_data = (NoticeVO)request.getAttribute("notice_data");
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
    <link rel="stylesheet" href="/css/notice-form.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>공지사항-작성자페이지</title>
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
        </div>

        <div class="notice-form">
                <div class="notice-area">
                <form name="index" action="notice" method="get">
                        <h1>제목</h1>
                        <div class="notice-title"><%=notice_data.getTitle() %></div>
                        <ul class="base_info clear">
                            <li>
                                <h1>등록일자</h1>
                                <div class="notice-title"><%=DateUtil.getDateFormat(notice_data.getRegdate()) %></div>
                            </li>
                            <li>
                                <h1>조회수</h1>
                                <div class="notice-title"><%=notice_data.getReadno() %></div>
                            </li>
                        </ul>                        
                        <h1>내용</h1>
                        <div class="notice-cont">
                        	<img src="/upload/notice/<%=notice_data.getFile()%>" style="width:100%; height:auto;"></img><br/><br/>
                        	<%=notice_data.getContents() %>
                        </div>   
                        <h1>첨부파일</h1>
                        <div class="notice-title">
                        <% if(notice_data.getFile_org() != null && notice_data.getFile_org() != "")  { %>
                        <a href="<%= Function.downloadUrl(SiteProperty.NOTICE_UPLOAD_PATH, java.net.URLEncoder.encode(notice_data.getFile_org(), "UTF-8"), notice_data.getFile()) %>" target="_blank"><%=notice_data.getFile_org()%></a></div>
                        <%
                        }
                        %>
                        <input type="submit" value="목록">
                  </form>
                </div>
        </div>
 
    </div>
