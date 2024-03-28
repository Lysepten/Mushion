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
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>
	
<c:if test="${maxGenre == 'Street'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>
	
<c:if test="${maxGenre == 'Grunge'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src=https://www.topstarnews.net/news/photo/201905/620746_311554_4140.jpg height="500" alt="" />
		<img class="image"  src=https://i.pinimg.com/564x/ed/76/4a/ed764aabcde4caf9196ad931f059a454.jpg height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Minimal'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Casual'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Hippie'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Sporty'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Bohemian'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Biker'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
	</c:if>

<c:if test="${maxGenre == 'Punk'}">
		<div>선택한 아티스트의 장르는 ${artistGenre } 입니다. 어울리는 스타일은~! : ${maxGenre } 입니다. 이런 스타일 어때요?</div>
		<img class="image"  src="https://cdn.imweb.me/thumbnail/20220831/601b733c0051b.jpg" height="500" alt="" />
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

${maxGenre } 입니다.
</body>