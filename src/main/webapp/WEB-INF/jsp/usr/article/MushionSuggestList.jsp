<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Suggest"></c:set>

<%@ include file="../common/mushionHead.jspf"%>

<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<style>
.back-page {
margin-top: 30px;
margin-bottom: 10px;
margin-left: 10px;
}

.main-page{
margin-bottom: 20px;
margin-left: 10px;
}

.article-section {

width: 1400px;
display:block; 
margin-top: 50px;
 margin-left: auto;
 margin-right: auto; 
 font-family: "Pretendard-Regular", sans-serif;
  font-weight: 400;
  font-style: normal;
  
}

td{
padding-left: 50px;
border-bottom: solid 1px white;
padding-bottom: 10px;
padding-top: 10px;

}

th{
padding-bottom: 10px;
}
.ms-column{
border-bottom: solid 5px rgb(2, 139, 175);
margin-bottom: 20px; 
padding-bottom: 20px;
}

.section-line{
margin-top: 50px;
margin-bottom: 50px;
width: 100%;
height: 1px;
background-color: rgb(2, 139, 175);
}


</style>

<html class="html-body"> 
<section class="article-section"> 
	<table class="topdb-text">
	<colgroup>
			<col style="width: 5%" />
			<col style="width: 40%" />
			<col style="width: 20%" />
			<col style="width: 15%" />
		</colgroup>
				<div>
				<a class="main-page btn btn-xs" href="/usr/home/main">홈으로</a>
				<a class="back-page btn btn-xs" href="/usr/home/Mushion">이전 페이지로 이동</a>
          </div>
<tr class="ms-column">
				<th>번호</th>
				<th>곡 제목</th>
				<th>아티스트</th>
				<th>장르</th>
			</tr>
			<c:forEach var="topdb" items="${topdbs }">
				<tr class="">
					<td>${topdb.id }</td>
					<td>${topdb.genre }</td>
					<td>${topdb.artist }</td>
					<td>${topdb.track }</td>
				</tr>
			</c:forEach>
			</table>
</section>
</html>