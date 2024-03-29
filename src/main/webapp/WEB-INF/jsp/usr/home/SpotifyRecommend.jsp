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

<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
</style>

<html class="html-body">
<body>
	
<div class="genreRecommend">

<c:if test="${maxGenre == 'Classic'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/fc/6d/42/fc6d42ca2c29ebdcfbc3fa2621b0fbe2.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/0d/6a/37/0d6a378dd61ac1ad40488ba7ebffb4c1.jpg" height="500" alt="" />
	</c:if>
	
<c:if test="${maxGenre == 'Street'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/736x/8a/30/77/8a3077971d898103b9fdee8b636f9375.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/736x/9c/c9/85/9cc9851f4f7b777a25e77d90401eb606.jpg" height="500" alt="" />
	</c:if>
	
<c:if test="${maxGenre == 'Grunge'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src=https://www.topstarnews.net/news/photo/201905/620746_311554_4140.jpg height="500" alt="" />
		<img class="image"  src=https://i.pinimg.com/564x/ed/76/4a/ed764aabcde4caf9196ad931f059a454.jpg height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Minimal'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/62/b5/07/62b5072c14af1a2d3ad35cbd7a0169b7.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Casual'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/9d/44/1c/9d441c9713f9e0652348c04da676b480.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/df/f3/73/dff373e56ac13407ac14ea0479f82e88.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Hippie'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/8c/8d/a0/8c8da08dd416f26a5851a08608282987.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/f0/b9/2f/f0b92f614e8cc6f13280b85452106918.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Sporty'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/98/cb/41/98cb41bc714130624621bfb20fa82664.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/82/f1/47/82f147b85cff17c00f58658a3404954d.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Bohemian'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/a9/6b/67/a96b67f506d54c7d5e36f2788177f6d5.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/cf/37/9a/cf379aa68836180b219ae2687a510cf4.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Biker'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/de/89/f6/de89f6cc647631fc784cac6ece745b90.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/e8/f2/ff/e8f2ffa2fa5c5ba5b7663334c5b26d92.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Punk'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://i.pinimg.com/564x/a8/65/2b/a8652bd7d54e700f06f18e2df864b8c5.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/564x/cd/bc/db/cdbcdb84f8894650dfa3e8a6364a3cc9.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Resort'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Vintage'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image" src="https://cdn.imweb.me/upload/S201612025840bcf9c3866/8cf723f484387.jpg" height="500" alt="" />
		<img class="image"  src="https://i.pinimg.com/originals/24/34/4b/24344b97a484f1154fea471db52c5468.jpg" height="500" alt="" />
	</c:if>
	
</div>
</body>