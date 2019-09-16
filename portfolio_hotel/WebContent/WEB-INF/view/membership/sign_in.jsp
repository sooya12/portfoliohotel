<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*"%>
<%@ page import="util.*"%>
<%
	MemberVO param = (MemberVO) request.getAttribute("vo");
	ArrayList<MemberVO> list = (ArrayList) request.getAttribute("list");
	MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>


<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "yyt5qpvTbPa5tqyLB0Td";   //수정할 시 클라이언트 아이디 수정
String redirectURI = URLEncoder.encode("http://hyeon012.cafe24.com/sns/login/naverCallback.jsp"); //수정할 시 콜백url 수정
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>



<script>


function loginCheck(){
	if ( getObject("email").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("email").focus();
		return false;
	}
	if ( getObject("password").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("password").focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked==true) {
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires="+now.getTime();
	}
	return true;
	
	
}

function userid_chk() {
	var f=document.member;
	var useridname = CookieVal("cookie_userid");
	
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}




</script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>로그인페이지</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true" />

    
    <div id="container">
        <div class="login-section">
            <h2>멤버십 로그인</h2>
            <h3>Sign In</h3>
            <div class="login-box clear">
                <!-- <form action="#" method="POST"> -->
                <form name="mamber" id="member" method="post" action=" <%=request.getContextPath()%>/membership/login" onsubmit="return loginCheck();">
                    <div class="login-box-logo"><img src="/img/header-logo.png"></div>
                    <div class="login-board clear">
                        <div class="login-box-left">
                            <!-- ID 구역 -->
                            <!-- <input type="text" id="id" name="id" placeholder="아이디 또는 이메일"> -->
                            <input type="text" id="email" name="email" placeholder="이메일">
                            <!-- 비밀번호 구역 -->
                            <!-- <input type="password" id="password" name="password" placeholder="비밀번호"> -->
                            <input type="password" id="password" name="password" placeholder="비밀번호">
                        </div>
                        <div class="login-board-right">
                            <!-- <input type="submit" id="submit" value="LOGIN"> -->
                            <input type="submit" <%-- src="<%=request.getContextPath()%>" --%> value ="로그인" class="loginBtn" title=""/>
                        </div>
                        <div class="id-remember">
                            <input type="checkbox" id="login-chk" name="login-chk" >
                            <label for="login-chk">아이디 기억하기</label>
                        </div>
                        <!-- <h4 class="find_id"><a href="#">· 아이디 / 비밀번호 찾기</a></h4> -->
                        <h4 class="find_id">
							<a href="find_email">이메일찾기 </a><a>/</a>
							<a href="find_pw"> 비밀번호 찾기</a>
						</h4>
                        
                    </div> 
                </form>    

                <div class="login-info">
                    <p>
                        호텔 회원번호의 경우 아이디 입력 영역에 입력해 주세요.<br/>
                        오프라인 회원의 경우 온라인 '반얀트리 멤버십' 가입을 통해 계정연동 가능합니다.
                    </p>

                    <ul class="snsLogin clear">
                     
                        <li>
                        <!-- <div id="naver_id_login" class="naver" ><p>네이버로 로그인</p></div> -->
                         
                        <button class="naver" href="#;" id="naverBtn"><p>네이버로 로그인</p></button>
       			<script>
			    		$(function() {
			    			$("#naverBtn").click(function() {
			    				window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
			    			});
			    		});
    
    			</script>
                        </li>

                        <li>
                            <!-- <button class="kakao"><p>카카오로 로그인</p></button> -->
                            <button class="kakao" onclick="loginWithKakao()"><p>카카오로 로그인</p></button>
                        </li>
                    </ul>
                </div>
                <h5>아직 호텔 회원이 아니신가요?</h5>
                <p>온라인 회원은 예약/결제 정보를 온라인에서 확인하실 수 있습니다.</p>
                <div class="join-box">
                    <a href="choice_join">호텔 멤버십 가입 </a>
                </div>
                <div class="error-text clear">
                    <h6>멤버십 가입 및 온라인 인증에 문제가 생기셨나요?</h6>
                    <h6>대표문의 (02-455-5000)로 연락 주시기 바랍니다.</h6>
                </div>
            </div>    
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>

<!-- <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a> -->
    <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('4d081a510a22bd9e6626b30d9311132e');
      
        function loginWithKakao() {
        	Kakao.Auth.loginForm({
				success: function(authObj) {
	              	console.log(JSON.stringify(authObj));
	
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(res) {
					
							console.log('kakao id : '+res.id);
							console.log('kakao email : '+res.kakao_account.email);
							console.log('kakao birthday : '+res.kakao_account.birthday);
							console.log('kakao gender : '+res.kakao_account.gender);
							console.log('kakao nickname : ' +res.properties['nickname']);
							
							$.ajax({
								url : "/member/snsCheck.do",
								data : {
									email : res.kakao_account.email,
									sns_key : res.id,
									sns_type : "2"
								},
								dataType : "HTML",
								success : function(data) {
									if (data.trim() == "ok") {
										location.href="/index";
									} else {
										alert("가입되지 않은 계정입니다. 먼저 가입해주세요");
									}
									
								},
								error : function () {
									
								}
							});
					
					 	},
					 	fail: function(error) {
							alert(JSON.stringify(error));
					 	}
					});
				},
				fail: function(err) {
				  alert(JSON.stringify(err));
				}
            });
        }
    </script>
    

   <!-- <img src="kakao.png" onclick="loginWithKaKao();"> -->
 <!-- <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a> -->
    </html>