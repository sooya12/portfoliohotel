<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="room.*" %>
<%@ page import="util.*"%>

<%
ArrayList<HashMap> map_c = (ArrayList<HashMap>)request.getAttribute("map_c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 상세 검색 예약 가능 여부 체크</title>
</head>
<body>
	<%
	if(Integer.parseInt(String.valueOf(map_c.get(0).get("res_count"))) < 10) {
	%>
	<div class="d-r-input2">
		<input type="submit" value="객실 예약" />
	</div>
	<%
	} else {
	%>
	<div class="d-r-input2">
		<input class="none" value="예약 가능 객실 없음" />
	</div>
	<%	
	}
	%>
</body>
</html>