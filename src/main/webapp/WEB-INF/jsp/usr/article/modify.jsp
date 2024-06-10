<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE MODIFY"></c:set>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<!-- Article modify 관련 -->
<script type="text/javascript">
	let ArticleModify__submitFormDone = false;
	function ArticleModify__submit(form) {
		if (ArticleModify__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요.');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		ArticleModify__submitFormDone = true;
		form.submit();
	}
</script>

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
border: none;
padding: 10px;
}


.article-section {
width: 1091px;
display:block; 
margin-top: 2rem;
 margin-left: auto;
 margin-right: auto; 
 font-family: "Pretendard-Regular", sans-serif;
  font-weight: 400;
  font-style: normal;
}

.article-modify-button {
display:inline;
background-color: rgba(40, 167, 255, 1);
width: 90px;
height: 40px;
border-radius: 7px;
margin-left: 800px;
}

.article-back-button{
display:inline;
 width: 90px; 
 height: 40px; 
 border-radius: 7px; 
 border-color: rgba(2, 139, 175, 1); 
 border-style: solid; 
 border-width: 2px; 
}

.toast-ui-editor{
    background-color: #fff;
    border-radius: 10px;
}

.write-text{
color:black;
}

</style>


<html class="html-body"> 
<section class="article-section">
	<div class="mx-auto">
		<form action="../article/doModify" method="POST" onsubmit="ArticleModify__submit(this); return false;">
			<input type="hidden" name="body">
			<input type="hidden" name="id" value="${article.id }" />
			<table class="">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.updateDate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.extra__writer }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="input input-bordered w-full max-w-xs write-text" type="text" name="title" placeholder="제목을 입력해주세요"
								value="${article.title }" />
						</td>
					</tr>

					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template">${article.body }
      </script>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
						<button class="article-back-button" type="button" onclick="history.back();">뒤로가기</button>
							<button class="article-modify-button" type="submit" value="수정">수정</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>
</section>
</html>


<%@ include file="../common/foot.jspf"%>