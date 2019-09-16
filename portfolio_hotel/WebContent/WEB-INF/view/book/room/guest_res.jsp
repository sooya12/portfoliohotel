<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<%@ page import="room.res.*"%>

<%
Room_resVO mdata = (Room_resVO)request.getAttribute("mdata");
ArrayList<Room_opt_resVO> odata = (ArrayList<Room_opt_resVO>)request.getAttribute("odata");
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
                <form name="reslist" id="reslist" action="/book/room/guest_res/cancel" method="post">
                    <div class="nonmember-box-logo"><img src="/img/header-logo.png"></div> 
                    <div class="nonmember-board clear">
                        <table class="room">
                        	<colgroup>
                        		<col width="15%"/>
                        		<col width="45%"/>
                        		<col width="15%"/>
                        		<col width="25%"/>
                        	</colgroup>
                        	<tr>
                        		<th>객실명</th>
                        		<td><%=mdata.getRoom_name() %></td>
                        	</tr>
                        	<tr>
                        		<th>체크인</th>
                        		<td><%=Function.toDateKorean(mdata.getCheckin()) %></td>
                        		<th>체크아웃</th>
                        		<td><%=Function.toDateKorean(mdata.getCheckout()) %></td>
                        	</tr>
                        	<tr>
                        		<th>성인</th>
                        		<td><%=mdata.getAdult() %> 명</td>
                        		<th>어린이</th>
                        		<td><%=mdata.getKid() %> 명</td>
                        	</tr>
                        </table>
                        <br/>
                        <br/>
                        <table class="option">	
                        	<colgroup>
                        		<col width="60%"/>
                        		<col width="40%"/>
                        	</colgroup>
                        	<%
                        	for(int i=0; i<odata.size(); i++) {
                        		if(odata.get(i).getCount() != 0) {
                        	%>
                        	<tr>
                        		<th><%=odata.get(i).getName() %></th>
                        		<td>[ <%=odata.get(i).getCount() %> ]</td>
                        	</tr>
                        	<%
                        		}
                        	}
                        	%>
                        </table>
                    </div> 
                    
                    <div class="nonmember-board-right">
                		<input type="submit" value="예약 취소" class="nonmember_cancelBtn"/>
                	</div>
                </form>  
            </div>    
        </div>
    </div>
    <jsp:include page="/footer" flush="true" />
</body>
</html>