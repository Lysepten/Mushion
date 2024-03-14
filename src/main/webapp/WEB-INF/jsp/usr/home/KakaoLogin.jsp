<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- mushion head -->
<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<button class="api-btn">버튼</button>
  <meta charset="utf-8" />
  <title>성공했나</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js" integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
  <script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
    Kakao.init('4f69b55c9c466f91d08d33415d35266a');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
  </script>
  <script>
    var codetext = `${code }`;

    $.ajax({
        type : "POST"
        , url : 'https://kauth.kakao.com/oauth/token'
        , data : {
            grant_type : 'authorization_code',
            client_id : '7381a40d2ee391d72b200979558a901a',
            redirect_uri : 'http://localhost:8081/usr/home/KakaoLogin',
            code : codetext
        }
        , contentType:'application/x-www-form-urlencoded;charset=utf-8'
        , success : function(response) {
            Kakao.Auth.setAccessToken(response.access_token);
            document.querySelector('button.api-btn').style.visibility = 'visible';
        }
        ,error : function(jqXHR, error) {
        }
    });
    
    function kakaoLogout() {
        Kakao.API.request({
          url: '/v1/user/unlink',
        })
          .then(function(response) {
   			 console.log(response);
          })
          .catch(function(err) {
        		    console.log(error);
          });
    }

    function requestUserInfo() {
        Kakao.API.request({
          url: '/v2/user/me',
        })
          .then(function(res) {
            alert(JSON.stringify(res));
          })
          .catch(function(err) {
            alert(
              'failed to request user information: ' + JSON.stringify(err)
            );
          });
      }
  </script>
  

<div>${code }</div>

<button onclick="requestUserInfo()">유저</button>
<br />
<button onclick="kakaoLogout()">로그아웃</button>

</head>
<body></body>
</html>