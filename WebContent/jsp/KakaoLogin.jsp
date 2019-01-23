<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <head> -->
<!-- 	<title>카카오톡 로그인</title> -->
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->
<!-- 	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script> -->
<!-- 	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<!-- 	<script> -->
<!-- // 		$(document).ready(function(){ -->
<!-- // 			Kakao.init("fb83194ebd014b663a5d291d64d0743d"); -->
<!-- // 			function getKakaotalkUserProfile(){ -->
<!-- // 				Kakao.API.request({ -->
<!-- // 					url: '/v1/user/me', -->
<!-- // 					success: function(res) { -->
<!-- // 						$("#kakao-profile").append(res.properties.nickname); -->
<!-- // 						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"})); -->
<!-- // 					}, -->
<!-- // 					fail: function(error) { -->
<!-- // 						console.log(error); -->
<!-- // 					} -->
<!-- // 				}); -->
<!-- // 			} -->
<!-- // 			function createKakaotalkLogin(){ -->
<!-- // 				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove(); -->
<!-- // 				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"}); -->
<!-- // 				loginBtn.click(function(){ -->
<!-- // 					Kakao.Auth.login({ -->
<!-- // 						persistAccessToken: true, -->
<!-- // 						persistRefreshToken: true, -->
<!-- // 						success: function(authObj) { -->
<!-- // 							getKakaotalkUserProfile(); -->
<!-- // 							createKakaotalkLogout(); -->
<!-- // 						}, -->
<!-- // 						fail: function(err) { -->
<!-- // 							console.log(err); -->
<!-- // 						} -->
<!-- // 					}); -->
<!-- // 				}); -->
<!-- // 				$("#kakao-logged-group").prepend(loginBtn) -->
<!-- // 			} -->
<!-- // 			function createKakaotalkLogout(){ -->
<!-- // 				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove(); -->
<!-- // 				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"}); -->
<!-- // 				logoutBtn.click(function(){ -->
<!-- // 					Kakao.Auth.logout(); -->
<!-- // 					createKakaotalkLogin(); -->
<!-- // 					$("#kakao-profile").text(""); -->
<!-- // 				}); -->
<!-- // 				$("#kakao-logged-group").prepend(logoutBtn); -->
<!-- // 			} -->
<!-- // 			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){ -->
<!-- // 				createKakaotalkLogout(); -->
<!-- // 				getKakaotalkUserProfile(); -->
<!-- // 			}else{ -->
<!-- // 				createKakaotalkLogin(); -->
<!-- // 			} -->
<!-- // 		}); -->
<!-- 	</script> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<div id="kakao-logged-group"></div> -->
<!-- 	<div id="kakao-profile"></div> -->
<!-- </body> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('fb83194ebd014b663a5d291d64d0743d');
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
      //]]>
    </script>

</body>
</html>