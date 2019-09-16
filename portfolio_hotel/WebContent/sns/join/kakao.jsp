<%@ page contentType="text/html; charset=utf-8"%>
   
 <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    </head>
    <body>
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a>
    
  
    <script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('4d081a510a22bd9e6626b30d9311132e');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            /* alert(JSON.stringify(authObj)); */
             /* alert("로그인 되었습니다.");
             Kakao.API.request({
                  url: '/v2/user/me',
                  success: function(res) {
                    /* alert(JSON.stringify(res)); */
                    /*
                    console.log(JSON.stringify(res));
                    console.log('email:'+res.kakao_account.email);
                    console.log('name:'+res.properties.nickname);
                    console.log('id:'+res.id); */
                    
                  
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
            		error : function () {
            			alert("이미 가입된 계정입니다.");
            			window.close();
            			}
                      });
                   });
                    // 로그인 하는 경우
                    // ajax member 테이블에 카카오계정을 회원가입한 데이터가
                    // 있으면 ajax 로그인
                    // 없으면 alert('회원가입해라')
                    
                    // 회원가입 하는 경우
                    // ajax member 테이블에 카카오계정을 회원가입한 데이터가
                    // 있으면 alert('이미 가입됌')
                    // 없으면 ajax DB insert
                    
            /*         
                  },
                  fail: function(error) {
                    alert(JSON.stringify(error));
                  }
                });
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        }); */
        
        
      //]]>
      
      
        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
              success: function(authObj) {
                alert(JSON.stringify(authObj));
              },
              fail: function(err) {
                alert(JSON.stringify(err));
              }
            });
          };
          
        $(function(){
           $("img[src='kakao.png']").click(function(){
              loginWithKakao();
           });
        });  
    </script>
   <hr/>
   <!-- <img src="kakao.png" onclick="loginWithKaKao();"> -->
   <img src="kakao.png">
    </body>
    </html>