<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 제이쿼리 불러오기 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<!-- mushion head -->
<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<script>
// 필요한 변수들을 설정합니다.
// var getdeviceId = null;
var clientId = '1440fd0b1217439f81573cf6470a1a51'; // 스포티파이 애플리케이션의 클라이언트 ID
var clientSecret = '62e108fbf0fa47c88f7957ba663187a4'; // 스포티파이 애플리케이션의 클라이언트 시크릿
var redirectUri = 'http://localhost:8081/usr/home/SpotifyRedirect'; // 스포티파이 토큰을 받을 리다이렉트 URI
var authorizationCode = `${code }`; // 스포티파이로부터 받은 인가 코드

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
    console.log("엑세스 토큰 잘 나오나? : " + accessToken);

	
    const script = document.createElement("script");
    script.src = "https://sdk.scdn.co/spotify-player.js";
    script.async = true;

    document.body.appendChild(script);
    

    window.onSpotifyWebPlaybackSDKReady = () => {
        const player = new Spotify.Player({
            name: 'Web Playback SDK Quick Start Player',
            getOAuthToken: cb => { cb(accessToken); },
            volume: 0.5
        });

        // Ready
        player.addListener('ready', ({ device_id }) => {
            console.log('Ready with Device ID 1', device_id);
            getdeviceId = device_id;
            console.log("디바이스 ID : "+ getdeviceId);
            
            BearerAuthorizationCode = 'Bearer '+ accessToken;
            console.log("BearerAuthorizationCode : " + BearerAuthorizationCode)
            
            // Web Transfer Playback
				$.ajax({
 				 url: 'https://api.spotify.com/v1/me/player',
 				type: 'PUT',
 			 headers: {
 				   'Authorization': BearerAuthorizationCode,
  			  'Content-Type': 'application/json'
 				 },
				  data: JSON.stringify({
 			   device_ids: [device_id],
 				   play: false
 				 }),
 			 success: function(response) {
 				   console.log(response);
 			 },
 			 error: function(error) {
 			   console.error('Error:', error);
			  }
				});

         // Web Transfer Playback end
           
         
        });

        // Not Ready
        player.addListener('not_ready', ({ device_id }) => {
            console.log('Device ID has gone offline', device_id);
        });
        
        player.addListener('not_ready', ({ device_id }) => {
        	  console.log('Device ID is not ready for playback', device_id);
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
          
          // playbackState
          player.getCurrentState().then(state => {
        	  if (!state) {
        	    console.error('User is not playing music through the Web Playback SDK');
        	    return;
        	  }

        	  var current_track = state.track_window.current_track;
        	  var next_track = state.track_window.next_tracks[0];

        	  
        	  console.log('Currently Playing', current_track);
        	  console.log('Playing Next', next_track);
	  
        	  document.getElementById("spotifyimg").src = current_track.album.images[0].url;
        	  
        	  var SpotifyArtist = document.getElementById('spotifyArtist');
        	  SpotifyArtist.textContent = current_track.artists[0].name;
        	  
        	  var SpotifySongName = document.getElementById('spotifySongName');
        	  SpotifySongName.textContent = current_track.name;
        	  

        	});
          // playbackState end
          
        };
        
        // 이전 곡
        document.getElementById('previous-button').addEventListener('click', () => {
          player.previousTrack().then(() => {
            console.log('이전 곡');
            player.getCurrentState().then(state => {
          	  if (!state) {
          	    console.error('User is not playing music through the Web Playback SDK');
          	    return;
          	  }

          	  var current_track = state.track_window.current_track;
          	  var next_track = state.track_window.next_tracks[0];
              var previous_track = state.track_window.previous_tracks[0];
              
          	console.log('이전 곡', previous_track);
          	  console.log('Currently Playing', current_track);
          	  console.log('Playing Next', next_track);

          	  document.getElementById("spotifyimg").src = previous_track.album.images[0].url;
          	  
        	  var SpotifyArtist = document.getElementById('spotifyArtist');
        	  SpotifyArtist.textContent = previous_track.artists[0].name;
        	  
        	  var SpotifySongName = document.getElementById('spotifySongName');
        	  SpotifySongName.textContent = previous_track.name;

          	});
          });
        });

        // 다음 곡
        document.getElementById('next-button').addEventListener('click', () => {
          player.nextTrack().then(() => {
            console.log('다음 곡');
            player.getCurrentState().then(state => {
          	  if (!state) {
          	    console.error('User is not playing music through the Web Playback SDK');
          	    return;
          	  }

          	  var current_track = state.track_window.current_track;
          	  var next_track = state.track_window.next_tracks[0];
  			
          	  console.log('Currently Playing', current_track);
          	  console.log('Playing Next', next_track);
          	  
          	  document.getElementById("spotifyimg").src = next_track.album.images[0].url;
          	  
        	  var SpotifyArtist = document.getElementById('spotifyArtist');
        	  SpotifyArtist.textContent = next_track.artists[0].name;
        	  
        	  var SpotifySongName = document.getElementById('spotifySongName');
        	  SpotifySongName.textContent = next_track.name;
          	  

          	});
          });
        });
        
        player.connect();
    }

    
  },
  error: function(error) {
    // 요청이 실패한 경우 에러 처리를 수행합니다.
    console.error('액세스 토큰 요청 실패:', error);
  }
});

</script>

<html class="html-body">
<div id="sf-player">
<img id="spotifyimg" class="spotifyimg1" src="" alt="" />
	<div id="spotifySongName"></div>
	<div id="spotifyArtist"></div>
	<button id="previous-button">이전 곡</button>
	<button id="togglePlay">재생</button>
	<button id="next-button">다음 곡</button>
	<div id="current-track-info"></div>
</div>
</html>