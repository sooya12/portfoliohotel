<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%@ page import="pkg.*" %>
<%@ page import="room.*" %>
<%@ page import="dining.*" %>
<%@ page import="util.*" %>
<%
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
MemberVO data = (MemberVO)request.getAttribute("data");

PkgVO pparam = (PkgVO)request.getAttribute("pvo");
ArrayList<PkgVO> plist = (ArrayList<PkgVO>)request.getAttribute("plist");
int ptotCount = (Integer)request.getAttribute("ptotCount");
int ptotPage = (Integer)request.getAttribute("ptotPage");

ArrayList<RoomVO> rlist = (ArrayList<RoomVO>)request.getAttribute("rlist");

ArrayList<DiningVO> dlist = (ArrayList<DiningVO>)request.getAttribute("dlist");
%>
<div id="header">

        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index"><img src="/img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
	                                        <h2>Package</a></h2>
                                            <ul class="offer">
                                            <%
                                            	if (ptotCount == 0) {
                                            %>
                                            	<ul>
                                            		<li class="first">등록된 글이 없습니다.</li>
                                            	</ul>
                                            <%
                                            	} else {
                                            		PkgVO pdata;
                                            		for (int i=0; i<plist.size(); i++) {
                                            			pdata = plist.get(i);
                                            %>
                                            		<li><a href="/pkg/detail_page/pkg_detail_page?no=<%=pdata.getNo()%>"><%=pdata.getEname()%></li>
                                            <%
                                            		}
                                            	}
                                            %>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                            	<%
                                            	for(int i=0; i<rlist.size(); i++){
                                            	%>
                                            		<li><a href="/room/detail_sub<%=i+1%>"><%=rlist.get(i).getName() %></a></li>	
                                            	<%
                                            	}
                                            	%>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                            	<%
                                            	for(int i=0; i<dlist.size(); i++){
                                            	%>
                                            		<li><a href="/dining/detail_sub<%=i+1%>"><%=dlist.get(i).getName() %></a></li>	
                                            	<%
                                            	}
                                            	%>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="/meeting_wedding/meeting">Meeting</li>
                                                <li><a href="/meeting_wedding/wedding">Wedding</a></li>
                                                <li><a href="/meeting_wedding/familyparty">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                        <div class="pc-sub">
							<div class="pc-sub-center">
							<div class="pc-sub-box facil-left">
								<h2 class="no-line">Facilities</h2>
								<ul>
									<li><a href="/facilities#f1">The Oasis</a></li>
									<li><a href="/facilities#f2">Indoor Swimming Pool</a></li>
									<li><a href="/facilities#f3">Fitness Centre</a></li>
								</ul>
							</div>
							<div class="pc-sub-box mtop">
								<ul class="Rooms">
									<li><a href="/facilities#f4">Sauna</a></li>
									<li><a href="/facilities#f5">Troon Golf Academy</a></li>
								</ul>
							</div>
							<div class="pc-sub-box mtop facil-right">
								<ul class="Dining">
									<li><a href="/facilities#f6">Tennis Court</a></li>
									<li><a href="/facilities#f7">Futsal Field</a></li>
									<li><a href="/facilities#f8">Basketball Court</a></li>
								</ul>
							</div>
							<div class="pc-sub-box mtop facil-right">
								<ul class="Meeting & Wedding">
									<li><a href="/facilities#f9">Ice Rink</a></li>
									<li><a href="/facilities#f10">Foresta</a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="/support/notice/notice" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        호텔 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="/support/faq/faq">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        호텔에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="/support/qna/qna">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        호텔에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <li>
		                <%if(sessionMember == null){ %>
		                <a href="/membership/sign_in">Sign In</a>
		                <%}else{ %>
		                <a href="/membership/mypage">My Page</a>
		                <%} %>
	                </li>
	                <li>
	                	<a href="/book/room/guest">Guest</a>
	                </li>
                </ul>
            </div>
        </div>
    </div>