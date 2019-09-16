<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%@ page import="board.member.*"%>
<%
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/header-fixed.css">
<link rel="stylesheet" href="/css/personal_info.css">
<link rel="stylesheet" href="/css/footer.css">
<script src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<%@ include file="/pg/cfg/site_conf_inc.jsp" %>
<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
<script>
$(function(){
    //left-section 높이값 알아내서 right-section 높이값을 동일하게
    var leftHei = $(".left-section").height();
    $(".right-section").height(leftHei+2);
    var secHei = $(".section-wrap").height();
    //스크롤 했을때 
    $(window).scroll(function(){
        //스크롤바 위치값 알아내기
        var scTop = $(this).scrollTop();
        //section-wrap 시작하는 위치값 알아내기
        var secWrap = $(".section-wrap").offset().top;
        //footer 시작하는 위치값 알아내기
        var ftStart = $("#footer").offset().top-800;
        
        if(scTop >= secWrap && scTop < secHei-390) {
            $(".confirmation-box").addClass("fix");
        }
        else if(scTop >= secHei-390) {
            $(".confirmation-box").removeClass("fix");
            $(".confirmation-box").addClass("fix2");
        }
        else {
            $(".confirmation-box").removeClass("fix2");
            $(".confirmation-box").removeClass("fix");
        }
    });
    
    $("#guest_tel1_select").change(function() {
    	$("#guest_tel1").val($("#guest_tel1_select option:selected").val());
    });
    
    $("#guest_lastname, #guest_firstname").change(function() {
    	$("#buyr_name").val($("#guest_lastname").val() + $("#guest_firstname").val());
    });
    
    $("#guest_email").change(function() {
    	$("#buyr_mail").val($("#guest_email").val());
    });
    
    $("#guest_tel2").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") ); }); //숫자만
    $("#guest_tel3").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") ); }); //숫자만
    
});        

var chknum = /[0-9]/;
var chkat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

function goCheck() {
	if($("#guest_lastname").val()==""){
		$("#guest_lastname").focus();
		return false;
	}
	if($("#guest_firstname").val()==""){
		$("#guest_firstname").focus();
		return false;
	}
	if($("#guest_tel2").val()=="" || !chknum.test($("#guest_tel2").val())){
		$("#tel_span").show();
		$("#tel_span").text("* 숫자만 입력하세요.");
		$("#guest_tel2").focus();
		return false;
	} else {
		$("#tel_span").remove();
	}
	if($("#guest_tel3").val()=="" || !chknum.test($("#guest_tel3").val())){
		$("#tel_span").show();
		$("#tel_span").text("* 숫자만 입력하세요.");
		$("#guest_tel3").focus();
		return false;
	} else {
		$("#tel_span").remove();
	}
	if($("#guest_email").val()=="" || !chkat.test($("#guest_email").val())){
		$("#email_span").show();
		$("#email_span").text("* 메일 주소를 정확하게 입력하세요.");
		$("#guest_email").focus();
		return false;
	} else {
		$("#email_span").remove();
	}
	
	if($("#pay_method").val() == 0) {
		$("#order_info").attr("action", "/room/res/submit");
		$("#order_info").submit();
	} else {
		$("#order_info").attr("action", "/pg/sample/pp_cli_hub.jsp");
		jsf__pay(document.order_info);
	}
	
}

function maxLengthCheck(object) {
	if(object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}

function goPay(method, state) {
	if(method == 1) {
		document.getElementById("card").style.backgroundColor = "#0e693f";
		document.getElementById("card").style.color = "#ffffff";
		document.getElementById("deposit").style.backgroundColor = "#e8e8e8";
		document.getElementById("deposit").style.color = "#000000";
		
		$("#account_span").remove();
		$("#pay_method").val("100000000000");
		$("#pay_state").val(state);
		$("#paydate").val('<%=DateUtil.getToday()%>');

	} else {
		document.getElementById("deposit").style.backgroundColor = "#0e693f";
		document.getElementById("deposit").style.color = "#ffffff";
		document.getElementById("card").style.backgroundColor = "#e8e8e8";
		document.getElementById("card").style.color = "#000000";
		
		$("#account_span").text("더조은은행 190812-13-131430");
		$("#pay_method").val(method);
		$("#pay_state").val(state);
		$("#paydate").val("-");
	}
}
</script>


<script type="text/javascript">
function m_Completepayment( FormOrJson, closeEvent ) 
{
    var frm = document.order_info; 
 
    /********************************************************************/
    /* FormOrJson은 가맹점 임의 활용 금지                               */
    /* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다.  */
    /* FormOrJson 값을 활용 하시려면 기술지원팀으로 문의바랍니다.       */
    /********************************************************************/
    GetField( frm, FormOrJson ); 

    
    if( frm.res_cd.value == "0000" )
    {
	    alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다."); //업체 연동 시 필수 확인 사항.
        /*
            가맹점 리턴값 처리 영역
        */
     
        frm.submit(); 
    }
    else
    {
        alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );
        
        closeEvent();
    }
}

function jsf__pay( form )
{
    try
    {
        KCP_Pay_Execute( form ); 
    }
    catch (e)
    {
        /* IE 에서 결제 정상종료시 throw로 스크립트 종료 */ 
    }
}             

/* 주문번호 생성 예제 */
function init_orderid()
{
    var today = new Date();
    var year  = today.getFullYear();
    var month = today.getMonth() + 1;
    var date  = today.getDate();
    var time  = today.getTime();

    if(parseInt(month) < 10) {
        month = "0" + month;
    }
    if(parseInt(date) < 10) {
        date = "0" + date;
    }

    var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;
    document.order_info.ordr_idxx.value = order_idxx;            
}

function goSubmit() {
	
}

</script>
<title>정보입력</title>
</head>
<body onload="init_orderid();">
	<jsp:include page="/header_menu" flush="true" />

	<div id="container">
		<div class="option_channel clear">
			<h1 class="head-title">객실예약</h1>

			<!-- 상단 제목 아래 객실예약 진행 순서 -->
			<ul class="cha_index clear">
				<li><a href="#">객실검색 <span>></span></a></li>
				<li><a href="/book/room/add_option">객실예약</a></li>
				<li class="current-page"><a href="#"><span>></span>정보입력</a></li>
				<li><a href="/book/room/confirm_room"><span>></span> 예약완료</a></li>
			</ul>

			<!-- 폼태그 / summit 입력버튼 311번 -->
			<form name="order_info" id="order_info" method="post"> 
				<div class="section-wrap clear">
					<!-- 왼쪽 정보 입력 박스 구역 -->
					<div class="left-section">

						<div class="add01">
							<div class="sec01-title">
								<p>예약고객 정보 입력</p>
							</div>
							<%
							if(sessionMember != null) {
							%>
							<div class="guest_kname">
								<label for="guest_kname">성명＊</label> 
									<input type="text" name="guest_lastname" id="guest_lastname" value="<%=sessionMember.getF_name()%>"/> 
									<input type="text" name="guest_firstname" id="guest_firstname" value="<%=sessionMember.getL_name()%>"/> 
							</div>
							<div class="phoneNumber">
								<label for="phoneNumber">연락처＊</label> 
								<select id="guest_tel1_select">
									<option value="<%=sessionMember.getF_tel()%>"><%=sessionMember.getF_tel()%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select> 
								<input type="hidden" name="member_pk" id="member_pk" value="<%=sessionMember.getNo()%>"/>
								<input type="hidden" name="guest_tel1" id="guest_tel1" value="<%=sessionMember.getF_tel()%>"/>
								<input type="text" name="guest_tel2" id="guest_tel2" maxlength="4" oninput="maxLengthCheck(this)" value="<%=sessionMember.getM_tel()%>">
								<input type="text" name="guest_tel3" id="guest_tel3" maxlength="4" oninput="maxLengthCheck(this)" value="<%=sessionMember.getL_tel()%>">
								<span id="tel_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
							</div>

							<div class="email">
								<ul class="email_adress clear">
									<li class="email-title">
										<label for="email">이메일＊</label>
									</li>
									<li>
										<input type="text" name="guest_email" id="guest_email" value="<%=sessionMember.getEmail()%>" maxlength="40"><br/>
										<span id="email_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
									</li>
								</ul>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="guest_kname">
								<label for="guest_kname">성명＊</label> 
									<input type="text" name="guest_lastname" id="guest_lastname" placeholder="성"/> 
									<input type="text" name="guest_firstname" id="guest_firstname" placeholder="이름"/> 
							</div>
							<div class="phoneNumber">
								<label for="phoneNumber">연락처＊</label> 
								<select id="guest_tel1_select">
									<option>선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select> 
								<input type="hidden" name="guest_tel1" id="guest_tel1" value=""/>
								<input type="text" name="guest_tel2" id="guest_tel2" maxlength="4" oninput="maxLengthCheck(this)" placeholder="숫자만 입력가능">
								<input type="text" name="guest_tel3" id="guest_tel3" maxlength="4" oninput="maxLengthCheck(this)" placeholder="숫자만 입력가능">
								<span id="tel_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
							</div>

							<div class="email">
								<ul class="email_adress clear">
									<li class="email-title">
										<label for="email">이메일＊</label>
									</li>
									<li>
										<input type="text" name="guest_email" id="guest_email" placeholder="이메일" maxlength="40"><br/>
										<span id="email_span" style="color:#ff0000; font-size:10px; padding:0; margin:0;"></span>
									</li>
								</ul>
							</div>
						</div>
						<%		
							}
						%>
						<div class="add01">
							<div class="sec01-title">
								<p>상세 가격 정보</p>
							</div>
							
							<table>
								<tr>
									<th></th>
									<th>총 예약 금액<br /> [1박,1객실]
									</th>
								</tr>
								<tr>
									<th>객실 가격</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("room_price"))) %></td>
								</tr>
								<tr>
									<th>추가 옵션 가격</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("option_price"))) %></td>
								</tr>
								<tr>
									<th>봉사료(10%),<br /> 부가가치세(10%)<br /> 전 일정, 전 객실에 적용
									</th>
									<td>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("charge_price"))) %></td>
								</tr>
								<tr>
									<th>총 예약 금액</th>
									<td><p>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("total_price"))) %></p></td>
								</tr>
							</table>
						</div>

						<div class="add01 pay">
							<div class="sec01-title">
								<p>결제 방식 선택</p>
							</div>

							<div class="payType">
								<label for="pay_method">결제 방식<span>＊</span></label>
								<button type="button" id="deposit" onclick="goPay(0,0);">무통장입급</button>
								<button type="button" id="card" onclick="goPay(1,1);">카드결제</button> <br/>
							</div>
							<span id="account_span"></span>
						</div>
					</div>

					<!-- 오른쪽 금액 추가 및 결제버튼 구역 -->
					<div class="right-section">
						<div class="confirmation-box">
							<div class="content-area01">
								<h2>온라인 확정 요금</h2>
								<p>- 온라인 확정 요금 (최소 및 변경 불가 요금)</p>

								<h3><%=request.getParameter("room_name") %> [1객실]</h3>
								<h3 class="point01"><%=request.getParameter("checkin") %> ~ <%=request.getParameter("checkout") %> [<%=request.getParameter("day_stay") %>박]</h3>
								<h3>어른 <%=request.getParameter("adult") %>명 / 어린이 <%=request.getParameter("kid") %>명</h3>
							</div>

							<div class="content-area02 area clear">
								<ul class="title01">
									<li><h3>객실 총 금액</h3></li>
									<li><h3>추가 인원 금액</h3></li>
									<li><h3>추가 옵션 금액</h3></li>
									<li><h3>세금 및 수수료</h3></li>
								</ul>

								<ul class="price01">
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("room_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("person_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("option_price"))) %></h3></li>
									<li><h3>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("charge_price"))) %></h3></li>
								</ul>
							</div>

							<div class="content-area03 area clear">
								<ul class="title02 clear">
									<li class="total-price">총 예약 금액</li>
									<li>KRW <%=Function.toPriceComma(Integer.parseInt(request.getParameter("total_price"))) %></li>
								</ul>
								<p>(투숙기간. 객실 수. 옵션 포함, 세금 및 수수료 각 10%포함)</p>

								<div class="next-but">
									<input id="countsubmit" type="button" value="예약 완료" onclick="goCheck();">
								</div>

								<h4>
									<span></span>예약 안내
								</h4>
								<p>· 당일 예약에 대해서는 취소 및 변경이 불가능합니다.</p>
							</div>

							<div class="content-area04 area">
								<h4>
									<span></span>객실 예약문의 00-0000-0000
								</h4>
							</div>

						</div>
					</div>
				</div>
				
				<input type="hidden" name="room_pk" id="room_pk" value="<%=request.getParameter("room_pk")%>"/> 
                <input type="hidden" name="room_name" id="room_name" value="<%=request.getParameter("room_name")%>"/> 
                <input type="hidden" name="checkin" id="checkin" value="<%=request.getParameter("checkin")%>"/> 
                <input type="hidden" name="checkout" id="checkout" value="<%=request.getParameter("checkout")%>"/> 
                <input type="hidden" name="day_stay" id="day_stay" value="<%=request.getParameter("day_stay")%>"/> 
                <input type="hidden" name="adult" id="adult" value="<%=request.getParameter("adult")%>"/> 
                <input type="hidden" name="kid" id="kid" value="<%=request.getParameter("kid")%>"/> 
                <input type="hidden" name="room_price" id="room_price" value="<%=request.getParameter("room_price")%>"/> 
                <input type="hidden" name="person_price" id="person_price" value="<%=request.getParameter("person_price")%>"/> 
                <input type="hidden" name="option_price" id="option_price" value="<%=request.getParameter("option_price")%>"/> 
                <input type="hidden" name="charge_price" id="charge_price" value="<%=request.getParameter("charge_price")%>"/> 
                <input type="hidden" name="total_price" id="total_price" value="<%=request.getParameter("total_price")%>"/>
				<% 
				String[] option_pk = request.getParameterValues("option_pk");
				String[] name = request.getParameterValues("name");
				String[] price = request.getParameterValues("price");
				String[] count = request.getParameterValues("count"); 
				
				for(int i=0; i<option_pk.length; i++) {
				%> 
				<input type="hidden" name="option_pk" id="option_pk" value="<%=option_pk[i]%>"/>
				<input type="hidden" name="name" id="name" value="<%=name[i]%>"/>
				<input type="hidden" name="price" id="price" value="<%=price[i]%>"/>
				<input type="hidden" name="count" id="count" value="<%=count[i]%>"/>  
				<%
				}
				%>
				
				<input type="hidden" name="pay_method" id="pay_method" value="0"/>
				<input type="hidden" name="pay_state" id="pay_state" value="0"/>
				<input type="hidden" name="paydate" id="paydate" value="-"/>
				
				
				<!-- NHN KCP -->
				<input type="hidden" name="ordr_idxx" class="w200" value="" maxlength="40"/> <!-- 주문번호 -->
				<input type="hidden" name="good_name" class="w100" value="<%=request.getParameter("room_name")%>"/><!-- 상품명 -->
				<input type="hidden" name="good_mny" class="w100" value="<%=request.getParameter("total_price")%>" maxlength="9"/><!-- 결제금액 -->
				<input type="hidden" name="buyr_name" class="w100" value=""/><!-- 주문자명 -->
				<input type="hidden" name="buyr_mail" class="w200" value="" maxlength="30" /><!-- 주문자 이메일 -->
				<input type="hidden" name="buyr_tel1" class="w100" value=""/><!-- 주문자 연락처1 -->
				<input type="hidden" name="buyr_tel2" class="w100" value=""/><!-- 주문자 연락처2 -->
				
				<input type="hidden" name="req_tx"          value="pay" />
    			<input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    			<input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
    			<input type="hidden" name="quotaopt"        value="12"/>
				<!-- 필수 항목 : 결제 금액/화폐단위 -->
				<input type="hidden" name="currency"        value="WON"/>
				<input type="hidden" name="module_type"     value="<%= module_type %>"/> <!-- 표준웹 설정 정보입니다(변경 불가) -->
				<input type="hidden" name="res_cd"          value=""/>
				<input type="hidden" name="res_msg"         value=""/>
				<input type="hidden" name="enc_info"        value=""/>
				<input type="hidden" name="enc_data"        value=""/>
				<input type="hidden" name="ret_pay_method"  value=""/>
				<input type="hidden" name="tran_cd"         value=""/>
				<input type="hidden" name="use_pay_method"  value=""/>
					
				<!-- 주문정보 검증 관련 정보 : 표준웹 에서 설정하는 정보입니다 -->
				<input type="hidden" name="ordr_chk"        value=""/>
				
				<!--  현금영수증 관련 정보 : 표준웹 에서 설정하는 정보입니다 -->
				<input type="hidden" name="cash_yn"         value=""/>
				<input type="hidden" name="cash_tr_code"    value=""/>
				<input type="hidden" name="cash_id_info"    value=""/>
				
				<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
				<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131)  -->
				<input type="hidden" name="good_expr" value="0">    
			</form>
			
		</div>
	</div>

	<jsp:include page="/footer" flush="true" />
</body>
</html>