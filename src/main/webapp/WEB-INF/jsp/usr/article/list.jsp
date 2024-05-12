<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>

<%-- <%@ include file="../common/head.jspf"%> --%>
<%@ include file="../common/mushionHead.jspf"%>

<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />


<style>

 table { 
     border-collapse: collapse; 
     text-indent: 0; 
     border: none;
 }

 tbody { 
     display: table-row-group; 
     vertical-align: middle; 
     unicode-bidi: isolate; 
    border: none; 
 } 

tr, td {
/* border: none; */
padding: 10px;
text-align: center;
}

thead{
height:50px;
background-color: #0D1E27;
border-radius: 10px;
}

th{
white-space: nowrap;
}

.article-section {
width: 1091px;
display:block; 
margin-top: 50px;
 margin-left: auto;
 margin-right: auto; 
 font-family: "Pretendard-Regular", sans-serif;
  font-weight: 400;
  font-style: normal;
}

tr{
border-radius: 10px;
}

.search-form {
 width: 800px;
 margin-left: auto;
 margin-right: auto; 
 text-align: center;
 margin-bottom: 20px;
 margin-top: 20px;
 color:black;
  font-family: "Pretendard-Regular", sans-serif;
  font-weight: 400;
  font-style: normal;
}

.list-search-button{
background-color : #028BAF;
height: 32px;
border-radius: 7px;
  font-size: 0.875rem;
  color:white;
}


</style>

<html class="html-body">
<section class="article-section">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="badge badge-outline">${articlesCount }개</div>
			<div class="flex-grow"></div>
			<a class="btn btn-xs mr-4" href="/usr/article/write">글쓰기</a>
		</div>
	</div>
	<table class="">
		<colgroup>
			<col style="width: 2%" />
			<col style="width: 20%" />
			<col style="width: 40%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 8%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>싫어요</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${articles }">
				<tr class="hover">

					<td>${article.id }</td>
					<td>${article.regDate.substring(0,10) }</td>
					<td>
						<a href="detail?id=${article.id }">${article.title }
							<c:if test="${article.extra__repliesCnt > 0 }">
								<span style="color: red;">[${article.extra__repliesCnt }]</span>
							</c:if>
						</a>
					</td>
					<td>${article.extra__writer }</td>
					<td>${article.hitCount }</td>
					<td>${article.goodReactionPoint }</td>
					<td>${article.badReactionPoint }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
			<form action="" class="search-form">
				<input type="hidden" name="boardId" value="${param.boardId }" />
				<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm max-w-xs"
					name="searchKeywordTypeCode">
					<option value="title">제목</option>
					<option value="body">내용</option>
					<option value="title,body">제목 + 내용</option>
				</select>
				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="검색어를 입력하세요"
					class="input-sm input input-bordered w-48 max-w-xs" />
				<button class="list-search-button" type="submit">검색</button>
			</form>
	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

		<c:set var="baseUri" value="?boardId=${boardId }" />
		<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
		</c:if>

	</div>

</section>
</html>


<%@ include file="../common/foot.jspf"%>