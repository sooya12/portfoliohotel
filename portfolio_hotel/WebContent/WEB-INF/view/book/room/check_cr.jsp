<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="room.*"%>
<%@ page import="util.*"%>

<%
	ArrayList<HashMap> map_c = (ArrayList<HashMap>) request.getAttribute("map_c");
	ArrayList<RoomVO> list_r = (ArrayList<RoomVO>) request.getAttribute("list_r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실별 검색 예약 가능 여부 체크</title>
</head>
<body>
	<%
	for (int i = 0; i < map_c.size(); i++) {
		if(Integer.parseInt(String.valueOf(map_c.get(i).get("res_count"))) < 10) {
	%>
	<form action="/book/room/add_option" method="post" id="frm<%=i%>">
		<!--예약 가능한 객실 조회 결과 나오는 영역 -->
		<div class="roomResult-area clear">
			<ul>
				<li class="photo roomtype01"
					style="background-image: url('/upload/room/<%=list_r.get(i).getImage()%>');">
					<h1 class="camera">
						<a href="/room/detail_sub<%=i + 1%>" target="_blank"><img src="/img/ico_photo.png"></a>
					</h1>
				</li>
				<li>
					<ul class="roomResult-info clear">
						<li><h2>
								<span id="room_name_span<%=i%>"><%=list_r.get(i).getName()%></span>
							</h2></li>
						<li class="specific-notice clear">
							<ul class="specific-notice01">
								<li>객실크기 : <%=list_r.get(i).getSize()%></li>
								<li>객실위치 : <%=list_r.get(i).getLocation()%></li>
								<li>수용인원 : 어른 <%=list_r.get(i).getAdult()%> 명, 어린이 <%=list_r.get(i).getKid()%> 명
								</li>
							</ul>
							<ul class="specific-notice02">
								<li>객실타입 : <%=list_r.get(i).getType()%></li>
								<li>배드타입 : 킹 사이즈 / 트윈</li>
							</ul>
						</li>
						<li>
							<p>
								<%=list_r.get(i).getInstruction()%>
							</p>
						</li>
						<li>
							<div class="priceResult clear">
								<ul class="etc clear">
									<li><h1><%=Function.toPriceComma(list_r.get(i).getPrice())%> 원 <span>~</span>
										</h1></li>
									<li>
										<h3>KRW/1박, 1객실</h3>
										<p>(세금 및 수수료 별도)</p>
									</li>
								</ul>
								<button class="reservation-btn">
									<a onclick="goSubmit(<%=i%>)">예약하기</a>
								</button>
							</div>
						</li>
					</ul>
				</li>
			</ul>

			<span style="display: none;" id="room_pk_span<%=i%>"><%=list_r.get(i).getNo()%></span>
			<span style="display: none;" id="price_span<%=i%>"><%=list_r.get(i).getPrice()%></span>
			<span style="display: none;" id="adult_basic_span<%=i%>"><%=list_r.get(i).getAdult()%></span>
			<span style="display: none;" id="kid_basic_span<%=i%>"><%=list_r.get(i).getKid()%></span>

			<input type="hidden" name="checkin" id="checkin<%=i%>" value="" /> 
			<input type="hidden" name="checkout" id="checkout<%=i%>" value="" /> 
			<input type="hidden" name="room_name" id="room_name<%=i%>" value="" /> 
			<input type="hidden" name="adult" id="adult<%=i%>" value="" /> 
			<input type="hidden" name="kid" id="kid<%=i%>" value="" /> 
			<input type="hidden" name="adult_basic" id="adult_basic<%=i%>" value="" />
			<input type="hidden" name="kid_basic" id="kid_basic<%=i%>" value="" />
			<input type="hidden" name="adult_add" id="adult_add<%=i%>" value="" />
			<input type="hidden" name="kid_add" id="kid_add<%=i%>" value="" /> 
			<input type="hidden" name="day_stay" id="day_stay<%=i%>" value="" /> 
			<input type="hidden" name="person_price" id="person_price<%=i%>" value="" />
			<input type="hidden" name="room_price" id="room_price<%=i%>" value="" /> 
			<input type="hidden" name="room_pk" id="room_pk<%=i%>" value="" />
		</div>
	</form>
	<%
		}
	}
	%>
</body>
</html>