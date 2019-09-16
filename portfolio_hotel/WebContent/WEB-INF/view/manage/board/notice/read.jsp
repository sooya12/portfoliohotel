<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="board.notice.*"%>
<%@ page import="java.util.*"%>
<%@ page import="property.*"%>
<%
NoticeVO param = (NoticeVO) request.getAttribute("param");
NoticeVO data = (NoticeVO) request.getAttribute("data");
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

	/* function goSave() {
		var save = confirm ('등록하시겠습니까?');
		if (save){
			$("#frm").submit();
			
		} else {
			return false;
		}
	} */

	function goSave() {
		if ($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if ($("#contents").val() == "") {
			alert("내용을 입력해주세요.");
			$("#contents").focus();
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
						<h2>공지사항관리 - [상세]</h2>
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
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">제목</label></th>
											<td colspan="3"><%=data.getTitle()%></td>
										</tr>
										<tr>
											<%-- <th scope="row"><label for="">비밀글</label></th>
											<td><%=CodeUtil.getMemberName(data.getMember())%></td> --%>
											<th scope="row"><label for="">노출 여부</label></th>
											<td><%=CodeUtil.getDisplayName(data.getDisplay())%></td>
											<th scope="row"><label for="">상단노출 여부</label></th>
											<td><%=CodeUtil.getTopName(data.getTop()) %></td>
										</tr>
										<tr>
											<th scope="row"><label for="">첨부파일</label></th>
											<!-- <td colspan="5"> -->
											<% if(data.getFile_org() != null && data.getFile_org() != "") {%>
											<td colspan="3"><a href="<%= Function.downloadUrl(SiteProperty.NOTICE_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFile_org(), "UTF-8"), data.getFile()) %>" target="_blank"><%=data.getFile_org()%></a></td>
											<%
											} else if(data.getFile_org() == null) {
											%>
											<%-- <% if(data.getFile_org() == null) {%> --%>
											<td colspan="3">첨부된 파일이 없습니다.</td>
											<%
											}
											%>
										</tr>
										<tr>
											<th scope="row"><label for="">상세정보</label></th>
											<td colspan="5"><%=data.getContents()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td colspan="5"><%=data.getRegdate()%></td>
										</tr>
										<input type="hidden" name="product_pk" value="product_pk">
										<!-- value=서버로 넘길 값 -->
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