<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>

<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- Article write 관련 -->
<script type="text/javascript">
	let ArticleWrite__submitFormDone = false;
	function ArticleWrite__submit(form) {
		if (ArticleWrite__submitFormDone) {
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
		
// 		alert(${currentId});

		$('#fileInput').attr('name', 'file__article__' + ${currentId} + '__extra__Img__1');

		form.body.value = markdown;

		ArticleWrite__submitFormDone = true;
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

.article-write-button {
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
		<form action="../article/doWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;"
			enctype="multipart/form-data">
			<input type="hidden" name=">${currentId }">
			<input type="hidden" name="body">
			<table class="border-collapse">
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<div>${rq.loginedMember.nickname }</div>
						</td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select class="select select-ghost w-full max-w-xs" name="boardId">
								<option value="1">공지사항</option>
								<option value="2">자유</option>
								<option value="3">QNA</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="input input-bordered w-full max-w-xs write-text" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</td>
					</tr>
					<tr>
						<th>첨부 이미지</th>
						<td>
							<input id="fileInput" placeholder="이미지를 선택해주세요" type="file" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template">
      </script>
							</div>
						</td>
					</tr>


					<tr>
						<th></th>
						<td>
							<button class="article-back-button" class="" type="button" onclick="history.back();">뒤로가기</button>
							<button class="article-write-button" type="submit" value="작성">작성</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
	</div>
</section>
</html>


<%@ include file="../common/foot.jspf"%>