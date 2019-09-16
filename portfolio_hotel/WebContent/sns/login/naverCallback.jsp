<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%

String clientId = "yyt5qpvTbPa5tqyLB0Td";//애플리케이션 클라이언트 아이디값";
String clientSecret = "cNNDkHZfCt";//애플리케이션 클라이언트 시크릿값";
String code = request.getParameter("code");
String state = request.getParameter("state");
String redirectURI = URLEncoder.encode("http://hyeon012.cafe24.com/sns/login/naverCallback.jsp", "UTF-8");
String apiURL;
apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";
JSONObject obj = new JSONObject();
try {
	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	con.setRequestMethod("GET");
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if(responseCode==200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else {  // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer res = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
	}
	br.close();
	if(responseCode==200) {
		//out.println(res.toString());
		JSONParser parser = new JSONParser();
		obj = (JSONObject) parser.parse(res.toString());
		access_token = (String) obj.get("access_token");
	}
} catch (Exception e) {
	out.println(e);
}

// 사용자 정보 조회
String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
try {
	String userUrl = "https://openapi.naver.com/v1/nid/me";
	URL url = new URL(userUrl);
	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	con.setRequestMethod("GET");
	con.setRequestProperty("Authorization", header);
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if(responseCode==200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else {  // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer res = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
	}
	br.close();
	//out.println(res.toString());
	JSONParser parser = new JSONParser();
	obj = (JSONObject) parser.parse(res.toString());
} catch (Exception e) {
	System.out.println(e);
}

JSONObject resJson = (JSONObject) obj.get("response");


%>

<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script>
$(function() {
	$.ajax({
		url : "/member/snsCheck.do",
		data : {
			email : "<%=(String)resJson.get("email")%>",
			sns_key : "<%=(String)resJson.get("id")%>",
			sns_type : "1"
		},
		dataType : "HTML",
		success : function(data) {
			if (data.trim() == "ok") {
				opener.location.href="/index";
			} else {
				alert("가입되지 않은 계정입니다. 먼저 가입해주세요");
			}
			window.close();
		},
		error : function () {
			
		}
	});
});
</script>