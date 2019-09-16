<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
    <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.0.min.js"></script>
    
    
    
    <!-- 카카오 로그인 API S -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    </head>
    <body>
    <a href="#;" id="kakaoBtn">카카오 로그인</a>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('f7ee22ef2990352082d98ccda173e6d3');
        
        /*
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
        */
        
        $("#kakaoBtn").click(function() {
            // 로그인 창을 띄웁니다.
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
        });
      //]]>
    </script>
    <!-- 카카오 로그인 API E -->
<hr/>    
    
    <!-- 네이버 로그인 API S -->
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "yyt5qpvTbPa5tqyLB0Td";   //수정할 시 클라이언트 아이디 수정
String redirectURI = URLEncoder.encode("http://localhost:8080/login/naverCallback.jsp"); //수정할 시 콜백url 수정
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>
    <a href="#;" id="naverBtn">네이버 로그인</a>
    
    <script>
    $(function() {
    	$("#naverBtn").click(function() {
    		window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
    	});
    });
    
    </script>
    <!-- 네이버 로그인 API E -->

<hr/>
	<!-- 구글 로그인 API S -->
<a href="#;" id="googleBtn">구글 로그인</a>
<script src="https://apis.google.com/js/api:client.js"></script>
  <script>
  var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '823964675922-d1n4k64j2316otdvt8so4g45k3j6o0sm.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
		scope : 'profile email'
      });
      attachSignin(document.getElementById('googleBtn'));
    });
  };

  function attachSignin(element) {
    console.log(element.id);
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());

			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);

        }, function(error) {
          console.log(JSON.stringify(error, undefined, 2));
        });
  }
  </script>	
	<!-- 구글 로그인 API E -->
	
<hr/>	
	<!-- 페이스북 로그인 API S -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v4.0&appId=1048147718690193&autoLogAppEvents=1"></script>	
<a href="#;" id="facebookBtn">페이스북 로그인</a>	
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1188508654654235',
      cookie     : true,
      xfbml      : true,
      version    : 'v4.0'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  

  function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	}
  
  function statusChangeCallback(response){
		console.log(response);

		if(response.status === 'connected') {
			console.log('사용자가 facebook에 로그인하고 앱에 로그인했습니다');
			FB.api('/me', function(response){
				console.log('name : '+response.name);
			});
		}else if(response.status === 'not_authorized'){
			console.log('사용자가 facebook에 로그인 했지만 앱에 로그인하지 않았습니다.');
		}else {
			console.log('사용자가 facebook에 로그인하지 않았으므로 앱에 로그인했는지 알 수 없습니다');
		}
	}
  
  $(function() {
	  $("#facebookBtn").click(function(){
	  	checkLoginState();
		});
  });
  
</script>
	<!-- 페이스북 로그인 API E -->
    </body>
    </html>