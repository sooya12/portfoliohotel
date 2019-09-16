<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="room.*" %>
<%@ page import="dining.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
MemberVO data = (MemberVO)request.getAttribute("data");

ArrayList<RoomVO> list_r = (ArrayList<RoomVO>)request.getAttribute("list_r");
ArrayList<DiningVO> list_d = (ArrayList<DiningVO>)request.getAttribute("list_d");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/jquery-ui.css">
        <link rel="stylesheet" href="/css/slick.css">
        <link rel="stylesheet" href="/css/slick-theme.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/default.css">
        <link rel="stylesheet" href="/css/header.css">
        <link rel="stylesheet" href="/css/main-layout.css">
        <link rel="stylesheet" href="/css/footer.css">
        <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="/js/jquery-ui.js"></script>
        <script type="text/javascript" src="/js/gnb.js"></script>
        <script type="text/javascript" src="/js/logined-sub.js"></script>
        <script type="text/javascript" src="/js/banner_slider.js"></script>
        <script type="text/javascript" src="/js/slick.js"></script>
        <script type="text/javascript" src="/js/slick-slide.js"></script>
        <script type="text/javascript" src="/js/aos.js"></script>
        <script type="text/javascript" src="/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            
                //AOS 플러그인 시작구문
                AOS.init();            
            
                 //마우스 휠 플러그인 사용구문
 
                //delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

                $("#container > div:not(.nowheel)").mousewheel(function(event,delta){    
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

                $("#checkin_select").datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "0D",
                    prevText: "이전달",
                    nextText: "다음달",
                    onClose: function( selectedDate ) {
                    	$("#checkout_select").datepicker( "option", "minDate", selectedDate );
					}                
                });
                
                $("#checkout_select").datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "1D",
                    prevText: "이전달",
                    nextText: "다음달",
                    onClose: function( selectedDate ) {
                        $("#checkin_select").datepicker( "option", "maxDate", selectedDate );
                    }   
                });
                
                calculate();
        		$("#day_stay").val(day_stay);
        		$("#checkin").val($("#checkin_select").val());
        		$("#checkout").val($("#checkout_select").val());
                 
                //메인페이지 객실예약 선택 달력플러그인 사용
                $("#checkin_select, #checkout_select").change(function() {
            		calculate();
            		$("#day_stay").val(day_stay);
            		$("#checkin").val($("#checkin_select").val());
            		$("#checkout").val($("#checkout_select").val());
				});
            });
            
            function calculate() {
            	arr_in = $("#checkin_select").val().split("-");
            	arr_out = $("#checkout_select").val().split("-");
            	time_in = new Date(arr_in[0], arr_in[1], arr_in[2]);
            	time_out = new Date(arr_out[0], arr_out[1], arr_out[2]);
            	day_stay = (time_out.getTime() - time_in.getTime())/(1000*60*60*24);
            }
        </script>
    <title>Portfolio Hotel</title>
</head>

<body>
	
	<%if(sessionMember != null) {%>
          <div id="logined">
            <div class="logined-box">
                <h2 class="close-btn"><a href="#">x</a></h2>
                <h3><%=Function.checkNull(sessionMember.getF_name())%> <%=sessionMember.getL_name()%><span>님 안녕하세요.</span></h3>
                <p class="mypage"><a href="/membership/mypage">마이페이지 <img src="img/white-arrow.png" class="white-arrow"></a></p>
                <table>
               
                    <tr>
                        <td class="left">등급</td>
                        <td class="right"><%=CodeUtil.getMgrade(sessionMember.getGrade())%></td>
                    </tr>
                    <tr>
                        <td class="left">포인트</td>
                        <td class="right"><%=sessionMember.getPoint()%> P</td>
                    </tr>
                    <tr>
                        <td class="left">회원번호</td>
                        <td class="right"><%=sessionMember.getNo()%></td>
                    </tr>
                </table>
            </div>      
        </div>  
    <%} %>
   
    <jsp:include page="/header_menu" flush="true"/>
    
    

    <!-- 컨테이너 영역 시작 -->
    <div id="container">

        <!-- 01베너 (슬라이드 베너) -->
        <div class="banner">
            <div class="slider">
                <div class="banner-bg1 selected">
                    <h4>PORTFOLIO<br/><span>HOTEL</span>
                    </h4>
                </div>
                <div class="banner-bg2">
                        <h4>PORTFOLIO<br/><span>HOTEL</span>
                        </h4>
                </div>
                <div class="banner-bg3">
                        <h4>PORTFOLIO<br/><span>HOTEL</span>
                        </h4>
                </div>
            </div>
            <ul class="slider-btn clear">
                <li class="on"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
            </ul>

            <!-- 간편예약조회 구역 -->
            <div class="direct-reservation">
                <h2>RESERVATION</h2>
                <div class="d-r-input clear"><!-- direct-reservation 단어 너무길어서 d-r 로 줄임 -->
                        <form name="frm" id="frm" action="/book/room/check_room/" method="post">
                            <div class="d-r-input1">
                                <input type="text" name="checkin_select" id="checkin_select" value="<%=DateUtil.getToday()%>">
                                <p>~</p>
                                <input type="text" name="checkout_select" id="checkout_select" value="<%=DateUtil.getDayDateAdd(1, DateUtil.getToday())%>"> 
                                <span class="d-r-span">성인</span>
                                <select name="adult">
                                    <option value="1">1명</option>
                                    <option value="2" selected>2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                </select> 
                                <span class="d-r-span">어린이</span>
                                <select name="kid">
                                    <option value="0" selected>0명</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                </select> 
                            </div>
                            <div class="d-r-input2">
                                <!-- <input type="submit" value="예약 조회"> -->
                                
                                <input type="hidden" name="checkin" id="checkin" value=""/>
                                <input type="hidden" name="checkout" id="checkout" value=""/>
                                <input type="hidden" name="day_stay" id="day_stay" value=""/>
                                <input type="hidden" name="adult" id="adult" value=""/>
                                <input type="hidden" name="kid" id="kid" value=""/>
                                
                                <a onclick="javascript:$('#frm').submit();">예약조회</a>
                            </div>
                        </form>
                </div>
            </div>            
        </div>

        <!-- 02호텔 상품 소개 구역 -->
        <div id="introduce">
            <div class="introduce">
                <ul class="intro-list clear">

                    <li class="intro-title">
                        <h2>HOTEL'S OFFERING</h2>
                    </li>

                    <li class="special_offer">
                        <p>PACKAGE</p>
                        <div class="bg">
                                <a href="/pkg/special_promotion">
                                    <div class="hover-box">
                                        <p>PACKAGE</p>
                                        <img src="img/ico_arrow.png">
                                    </div>
                                </a>
                        </div>
                        
                    </li>

                    <li class="fitness">
                        <p>MEETING</p>
                        <div class="bg">
                                <a href="/meeting_wedding/meeting">
                                        <div class="hover-box">
                                            <p>MEETING</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="spa_relax">
                        <p>WEDDING</p>
                        <div class="bg">
                                <a href="/meeting_wedding/wedding">
                                        <div class="hover-box">
                                            <p>WEDDING</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="dining">
                        <p>DINING</p>
                        <div class="bg">
                                <a href="/pkg/dining/dining_offer">
                                        <div class="hover-box">
                                            <p>DINING</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="event_gift">
                        <p>FACILITIES</p>
                        <div class="bg">
                                <a href="/facilities">
                                        <div class="hover-box">
                                            <p>FACILITIES</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- 03스페셜 프로모션 구역 (패키지상품 슬라이드) -->
        <div id="special_promotion">

            <!-- 어두운 배경 -->
            <div class="sp-pro-bg"></div>

            <div class="special_promotion">
                <!-- 제목 -->
                <h2>DINING</h2>

                <!-- 슬라이드 구역 -->
                <div class="promotion_panel">
                    <div class="promotion_list clear">
                    
                    <%
                	for(int i=0; i<list_d.size(); i++) {
                		if(i%2 == 0) {
                	%>
                		<div class="pro_list1 pro_list">
                            <a href="/dining/detail_sub<%=i+1%>">
                                <img src="/img/dining/p_detail/p_<%=i+1 %>.jpg"> 
                                <div class="promotion_text">
                                    <p><%=list_d.get(i).getName() %></p>
                                    <h6><%=list_d.get(i).getInclusion() %></h6>
                                    <p class="pro_price"><%=Function.toPriceComma(list_d.get(i).getPrice()) %>원 부터</p>
                                </div>
                                <div class="pro-top-box">
                                    <p>Dining</p>
                                </div>
                            </a>
                        </div>
                	<%			
                		} else {
                	%>
                		<div class="pro_list2 pro_list">
                            <a href="/dining/detail_sub<%=i+1%>">
                                <img src="/img/dining/p_detail/p_<%=i+1 %>.jpg"> 
                                <div class="promotion_text">
                                    <p><%=list_d.get(i).getName() %></p>
                                    <h6><%=list_d.get(i).getInclusion() %></h6>
                                    <p class="pro_price"><%=Function.toPriceComma(list_d.get(i).getPrice()) %>원 부터</p>
                                </div>
                                <div class="pro-top-box">
                                    <p>Dining</p>
                                </div>
                            </a>
                        </div>
                	<%			
                		}
                	}
                	%>
                    </div>
                </div>
            </div>
        </div>

       <!-- 04객실 소개 슬라이드 구역  -->
        <div id="room_suits">
                <h2>ROOMS</h2>
                <div class="room_suits clear">
                    
                    <!--객실 사진 보여줄 구역-->
                    <div class="panel">
                        <div class="room-wrap">
                            <div class="room-pic1 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic2 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic3 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic4 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic5 rooms"></div>
                        </div>
                    </div>
                    <!-- 객실 화면 반얀트리 텍스트-->
                    <div class="top-title">
                        <h3>HOTEL'S ROOM</h3>
                    </div>
                    <!--객실 소개 내용과 예약버튼 들어갈 구역-->
                    <div class="room-intro-wrap">
                    	<%
                    	for(int i=0; i<list_r.size(); i++) {
                    	%>
                    	<div class="room_intro">
                            <h3><%=list_r.get(i).getName() %></h3>
                            <p><%=list_r.get(i).getInstruction() %>
                            <h6 class="tel">전화 <span>02-1234-5678</span></h6>
                            <h6 class="email">이메일 <span>support@portfoliohotel.com</span></h6>
                    
                            <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="/room/detail_sub<%=i+1%>">MORE</a></li>
                               <!--  <li class="room_book"><a href="/book/room/check_room">RESERVATION</a></li> -->   
                            </ul>
                        </div>  
                    	<%	
                    	}
                    	%>
                    </div>

                    <!-- 객실화면 좌우로 넘어가기 위한 버튼 구역-->
                    <div class="room-btn clear">
                        <button class="slick-prev"></button>
                        <button class="slick-next"></button>
                    </div>
                    <!-- 객실 하단 정보들어갈 구역 -->
					<ul class="room-bot-info clear">
						<li class="room-left-info">
							<h3>INFORMATION</h3>
							<ul class="table1 clear">
								<li>
									<p>
										<span class="th">체크인</span><span>15:00</span>
									</p>
									<p>
										<span class="th">체크아웃</span><span>12:00</span>
									</p>
								</li>
							</ul>
							<ul class="table1-1 clear">
								<li>
									<p>
										<span class="th">전망</span><span>남산 & 시티뷰</span>
									</p>
									<p>
										<span class="th">객실타입</span><span>원룸 & 투룸</span>
									</p>
								</li>
							</ul>
						</li>
						<li class="room-right-info">
							<h3>FACILITIES</h3>
							<ul class="table2 clear">
								<li>
									<p class="wid-1">·피트니스 클럽</p>
									<p class="wid-2">·실내 수영장</p>
									<p>·몽상클레르 10%할인</p>
								</li>
	
								<li>
									<p class="wid-1">·사우나 이용</p>
									<p class="wid-2">·갤러리 10%할인</p>
									<p>·반얀트리 스파</p>
								</li>
							</ul>
						</li>
					</ul>
			</div>
        </div>

        <!-- 05시설소개 구역  -->
        <div id="tyc" class="nowheel">

            <!-- 어두운배경 -->
            <div class="tyc-bg-opacity"></div>

            <!-- 가운데 정렬 -->
            <div class="tyc-center">

                <div class="tyc-title">
                    <h2>THINGS YOU CAN ENJOY</h2>
                    <h2>AT PORTFOLIO HOTEL</h2>
                </div>
                
                <div class="tyc-content">

                    <div class="tyc-list clear" data-aos="fade-right" data-aos-duration="1500">
                        <div class="tyc-list-bg">
                        </div>
                        <div class="tyc-list-text">
                            <h3>오아시스<span class="tyc-text-title">The Oasis</span></h3>
                            <h4>남산의 아름다운 전경 속에 자리한 오아시스는<br/> 도심 속 한가로운 휴양을 위한 최적의 장소입니다.<br/>
                                 쾌적한 온도로 유지되는 온수풀, 해외 반얀트리 리조트 풀빌라의 분위기를 느낄 수<br/>
                                있는 프라이빗 카바나가 선사하는 여름의 여유를 즐길 수 있습니다. 
                            </h4>
                            <table>
                                <tr>
                                    <th>위치</th>
                                    <td>야외 공간</td>
                                </tr>
                                <tr>
                                    <th>운영시간</th>
                                    <td>야외 공간</td>
                                </tr>
                                <tr>
                                    <th>문의</th>
                                    <td>02-2250-8230</td>
                                </tr>
                            </table>
                            <a href="#" class="view-details">View Details</a>
                        </div>
                    </div>

                    <div class="tyc-list clear"  data-aos="fade-left" data-aos-duration="1500">
                            <div class="tyc-list-text">
                                    <h3>남산테라스<span class="tyc-text-title">Namsan Terrace</span></h3>
                                    <h4>호텔 3층에 위치한 남산 테라스와 셀레스테는 계절마다 바뀌는 남산의 전경과<br/>
                                         도시의 경관이 시원하게 펼쳐지는 세련된 야외 연회 공간입니다. 가족 또는 <br/>
                                         가까운 지인들과 함께 즐기는 색다른 웨딩 피로연, 바비큐 파티를 비롯해 기업 행사,<br/>
                                         칵테일 리셉션 등 다양한 스타일의 행사를 계획해보세요. 우수한 셰프들이 정성껏 <br/>
                                         준비하는 다이닝 서비스는 파티를 더욱 품격 있게 빛내줍니다. 
                                    </h4>
                                    <table>
                                        <tr>
                                            <th>위치</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>운영시간</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>문의</th>
                                            <td>02-2250-8230</td>
                                        </tr>
                                    </table>
                                    <a href="#" class="view-details">View Details</a>
                                </div>
                            <div class="tyc-list-bg">
                            </div>
                            
                    </div>

                    <div class="tyc-list clear" data-aos="fade-right" data-aos-duration="1500">
                            <div class="tyc-list-bg">
                            </div>
                            <div class="tyc-list-text">
                                <h3>그라넘 다이닝 라운지<p class="tyc-text-title">Granum Dining Lounge</p></h3>
                                <h4>호텔 1층에 위치한 그라넘 다이닝 라운지는 ‘리프레싱 & 헬시’<br/>
                                    콘셉트의 모던 유러피안 퀴진 입니다. 아침에는 투숙 고객과 회원을 위한<br/>
                                     건강한 조식 뷔페가 준비되며, 점심은 계절에 따라 테마를 달리한 메인 디시와<br/>
                                     다채로운 안티파스토 및 디저트로 구성된 ‘그라넘 런치 테이블’ <br/>
                                     세미 뷔페가 펼쳐집니다. 
                                </h4>
                                <table>
                                    <tr>
                                        <th>위치</th>
                                        <td>야외 공간</td>
                                    </tr>
                                    <tr>
                                        <th>운영시간</th>
                                        <td>야외 공간</td>
                                    </tr>
                                    <tr>
                                        <th>문의</th>
                                        <td>02-2250-8230</td>
                                    </tr>
                                </table>
                                <a href="#" class="view-details">View Details</a>
                            </div>
                    </div>

                    <div class="tyc-list clear" data-aos="fade-left" data-aos-duration="1500">
                            <div class="tyc-list-text">
                                    <h3>스파<span class="tyc-text-title">Spa</span></h3>
                                    <h4>세계적인 스파 브랜드 ‘반얀트리 스파(Banyan Tree Spa)’는 아시아<br/>
                                        최초의 럭셔리 오리엔탈 스파로서, 1994년 태국 푸켓에 처음 오픈한 이래<br/>
                                        세계인의 사랑을 받고 있습니다. 반얀트리 클럽 앤 스파 서울에는 총 10개의<br/>
                                        트리트먼트 룸이 있으며 개별 욕실과 휴식 공간이 마련되어 있습니다.<br/>
                                        특별히 스파 스위트에는 트로피컬 레인미스트를 체험할 수 있는 레인미스트 룸을<br/>
                                        구비하여 스파를 위한 최적의 환경을 다각도로 구성하고 있습니다. 
                                    </h4>
                                    <table>
                                        <tr>
                                            <th>위치</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>운영시간</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>문의</th>
                                            <td>02-2250-8230</td>
                                        </tr>
                                    </table>
                                    <a href="#" class="view-details">View Details</a>
                                </div>
                            <div class="tyc-list-bg">
                            </div>
                            
                    </div>

                </div>
                
            </div>
        </div>
    </div>
   <jsp:include page="/footer" flush="true"/>
</body>
</html>