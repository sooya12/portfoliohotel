<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "yyt5qpvTbPa5tqyLB0Td";   //수정할 시 클라이언트 아이디 수정
String redirectURI = URLEncoder.encode("http://hyeon012.cafe24.com/sns/join/naverCallback.jsp"); //수정할 시 콜백url 수정
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/choice_join.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_회원가입</title>
</head>




<body>
    <jsp:include page="/header_menu" flush="true" />
    
    <div id="container">
        <div class="join-section clear">
            <h2>멤버십 회원가입</h2>
            <h3>Log In</h3>
            <div class="join-box join-box1 clear">
                <h2>호텔 멤버십 계정 만들기</h2>
                <p>회원가입 페이지로 이동합니다.</p>
                <form action="#" method="POST">

                    <div class="join-box-logo"><img src="/img/header-logo.png"></div>

                    <!-- <div class="join-board clear">
                            <input type="text" id="email" name="email" placeholder="이메일 입력">
                    </div>  -->
                </form>    
            
                <div class="join-btn" >
                    <a href="join" onclick="goJoin">호텔 멤버십 가입 </a>
                </div>
                
            </div>    

            <div class="join-box join-box2 clear">
                    <h2>SNS로 회원가입</h2>
                    <p>SNS 계정을 통해 간편 가입이 가능합니다.</p>

                    <ul class="snsJoin clear">
                   <li>
                        <!-- <div id="naver_id_login" class="naver" ><p>네이버로 로그인</p></div> -->
                         
                        <button class="naver" href="#;" id="naverBtn"><p>네이버로 회원가입</p></button>
       			<script>
			    		$(function() {
			    			$("#naverBtn").click(function() {
			    				window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
			    			});
			    		});
    
    			</script>
                        </li>

                        <li>
                            <button class="kakao" onclick="loginWithKakao()"><p>카카오로 회원가입</p></button> 
                            <!-- <button class="kakao" href="#;" id="kakaoBtn"><p>카카오로 회원가입</p></button> -->
                    
                           
                        </li>
                    </ul>
            </div>  
        </div>
    </div>
    <jsp:include page="/footer" flush="true"/>
</body>

  
    <!-- <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a> -->
    <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type='text/javascript' >
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('4d081a510a22bd9e6626b30d9311132e');
        // 카카오 로그인 버튼을 생성합니다.
        
        
        
       /*  Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            /* alert(JSON.stringify(authObj)); */
             /* alert("로그인 되었습니다."); */
            
             function loginWithKakao() {
             	Kakao.Auth.loginForm({
     				success: function(authObj) {
     	              	console.log(JSON.stringify(authObj));
            
            
            
             Kakao.API.request({
                  url: '/v2/user/me',
                  success: function(res) {
                    /* alert(JSON.stringify(res)); */
            				console.log('kakao id : '+res.id);
							console.log('kakao email : '+res.kakao_account.email);
							console.log('kakao birthday : '+res.kakao_account.birthday);
							console.log('kakao gender : '+res.kakao_account.gender);
							console.log('kakao nickname : ' +res.properties['nickname']);
                    
                    
                    $.ajax({
                       url : "/member/insertSns.do",
                       data : {
                    	   
                    	   l_name : res.properties.nickname,
	               			email : res.kakao_account.email,
	               			sns_key : res.id,
	               			gender : "0",
	               			sns_type : "2"
                       },
                       dataType : "HTML",
               		success : function(data) {
               			alert("정상적으로 가입되었습니다.");
               			window.close();
               		},
               		error : function(){
        				alert("이미 가입된 계정입니다.");
        				window.close();            		            		
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
   

</html>