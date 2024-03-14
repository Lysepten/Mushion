<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- mushion head -->
<%-- <%@ include file="../common/mushionHead.jspf"%> --%>
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
var getdeviceId = null;
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
    var refreshToken = response.refresh_token;
    var tokenType = response.token_type;

    // 액세스 토큰을 사용하여 API 호출 등 필요한 작업을 수행합니다.
    // ...
    console.log(accessToken);
    console.log(expiresIn);
    console.log(refreshToken);
    console.log("토큰 타입 : "+ tokenType);
    
    testToken = accessToken;
    console.log("테스트 토큰 실험중 "+ testToken + "잘 나오나");
	
    const script = document.createElement("script");
    script.src = "https://sdk.scdn.co/spotify-player.js";
    script.async = true;

    document.body.appendChild(script);
  },
  error: function(error) {
    // 요청이 실패한 경우 에러 처리를 수행합니다.
    console.error('액세스 토큰 요청 실패:', error);
  }
});




window.onSpotifyWebPlaybackSDKReady = () => {
	const token = 'BQDNDeZ_Rpwvf4t1EGDQiMRPns6scdXlbnzUCABE3TsKrpfqa3KwZSJdA9WDhh0FKI_yDWsAqK-fTaYDwzrYEykMCiCNwheBya6HUZIyNqimqiMWD-0mkOm-aAt4W77OYsBXRkyKuWUoWCv89Rf88WHKPPpsiDLds_j7i58NQ6P1ti1k56yEaT3yVtmIulEm_0uD6XDm1sdyRXqM56QL31BXMK5biRf7';
    const player = new Spotify.Player({
        name: 'Web Playback SDK Quick Start Player',
        getOAuthToken: cb => { cb(token); },
        volume: 0.5
    });

    // Ready
    player.addListener('ready', ({ device_id }) => {
        console.log('Ready with Device ID 1', device_id);
        getdeviceId = device_id;
        console.log(getdeviceId + 2);
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
    
    // 재생할 때
    document.getElementById('play-pause-button').addEventListener('click', () => {
      player.togglePlay().then(() => {
        console.log('재생/일시정지');
      });
    });

    // 이전 곡
    document.getElementById('previous-button').addEventListener('click', () => {
      player.previousTrack().then(() => {
        console.log('이전 곡');
      });
    });

    // 다음 곡
    document.getElementById('next-button').addEventListener('click', () => {
      player.nextTrack().then(() => {
        console.log('다음 곡');
      });
    });
    
    

    player.connect();
}

console.log(getdeviceId + 3)

var url = 'https://api.spotify.com/v1/me/player/play?device_id=' + getdeviceId;
var data = {
  "context_uri": "spotify:album:5ht7ItJgpBH7W6vJ5BqpPr",
  "offset": {
    "position": 5
  },
  "position_ms": 0
};

$.ajax({
  url: url,
  type: 'PUT',
  headers: {
    'Authorization': 'Bearer ' + testToken,
    'Content-Type': 'application/json'
  },
  data: JSON.stringify(data),
  success: function(response) {
    console.log(response);
    // 성공적으로 재생 명령을 보낸 후의 처리를 여기서 수행할 수 있습니다.
  },
  error: function(xhr, status, error) {
    console.error(error);
    // 오류가 발생한 경우에 대한 처리를 여기서 수행할 수 있습니다.
  }
});

</script>
<head>


<script>


</script>

<div>code is : ${code }</div>

<button id="togglePlay">Toggle Play</button>

<button onclick="spotifyplayer()">플레이어 버튼</button>

<div id="player">
  <button id="play-pause-button">재생</button>
  <button id="previous-button">이전 곡</button>
  <button id="next-button">다음 곡</button>
  <div id="current-track-info"></div>
</div>


</head>
<body></body>
</html>