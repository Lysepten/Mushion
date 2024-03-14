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

<script>
// 필요한 변수들을 설정합니다.
var clientId = '1440fd0b1217439f81573cf6470a1a51'; // 스포티파이 애플리케이션의 클라이언트 ID
var clientSecret = '62e108fbf0fa47c88f7957ba663187a4'; // 스포티파이 애플리케이션의 클라이언트 시크릿
var redirectUri = 'http://localhost:8081/usr/home/SpotifyRedirect'; // 스포티파이 인가 코드를 받을 리다이렉트 URI
var authorizationCode = `${code }`; // 스포티파이로부터 받은 인가 코드
// var accessToken = null;
var testToken = null;
// Ajax 요청을 보낼 URL을 설정합니다.
var url = 'https://accounts.spotify.com/api/token';

// POST 요청에 필요한 데이터를 설정합니다.
var data = {
  grant_type: 'authorization_code',
  code: authorizationCode,
  redirect_uri: redirectUri,
  client_id: clientId,
  client_secret: clientSecret
};

// Ajax 요청을 보냅니다.
$.ajax({
  url: url,
  type: 'POST',
  data: data,
  success: function(response) {
    // 요청이 성공하면 response 객체에서 액세스 토큰을 가져옵니다.
    var accessToken = response.access_token;
    var expiresIn = response.expires_in;
    // 액세스 토큰을 사용하여 API 호출 등 필요한 작업을 수행합니다.
    // ...
    console.log(accessToken);
    console.log(expiresIn);
    testToken = accessToken;
    console.log("테스트 토큰 실험중 "+ testToken + "잘 나오나");

  },
  error: function(error) {
    // 요청이 실패한 경우 에러 처리를 수행합니다.
    console.error('액세스 토큰 요청 실패:', error);
  }
});

</script>
<head>

<!-- <script src="https://sdk.scdn.co/spotify-player.js"></script> -->
<script>

function spotifyplayer() {
	const script = document.createElement("script");
    script.src = "https://sdk.scdn.co/spotify-player.js";
    script.async = true;

    document.body.appendChild(script);
    
     console.log("플레이어 함수 토큰 테스트 : " + testToken + "잘 나오나")
	
	window.onSpotifyWebPlaybackSDKReady = () => {
		const token = 'BQAwKb0L4s7Qq3XtMyRvgjzNQQJoLm3aC5QVeyaZsSNqjcQ5ZTsq4DxuKxh1CbxBP7BUOUVtEI7IEsBhMYwDtiyEjp8Zj1JCLqQXfZuDApJ6pEeXoVMHBm9H6kc4CDym98o6013S4Y8QRFZJJgKpefhWoYlmPG19aL2iZ7xxtLdfoyXiqQMnQ6kd4qnk2KD7AwqGq1rO3bKkoPAdW_xS6uuH-a_5LXBb';
	    const player = new Spotify.Player({
	        name: 'Web Playback SDK Quick Start Player',
	        getOAuthToken: cb => { cb(testToken); },
	        volume: 0.5
	    });

	    // Ready
	    player.addListener('ready', ({ device_id }) => {
	        console.log('Ready with Device ID', device_id);
	    });

	    // Not Ready
	    player.addListener('not_ready', ({ device_id }) => {
	        console.log('Device ID has gone offline', device_id);
	    });

	    player.addListener('initialization_error', ({ message }) => {
	        console.error(message);
	    });

	    player.addListener('authentication_error', ({ message }) => {
	        console.error(message);
	    });

	    player.addListener('account_error', ({ message }) => {
	        console.error(message);
	    });

	    document.getElementById('togglePlay').onclick = function() {
	      player.togglePlay();
	    };

	    player.connect();
	}
	
  }
  

</script>

<div>code is : ${code }</div>

<button id="togglePlay">Toggle Play</button>

<button onclick="spotifyplayer()">플레이어 버튼</button>


</head>
<body></body>
</html>