<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.qna.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.admin.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
AdminVO admin_vo = (AdminVO)request.getAttribute("admin_vo");
ArrayList<QnaVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");

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

function goDelete(v) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process.do?no="+v+"&cmd=delete";
	}
}

function goSearch() {
	$("#searchForm").submit();
}

</script>
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
					<h2>QnA - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w4"/>
									<col class="w4"/>
									<col class="w4"/>
									<col class="w10" />
									<col class="w20" />
									<col class="w20" />
									<col class="w4" />
									<col class="w4" />
									<col class="w4" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">카테고리</th>
										<th scope="col">이름</th>
										<th scope="col">이메일</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th> 
										<th scope="col">답글여부</th> 
										<th scope="col" class="last">삭제</th>
									</tr>
								</thead>
								<tbody>
								
								
								
								<%
									if (totCount == 0) {
								%>
									<tr>
										<td class="first" colspan="8">등록된 글이 없습니다.</td>
									</tr>
								<%
									} else {
																String targetUrl = "";
																String topClass = "";
																QnaVO data;
																String bgColor ="";
																
																for (int i=0; i<list.size(); i++) {
																	data = list.get(i);
																	targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
																	bgColor = (data.getReply()==0)?"#ffffff":"#e8e8e8";
																	
								%>
								
									<tr <%=topClass%> bgcolor="<%=bgColor%>">
										
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<%-- <td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>  --%>
										<td <%=targetUrl%> class="no"><%=data.getNo() %></td>
										<td <%=targetUrl%> class="category"><%=CodeUtil.getCategory_name(data.getCategory()) %></td>
										<td <%=targetUrl%> class="name"><%=data.getLastName()%><%=data.getFirstName()%></td>
										<td <%=targetUrl%> class="email"><%=data.getEmail()%></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle() %></td>
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegdate())%></td>
										<td <%=targetUrl%>><%=CodeUtil.getReplyExist(data.getReply())%></td>
									
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
								<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="no" id="no" value="<%=param.getNo() %>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index" method="post">
								
								<div class="search">
									<select name="reply" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getReply(), -1)%>>전체</option>
										<option value="0" <%=Function.getSelected(param.getReply(), 0)%>>미완료</option>
										<option value="1" <%=Function.getSelected(param.getReply(), 1)%>>완료</option>
									</select>
									<select name="open" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getOpen(), -1)%>>전체</option>
										<option value="0" <%=Function.getSelected(param.getOpen(), 0)%>>비공개</option>
										<option value="1" <%=Function.getSelected(param.getOpen(), 1)%>>공개</option>
									</select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>작성자</option>
										<option value="email" <%=Function.getSelected(param.getStype(), "email") %>>이메일</option>
										<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form> 
						
						
							<!-- //search --> 
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