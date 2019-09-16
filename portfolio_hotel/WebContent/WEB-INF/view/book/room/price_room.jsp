<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="room.*"%>

<%
ArrayList<RoomVO> list_rp = (ArrayList<RoomVO>) request.getAttribute("list_rp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/header-fixed.css">
<link rel="stylesheet" href="/css/price_room.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<title>객실검색</title>
<script type="text/javascript">
$(function() {
	$(".toggle-btn").click(function(event) {
		$(this).children("h3").toggle();
		$(this).siblings(".rate-info").toggle();
	});
	
	$("#checkin_select").datepicker({
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat: "yy-mm-dd",
        yearRange: "2019:2019",
        minDate: "0D" 
    });
	
	$("#checkout_select").datepicker({
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat: "yy-mm-dd",
        yearRange: "2019:2019",
        minDate: "1D" 
    });
	
	calculate();
	$("#checkin").val($("#checkin_select").val());
	$("#checkout").val($("#checkout_select").val());
	$("#day_stay").val(day_stay);
	$("#adult").val($("#adult_select option:selected").val());
	$("#kid").val($("#kid_select option:selected").val());
	
	checkDate($("#checkin").val(), $("#checkout").val());
	
	$("#checkin_select, #checkout_select").change(function() {
		calculate();
		$("#day_stay").val(day_stay);
		$("#checkin").val($("#checkin_select").val());
		$("#checkout").val($("#checkout_select").val());
		
		checkDate($("#checkin").val(), $("#checkout").val());
	});
	
	$("#adult_select, #kid_select").change(function() {
		$("#adult").val($("#adult_select option:selected").val());
		$("#kid").val($("#kid_select option:selected").val());
	});
	
});

function calculate() {
	arr_in = $("#checkin_select").val().split("-");
	arr_out = $("#checkout_select").val().split("-");
	time_in = new Date(arr_in[0], arr_in[1], arr_in[2]);
	time_out = new Date(arr_out[0], arr_out[1], arr_out[2]);
	day_stay = (time_out.getTime() - time_in.getTime())/(1000*60*60*24);
}

function goSubmit(no) {
	$("#room_name"+no).val($("#room_name_span"+no).html());
	$("#room_pk"+no).val(Number($("#room_pk_span"+no).html()));
	$("#adult_basic"+no).val(Number($("#adult_basic_span"+no).html()));
	$("#kid_basic"+no).val(Number($("#kid_basic_span"+no).html()));
	$("#checkin"+no).val('<%=request.getParameter("checkin")%>');
	$("#checkout"+no).val('<%=request.getParameter("checkout")%>');
	$("#adult"+no).val(<%=request.getParameter("adult")%>);
	$("#kid"+no).val(<%=request.getParameter("kid")%>);
	
	adult_add = 0;
	kid_add = 0;
	if($("#adult_select option:selected").val() > $("#adult_basic"+no).val()){
		adult_add = ($("#adult_select option:selected").val() - $("#adult_basic"+no).val())*100000;
	} else { 
		adult_add = 0;
	}
	if($("#kid_select option:selected").val() > $("#kid_basic"+no).val()){
		kid_add = ($("#kid_select option:selected").val() - $("#kid_basic"+no).val())*(100000*0.7);
	} else {
		kid_add = 0;
	}
	person_price = adult_add + kid_add;
	$("#person_price"+no).val(person_price);
	
	var aac = $("#adult_select option:selected").val() - $("#adult_basic"+no).val();
	if(aac < 0) {
		aac = 0;
	} 
	$("#adult_add"+no).val(aac);
	
	var kac = $("#kid_select option:selected").val() - $("#kid_basic"+no).val();
	if(kac < 0) {
		kac = 0;
	} 
	$("#kid_add"+no).val(kac);
	
	calculate();
	$("#day_stay"+no).val(day_stay);
	$("#room_price"+no).val(Number($("#price_span"+no).html()) * day_stay);
	$("#frm"+no).submit();
}

function goCheck() {
	$("#searchFrm").attr("action", "check_room");
	$("#searchFrm").submit();
}

function goSearch() {
	$("#searchFrm").attr("action", "price_room");
	$("#searchFrm").submit();
}

function checkDate(checkin, checkout) {
	$.ajax({
		type : "GET",
		url : "/book/room/check_pr?checkin="+checkin+"&checkout="+checkout, 
		async : false,
		success : function(data){
			$("#check_pr_area").html(data);
		}
	});
}
</script>
</head>
<body>
	<jsp:include page="/header_menu" flush="true" />

	<div id="container">
		<div class="chk-section">
			<h2>객실검색</h2>

			<!-- 상단 예약진행 순서 -->
			<ul class="cha_index clear">
				<li><a href="/book/room/check_room">객실검색 <span>></span>
				</a></li>
				<li class="current-page"><a href="#">객실예약</a></li>
				<li><a href="/book/room/personal_info"><span>></span>정보입력</a></li>
				<li><a href="/book/room/confirm_room"><span>></span> 예약완료</a></li>
			</ul>

			<!-- 객실 검색 박스 -->
			<div class="select-info-box">
				<form class="room-search" id="searchFrm">

					<!-- 검색창 구역 -->
					<div class="period after">
						<label for="period">숙박기간</label>
					</div>

					<!-- 체크인/체크아웃 구역 -->
					<div class="checkInOut">
						<input type="text" name="checkin" id="checkin_select" class="InDate" maxlength="10" placeholder="체크인"
							value="<%=request.getParameter("checkin")%>" readonly>~
						<input type="text" name="checkout" id="checkout_select" class="OutDate" maxlength="10" placeholder="체크아웃"
							value="<%=request.getParameter("checkout")%>" readonly>
					</div>

					<!-- 기간 -->
					<div class="days"><%=request.getParameter("day_stay")%> 박
					</div>


					<div class="room after">
						<label for="roomCount">객실</label>
					</div>
					<!-- 객실 수 -->
					<div class="roomCount select-option">
						<select name="roomCount" id="roomCount" class="option01" aria-hidden="true">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>

					<div class="adult after">
						<label for="adult">어른</label>
					</div>

					<div class="adultCount select-option">
						<select name="adult_select" id="adult_select" class="option1" aria-hidden="true">
							<option value="1" <%=Integer.parseInt(request.getParameter("adult")) == 1 ? "selected" : ""%>>1명</option>
							<option value="2" <%=Integer.parseInt(request.getParameter("adult")) == 2 ? "selected" : ""%>>2명</option>
							<option value="3" <%=Integer.parseInt(request.getParameter("adult")) == 3 ? "selected" : ""%>>3명</option>
							<option value="4" <%=Integer.parseInt(request.getParameter("adult")) == 4 ? "selected" : ""%>>4명</option>
							<option value="5" <%=Integer.parseInt(request.getParameter("adult")) == 5 ? "selected" : ""%>>5명</option>
						</select>
					</div>

					<div class="child after">
						<label for="child">어린이</label>
					</div>

					<div class="childCount select-option">
						<select name="kid_select" id="kid_select" class="option1"
							aria-hidden="true">
							<option value="0" <%=Integer.parseInt(request.getParameter("kid")) == 0 ? "selected" : ""%>>0명</option>
							<option value="1" <%=Integer.parseInt(request.getParameter("kid")) == 1 ? "selected" : ""%>>1명</option>
							<option value="2" <%=Integer.parseInt(request.getParameter("kid")) == 2 ? "selected" : ""%>>2명</option>
							<option value="3" <%=Integer.parseInt(request.getParameter("kid")) == 3 ? "selected" : ""%>>3명</option>
							<option value="4" <%=Integer.parseInt(request.getParameter("kid")) == 4 ? "selected" : ""%>>4명</option>
							<option value="5" <%=Integer.parseInt(request.getParameter("kid")) == 5 ? "selected" : ""%>>5명</option>
						</select>
					</div>
					<input type="hidden" name="checkin" id="checkin" value=""/>
					<input type="hidden" name="checkout" id="checkout" value=""/>
					<input type="hidden" name="adult" id="adult" value=""/>
					<input type="hidden" name="kid" id="kid" value=""/>
					<input type="hidden" name="day_stay" id="day_stay" value=""/>
				</form>

				<!-- 재검색 버튼 -->
				<div class="re-try">
					<button class="re-check-btn" onclick="goSearch();">재검색</button>
				</div>
			</div>
		</div>
		
		<!-- 탭메뉴 객실/요금으로 보기 -->
		<div class="room-info">
			<ul class="tabMenu clear">
				<li><a href="#" onclick="goCheck();">객실로 보기</a></li>
				<li class="on"><a href="#">요금으로 보기</a></li>
			</ul>
			
			<span id="check_pr_area"></span>
			<%-- <%
			for(int i=0; i<list_rp.size(); i++) {
			%>
			<form action="/book/room/add_option" method="post" id="frm<%=i%>">
				<div class="priceResult-area clear">
					<div class="resultSection">
						<div class="thePrice">
							<h3>객실요금</h3>
						</div>
						<div class="priceResult clear">
							<ul class="etc clear">
								<li><h1>
										<%=Function.toPriceComma(list_rp.get(i).getPrice()) %> 원 <span>~</span>
									</h1>
								</li>
								<li>
									<h3>KRW/1박, 1객실</h3>
									<p>(세금 및 수수료 별도)</p>
								</li>
							</ul>
						</div>
					</div>
					<ul class="rate-info clear">
						<li class="photo01" style="background-image: url('/upload/room/<%=list_rp.get(i).getImage()%>');">
							<h1 class="camera">
								<a href="/room/detail_sub<%=i+1 %>" target="_blank"><img src="/img/ico_photo.png"></a>
							</h1>
						</li>
						<li>
							<ul class="roomResult-info clear">
								<li><h2><span id="room_name_span<%=i %>"><%=list_rp.get(i).getName() %></span></h2></li>
								<li class="specific-notice clear">
									<ul class="specific-notice01">
										<li>객실크기 : <%=list_rp.get(i).getSize() %></li>
										<li>객실위치 : <%=list_rp.get(i).getLocation() %></li>
										<li>수용인원 : <%=list_rp.get(i).getAdult() + list_rp.get(i).getKid() %> 명</li>
									</ul>
									<ul class="specific-notice02">
										<li>객실타입 : <%=list_rp.get(i).getType() %></li>
										<li>배드타입 : 킹 사이즈</li>
									</ul>
								</li>
								<li>
									<p>
										<%=list_rp.get(i).getInstruction() %>
									</p>
								</li>
							</ul>
						</li>
						<div class="submit">
							<a href="#;" onclick="goSubmit(<%=i%>)">예약하기</a>
						</div>
					</ul>
					<button type="button" class="toggle-btn">
						<h3 class="btn-show">예약 가능한 객실 보기</h3>
						<h3 class="btn-close">예약 가능한 객실 닫기</h3>
					</button>
					
					<span style="display:none;" id="room_pk_span<%=i %>"><%=list_rp.get(i).getNo() %></span>
					<span style="display:none;" id="price_span<%=i %>"><%=list_rp.get(i).getPrice() %></span>
					<span style="display:none;" id="adult_basic_span<%=i %>"><%=list_rp.get(i).getAdult() %></span>
					<span style="display:none;" id="kid_basic_span<%=i %>"><%=list_rp.get(i).getKid() %></span>
					
					<input type="hidden" name="checkin" id="checkin<%=i %>" value=""/>
					<input type="hidden" name="checkout" id="checkout<%=i %>" value=""/>
					<input type="hidden" name="room_name" id="room_name<%=i %>" value=""/>
					<input type="hidden" name="adult" id="adult<%=i %>" value=""/>
					<input type="hidden" name="kid" id="kid<%=i %>" value=""/>
					<input type="hidden" name="adult_basic" id="adult_basic<%=i %>" value=""/>
					<input type="hidden" name="kid_basic" id="kid_basic<%=i %>" value=""/>
					<input type="hidden" name="adult_add" id="adult_add<%=i %>" value=""/>
					<input type="hidden" name="kid_add" id="kid_add<%=i %>" value=""/>
					<input type="hidden" name="day_stay" id="day_stay<%=i %>" value=""/>
					<input type="hidden" name="person_price" id="person_price<%=i %>" value=""/>
					<input type="hidden" name="room_price" id="room_price<%=i %>" value=""/>
					<input type="hidden" name="room_pk" id="room_pk<%=i %>" value=""/>
				
				</div>
			</form>
			<%
			}
			%> --%>
			
		</div>
	</div>

	<jsp:include page="/footer" flush="true" />
</body>
</html>