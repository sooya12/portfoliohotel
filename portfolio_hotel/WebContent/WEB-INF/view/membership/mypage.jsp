<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="pkg.res.*" %>
<%@ page import="room.res.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="dining_res.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");

ArrayList<Pkg_resVO> plist = (ArrayList<Pkg_resVO>)request.getAttribute("plist");
int ptotCount = (Integer)request.getAttribute("ptotCount");
int ptotPage = (Integer)request.getAttribute("ptotPage");

Pkg_resVO prparam = (Pkg_resVO)request.getAttribute("prvo");

ArrayList<Room_resVO> mdata = (ArrayList<Room_resVO>)request.getAttribute("mdata");
ArrayList<ArrayList<Room_opt_resVO>> modata = (ArrayList<ArrayList<Room_opt_resVO>>)request.getAttribute("modata");

ArrayList<Dining_resVO> ddata = (ArrayList<Dining_resVO>)request.getAttribute("ddata");

ArrayList<HashMap> pdata = (ArrayList<HashMap>)request.getAttribute("pdata");

ArrayList<QnaVO> qdata = (ArrayList<QnaVO>)request.getAttribute("qlist");
int qtotCount = (Integer)request.getAttribute("qtotCount");
int qtotPage = (Integer)request.getAttribute("qtotPage");
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
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>마이페이지</title>
</head>
<script>
$(function(){
	$(".reserved_detail").css("display", "none");
	
	$(".reserved").click(function() {
		if($(this).next(".reserved_detail").css("display") == "none") {
			$(this).next(".reserved_detail").css("display", "");
		} else {
			$(this).next(".reserved_detail").css("display", "none");
		}
	});
});
</script>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        
        <div class="banner">
            <div class="mypage-section">
                    <h2>마이페이지</h2>
                    <h3>MY PAGE</h3>
                </div>
        </div>
        <div class="reservation clear">
            <h3>예약현황<span class="title-sub">RESERVATION STATUS</span></h3>
            <div class="reservation-status-left">
                <table>
                    <tr class="table-head">
                        <th>객실 예약 상품</th>
                        <th>숙박 기간</th>
                        <th>결제 금액</th>
                    </tr>
                    <%
                    if(mdata.size() != 0) {
                    	for(int i=0; i<mdata.size(); i++) {
                    %>
					<tr class="reserved">
                        <td><%=mdata.get(i).getRoom_name() %></td>
                        <td><%=Function.toDateKorean(mdata.get(i).getCheckin()) %> ~ <%=Function.toDateKorean(mdata.get(i).getCheckout()) %></td>
                        <td class="price"><%=Function.toPriceComma(mdata.get(i).getTotal_price()) %> 원</td>
                    </tr>
                    <tr class="reserved_detail">
                    	<td>예약번호 <%=mdata.get(i).getNo() %> </td>
                    	<td class="participants">
                        	성인 x <%=mdata.get(i).getAdult() %><br/>
                           	어린이 x <%=mdata.get(i).getKid() %>
                        </td>
                        <td class="option">
                        <%
                        for(int j=0; j<modata.get(i).size(); j++) {
                        %>
                        <%=modata.get(i).get(j).getName() %> x <%=modata.get(i).get(j).getCount() %><br/>
                        <%
                        }
                        %>
                        </td>
                    </tr>	
                    <%
                    	}
                    } else {
                    %>
                    <tr class="reserved">
                    	<td class="participants" colspan="3">예약된 내역이 없습니다.</td>
                    <tr>
                    <%
                    }
                    %>
                    </table>
                    <br/>
                    <table>
	                    <tr class="table-head">
	                        <th>다이닝 예약 상품</th>
	                        <th>예약일</th>
	                        <th>예약시간</th>
	                        <th>결제 금액</th>
	                    </tr>
	                    <%
	                    if(ddata.size() != 0) {
	                    	for(int i=0; i<ddata.size(); i++) {
	                    %>
						<tr class="reserved">
	                        <td><%=ddata.get(i).getDining_name() %></td>
	                        <td><%=Function.toDateKorean(ddata.get(i).getD_day()) %></td>
	                        <td><%=ddata.get(i).getD_time() %></td>
	                        <td class="price"><%=Function.toPriceComma(ddata.get(i).getTotal_price()) %> 원</td>
	                    </tr>
	                    <tr class="reserved_detail">
	                    	<td>예약번호 <%=ddata.get(i).getNo() %> </td>
	                    	<td class="participants" colspan="3">
	                        	성인 x <%=ddata.get(i).getAdult() %><br/>
	                           	어린이 x <%=ddata.get(i).getKid() %>
	                        </td>
	                    </tr>	
	                    <%	
	                    	}
	                    } else {
	                    %>
	                    <tr class="reserved">
	                    	<td class="participants" colspan="4">예약된 내역이 없습니다.</td>
	                    <tr>
	                    <%
	                    }
	                    %>
                    </table>                    
                    <br/>
                    <table>
                    <tr class="table-head">
                        <th>패키지 예약 상품</th>
                        <th>수량</th>
                        <th>수령일</th>
                    </tr>
                    <tr class="reserved">
                        <td>
                        <%
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        %>
                        	<li><%=prdata.getPkg_name()%></li>
                        <%
                        		}
                        	}
                        %>
                        </td>
                        <td class="participants">
                        <%
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        %>
                        	<li><%=prdata.getPkg_count()%></li>
                        <%
                        		}
                        	}
                        %>                        
                        </td>
                        <td class="participants">
                        <%
                        	if (ptotCount == 0) {
                        %>
                        	<ul>
                        		<li class="first">예약한 상품이 없습니다.</li>
                        	</ul>
                        <%
                        	} else {
                        		Pkg_resVO prdata;
                        		for (int i=0; i<plist.size(); i++) {
                        			prdata = plist.get(i);
                        %>
                        	<li><%=prdata.getUse_date()%></li>
                        <%
                        		}
                        	}
                        %>                              
                        </td>
                    </tr>                                                                             
                </table>
            </div>
            <div class="reservation-status-right">
                <div class="my-info">
                  <h4>
  
	<%=Function.checkNull(sessionMember.getF_name())%> <%=sessionMember.getL_name()%> 님<br/>
	
                      환영합니다 !
                    </h4>
                    <table>
                        <tr>
                            <td>회원등급</td>
                            
                            <td><%=CodeUtil.getMgrade(sessionMember.getGrade())%></td>
                        </tr> 
                   
                        <tr>
                            <td>포인트</td>
                            <td><%=sessionMember.getPoint()%> P</td>
                            <%-- <th scope="row"><label for="">포인트</label></th>
							<td colspan="3"><%=data.getPoint()%></td> --%>
                        </tr>
                    </table>
                </div>
                <ul class="my-info-list">
                    <li><a href="edit_account">개인정보 수정</a></li>
                    <li><a href="delete_account">회원탈퇴</a></li>
                    
                    <li><a href="/membership/logout">로그아웃</a></li>
                </ul>
            </div>
        </div>
        <div class="point">
            <h3>포인트 내역<span class="title-sub">POINT</span></h3>
            <div class="point-box">
                <table>
                	<%
                	for(int i=0; i<pdata.size(); i++) {
                	%>
                    <tr>
                        <td><span class="plus">+</span> <%=pdata.get(i).get("point") %>P [예약번호 <%=pdata.get(i).get("no") %> ]</td>
                        <td><%=pdata.get(i).get("savingdate") %></td>
                    </tr>
                    <%
                	}
                    %>
                </table>
            </div>
        </div>
        <div class="my-question">
            <h3>나의 질문<span class="title-sub">MY QUESTION</span></h3>
            <div class="my-question-box">
                <table>
                	 	<%
							if (qtotCount == 0) {
						%>
						<tr>
								<td class="first" colspan="8">등록된 글이 없습니다.</td>
						</tr>
						<% 
							} else {
								String targetUrl = "";
								String topClass = "";
								QnaVO qnadata;
								String bgColor ="";
															
								for (int i=0; i<qdata.size(); i++) {
											qnadata = qdata.get(i);
											/* targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+qdata.getTargetURLParam("qna_read", qdata, qnadata.getNo())+"'\""; */
											bgColor = (qnadata.getReply()==0)?"#ffffff":"#e8e8e8";
																
						%>
                    <tr onclick="location.href='http://localhost:8080/support/qna/qna_read?no=<%=qnadata.getNo() %>'" style="cursor:hand" >
                            <td class="title"><a href="/support/qna/qna_read?no=<%=qnadata.getNo() %>"><%=qnadata.getTitle() %></a></td>
                            <td><a href="#"><%=DateUtil.getDateFormat(qnadata.getRegdate())%></a></td> 
                    </tr>
                     <%
									}
								 }
					%>
                </table>
            </div>
        </div>
        <div class="membership-benefit">
                <h3>멤버십 등급별 특전<span class="title-sub">MEMBERSHIP CLASS BENEFIT</span></h3>
            <div class="membership-benefit-box clear">
                <div class="membership-benefit-box-center clear">
                
                <%if(sessionMember.getGrade() == 1) {%>
                    <div class="classic on">   
                    <div class="benefit-img">                 
                            <p>CLASSIC</p>
                        </div>
                        <div class="benefit-text">
                            <p>1번 투숙 또는 3박 이상 이용</p>
                            <p>객실이용 금액 2% 적립</p>
                        </div>
                    </div>
                    <%}else { %>                 
                    <div class="classic"> 
                        <div class="benefit-img">
                        
                                                
                            <p>CLASSIC</p>
                        </div>
                        <div class="benefit-text">
                            <p>1번 투숙 또는 3박 이상 이용</p>
                            <p>객실이용 금액 2% 적립</p>
                        </div>
                    </div>
                    <%} %>
                    
                    <%if(sessionMember.getGrade() == 2) {%>
                    <div class="vip on">
                            <div class="benefit-img">
                                <p>VIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>3번 투숙 또는 6박 이상 이용</p>
                                <p>객실이용 금액 5% 적립</p>
                            </div>
                    </div>
                    <%}else { %> 
                    <div class="vip">
                            <div class="benefit-img">
                                <p>VIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>3번 투숙 또는 6박 이상 이용</p>
                                <p>객실이용 금액 5% 적립</p>
                            </div>
                    </div>
                    <%} %>
                    
                    <%if(sessionMember.getGrade() == 3) {%>
                    <div class="vvip on">
                            <div class="benefit-img">
                                <p>VVIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>7번 투숙 또는 12박 이상 이용</p>
                                <p>객실이용 금액 7% 적립</p>
                            </div>
                    </div>
                    <%}else{ %>
                    <div class="vvip">
                            <div class="benefit-img">
                                <p>VVIP</p>
                            </div>
                            <div class="benefit-text">
                                <p>7번 투숙 또는 12박 이상 이용</p>
                                <p>객실이용 금액 7% 적립</p>
                            </div>
                    </div>
                    <%} %>
                    
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>
</html>