<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ArrayList<Room_optVO> list = (ArrayList)request.getAttribute("list");
Room_optVO param = (Room_optVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			document.frm.submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}

function goDelete(no) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process_opt?no="+no+"&cmd=delete_opt";
	}
}

function goUpdate(x) {	
	if (confirm ('수정하시겠습니까?')) {
		$("#"+x).submit();
	}
}

</script>
<title>관리자 객실 편의시설 목록</title>
</head>
<body>
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>객실 옵션 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
	
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w2" />
									<col class="w5" />
									<col class="w20" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w5" />
									<col class="w2" />
									<col class="w2" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">옵션 종류</th> 
										<th scope="col">옵션 소개</th> 
										<th scope="col">옵션 이미지</th> 
										<th scope="col">옵션 정보</th> 
										<th scope="col">상세정보1</th> 
										<th scope="col">상세정보2</th> 
										<th scope="col">가격</th>	
										<th scope="col" class="last">수정</th>								 
										<th scope="col" class="last">삭제</th>
									</tr>
								</thead>
								<tbody>
									<%
									String targetUrl = "";
									String topClass = "";
									Room_optVO data;
									
									for (int i=0; i<list.size(); i++) {
										data = list.get(i);
										//targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";	
									%>
									<form id="frm<%=i %>" action="process_opt" method="post">
									<tr>
										<td><%=data.getNo()%></td>
										<td><input type="text" name="name" id="name" value="<%=data.getName()%>" class="w90"/></td>
										<td><textarea name="instruction" id="instruction" class="w90" rows="5"><%=data.getInstruction()%></textarea></td>
										<td><img src="/upload/room_opt/<%=data.getImage() %>" width="200px" height="auto"/></td>
										<td><textarea name="info" id="info" class="w90" rows="5"><%=data.getInfo()%></textarea></td>
										<td><textarea name="info_1" id="info_1" class="w90" rows="5"><%=data.getInfo_1()%></textarea></td>
										<td><textarea name="info_2" id="info_2" class="w90" rows="5"><%=data.getInfo_2()%></textarea></td>
										<td><input type="text" name="price" id="price" value="<%=data.getPrice()%>" class="w90"/></td>
										<td><input type="button" value="수정" onclick="goUpdate('frm<%=i%>');" /></td>
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
									</tr>
									<input type="hidden" id="image" name="image" value="<%=data.getImage() %>"/>
									<input type="hidden" id="no" name="no" value="<%=data.getNo()%>"/>
									<input type="hidden" id="cmd" name="cmd" value="edit_opt"/>
									</form>									
								<%
										}
								%>
								</tbody>
							</table>

							<div class="btn">
								<div class="btnRight">
									<a class="wbtn" href="write_opt"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
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