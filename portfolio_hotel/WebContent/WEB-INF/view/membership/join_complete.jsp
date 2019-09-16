<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
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
    <link rel="stylesheet" href="/css/join_complete.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_로그인페이지</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true" />
    
    <div id="container">
        <!-- account section 영역 -->
        <div class="account-section">
            <h2>회원가입 완료</h2>
            <h3>Join Complete</h3>
        <!-- account section title 영역 끝 -->
            <div class="account-box clear">
                <h2>환영합니다 !</h2>
                <h3>
                
                
                
               <%=data.getF_name()%> <%=data.getL_name()%>님, 회원가입을 축하합니다.</h3>
               
               <%
               session.invalidate();
               %>
               
            </div><!--acoount-box 끝-->
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
</html>