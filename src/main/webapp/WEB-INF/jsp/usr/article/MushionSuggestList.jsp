<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } Suggest"></c:set>

<%@ include file="../common/head.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<html class="section-body">
	<table class="table-box-1 table topdb-text" border="1">
				<div>
			<a class="" href="/usr/home/Mushion">이전 페이지로 이동</a>
			<br />
          <a class="" href="/usr/home/main">홈으로</a>
          </div>
<tr>
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

</html>