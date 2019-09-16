<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dining.*"%>
<%@ page import="java.util.*"%>
<%
DiningVO param = (DiningVO) request.getAttribute("vo");
DiningVO data = (DiningVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">

	function goSave() {
		if ($("#name").val() == "") {
			alert("다이닝명을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if ($("#info").val() == "") {
			alert("안내 작성해주세요.");
			$("#info").focus();
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
						<h2>다이닝관리- [상세]</h2>
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
										<col width="20%" />
										<col width="15%" />
										<col width="20%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">다이닝명</label></th>
											<td colspan="3"><%=data.getName()%></td>
										</tr>
										<tr>	
											<th scope="row"><label for="">가격</label></th>
											<td colspan="3"><%=data.getPrice()%></td>
										</tr>
										<tr>	
											<th scope="row"><label for="">수량</label></th>
											<td colspan="3"><%=data.getCount()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">운영기간 시작일</label></th>
											<td colspan=""><%=data.getStartdate()%></td>
										
											<th scope="row"><label for="">운영기간 종료일</label></th>
											<td colspan=""><%=data.getEnddate()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">예약 가능기간</label></th>
											<td colspan=""><%=data.getBook_period()%></td>
										
											<th scope="row"><label for="">포함내역</label></th>
											<td colspan=""><%=data.getInclusion()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">안내</label></th>
											<td colspan="3"><%=data.getInfo()%></td>
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