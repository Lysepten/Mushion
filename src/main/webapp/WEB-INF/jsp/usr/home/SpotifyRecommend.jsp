<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- mushion head -->
<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />
<link rel="stylesheet" href="/resource/recommend.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
</style>

<html class="html-body">
<body>

<c:if test="${maxGenre == 'Classic'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Street'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Grunge'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Minimal'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Casual'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Hippie'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Sporty'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Bohemian'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Biker'}">

<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>

	</c:if>

<c:if test="${maxGenre == 'Punk'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Resort'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

<c:if test="${maxGenre == 'Vintage'}">
<div class="chose-genre"> 방금 고르신 아티스트는 <div class="maxGenre-text">" ${artistGenre } "</div> 장르네요! 추천하는 스타일은~! <div class="maxGenre-text">" ${maxGenre } "</div> 입니다! 이런 스타일은 어때요?</div>

<div class="container-body">
	<div class="container">
		<c:forEach var="url" items="${snapshotUrlList}">
	 <div class="img-wrapper">
    <img src="${url}" alt="image" />
     </div>
</c:forEach>
	</div>
</div>
	</c:if>

</body>