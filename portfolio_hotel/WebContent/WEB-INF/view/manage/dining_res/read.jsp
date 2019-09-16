<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dining_res.*"%>
<%@ page import="java.util.*"%>
<%
Dining_resVO param = (Dining_resVO) request.getAttribute("vo");
Dining_resVO data = (Dining_resVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">
		function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	} 

		function goSave() {
		var save = confirm ('등록하시겠습니까?');
		if (save){
			$("#frm").submit();
			
		} else {
			return false;
		}
	} 

	function goSave() {
		if ($("#d_day").val() == "") {
			alert("예약날짜를 입력해주세요.");
			$("#d_day").focus();
			return false;
		}
		if ($("#d_time").val() == "") {
			alert("예약시간을 입력해주세요.");
			$("#d_time").focus();
			return false;
		}
		$("#frm").submit();
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>다이닝 예약 관리- [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="관리자 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="10%" />
										<col width="30%" />
										<col width="30%" />
										
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">예약날짜</label></th>
											<td colspan="6"><%=data.getD_day()%></td>
										</tr>
										 <tr>
											<th scope="row"><label for="">회원명</label></th>
											<td colspan="6"><%=data.getGuest_lname()%><%=data.getGuest_fname()%></td>
										<tr> 
										</tr>	
											<th scope="row"><label for="">투숙객 연락처</label></th>
											<td colspan="6">
											<%=data.getGuest_tel1()%> - <%=data.getGuest_tel2()%> - <%=data.getGuest_tel3()%>
											</td>
										<tr>
											<th scope="row"><label for="">다이닝명</label></th>
											<td colspan="6"><%=data.getDining_name()%></td>
										</tr>											 
										<tr>
											<th rowspan="2"><label for="">예약인원</th>
																					
											<th scope="row" style="border-left: 1px solid #bec0c4;"><label for="">성인</th>
											<td colspan="4"><%=data.getAdult()%></td>
										</tr>
										<tr>	
											<th scope="row"><label for="">어린이</label></th>
											<td colspan="2"><%=data.getKid()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">예약일</label></th>
											<td colspan="6"><%=data.getRegdate()%></td>
										</tr>	
										<tr>
											<th scope="row"><label for="">결제 금액</label></th>
											<td colspan="6"><%=data.getPrice()%></td>
										</tr>	
									
										
									</tbody>
									</table>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns"
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
									</div>
								</div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									</table>
								<!--//btn-->
							</div>
							<!-- //bread -->
						</div>
						<!-- //bbs -->
						<!-- 내용 : e -->
					</div>
					<!--//con -->
					</div>
				</div>
				<!--//content -->
			</div>
			<!--//container -->
			<!-- E N D :: containerArea-->
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->
</body>
</html>