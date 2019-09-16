<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("param");
QnaVO qdata = (QnaVO) request.getAttribute("qdata");

%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/function.js"></script> 
<script type="text/javascript">
function goRead2() {
	if ($("#password").val() ==""){
		alert("성을 입력해 주세요");
		$("#password").focus();
		return false;
	}
	return true;
}
</script>
			
        	<div class="pw">
        	<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goRead2();" >
        		<label for="">게시글 비밀번호</label>
        		<input type="password" id="password" name="password" style= "border: 2px solid #eee;">
        		<input type="submit" class="goBtn" href="javascript:$('#frm').submit();" value="확인">
        		
        		<!---------------------  필요값   --------- ------------------>
        		<input type="hidden" name="cmd" value="pwCheck" />
        		<input type="hidden" name="no" value="<%=param.getNo() %>" /> 
        		<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
				<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
        	</form>
        		
        	</div>
        	