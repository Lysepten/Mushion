<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- mushion head -->
<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />
<link rel="stylesheet" href="/resource/player.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html class="html-body" lang="en" >
<div class="container">
  <div class="iphone neu">
    <div class="title">
      <div><i class="fas fa-chevron-left"></i></div>
      <div>NOW PLAYING</div>
      <div><i class="fas fa-ellipsis-v"></i></div>
    </div>
    <div class="album-cover">
      <div class="album-overlay"></div>
<!--       <img src="https://img.hankyung.com/photo/202101/01.25017855.1.jpg" alt=""> -->
      <img id="spotifyimg" class="spotifyimg1" src="" alt="" />
      <h2 id="spotifySongName" class="song-title">
      </h2>
      <h3 id="spotifyArtist" class="artist-title">
      </h3>
    </div>
    <div class="buttons">
          <button id="ArtistGenresExtraction" class="btn lg red neu"><i class="fas fa-heart"></i></button>
          <button id="previous-button" class="btn lg neu"><i class="fas fa-backward"></i></button>
          <button id="togglePlay" class="btn lg neu"><i class="fas fa-play"></i></button>
          <button id="next-button" class="btn lg neu"><i class="fas fa-forward"></i></button>
      </div>
    <div class="track neu">
      <div></div>
    </div>
    <div class="lyrics">
      <i class="fas fa-angle-up"></i>
      <span>LYRICS</span>
    </div>
  </div>
</div>
<form class="args-form" action="/usr/home/VarArgsTest" onsubmit="return GenreCheck()">
 <label id="spotifyArtistGenre">
    <input type="hidden" id="Genre" name="args" value="">
  </label>
<input onclick="" value="보내기!" class="btn" type="submit" />
</form>
</html>

