<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%-- <%@ include file="../common/head.jspf"%> --%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->

<!-- 변수 -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
	params.memberId = parseInt('${loginedMemberId}');
	
	console.log(params);
	console.log(params.memberId);
	
	var isAlreadyAddGoodRp = ${isAlreadyAddGoodRp};
	var isAlreadyAddBadRp = ${isAlreadyAddBadRp};
	
	
</script>

<!-- 조회수 -->
<script>
	function ArticleDetail__doIncreaseHitCount() {
		const localStorageKey = 'article__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}

		localStorage.setItem(localStorageKey, true);

		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}

	$(function() {
		// 		ArticleDetail__doIncreaseHitCount();
		setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
	});
</script>

<!-- 좋아요 싫어요  -->
<script>
	<!-- 좋아요 싫어요 버튼	-->
	function checkRP() {
		if(isAlreadyAddGoodRp == true){
			$('#likeButton').toggleClass('btn-outline');
		}else if(isAlreadyAddBadRp == true){
			$('#DislikeButton').toggleClass('btn-outline');
		}else {
			return;
		}
	}
	
	function doGoodReaction(articleId) {
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 해야해. 로그인 페이지로 가실???')){
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 uri를 같이 보냄
			}
			return;
		}
		
		$.ajax({
			url: '/usr/reactionPoint/doGoodReaction',
			type: 'POST',
			data: {relTypeCode: 'article', relId: articleId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var likeCount = $('#likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					
					if(data.resultCode == 'S-1'){
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
					}else if(data.resultCode == 'S-2'){
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
					}else {
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
					}
					
				}else {
					alert(data.msg);
				}
		
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('좋아요 오류 발생 : ' + textStatus);

			}
			
		});
	}
	
	
	
	function doBadReaction(articleId) {
		
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 해야해. 로그인 페이지로 가실???')){
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 uri를 같이 보냄
			}
			return;
		}
		
	 $.ajax({
			url: '/usr/reactionPoint/doBadReaction',
			type: 'POST',
			data: {relTypeCode: 'article', relId: articleId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var likeCount = $('#likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					
					if(data.resultCode == 'S-1'){
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
					}else if(data.resultCode == 'S-2'){
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
		
					}else {
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
					}
			
				}else {
					alert(data.msg);
				}
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('싫어요 오류 발생 : ' + textStatus);
			}
			
		});
	}
	
	$(function() {
		checkRP();
	});
</script>

<!-- 댓글 -->
<script>
		var ReplyWrite__submitDone = false;

		function ReplyWrite__submit(form) {
			if (ReplyWrite__submitDone) {
				alert('이미 처리중입니다');
				return;
			}
			console.log(123);
			
			console.log(form.body.value);
			
			if (form.body.value.length < 3) {
				alert('댓글은 3글자 이상 입력해');
				form.body.focus();
				return;
			}

			ReplyWrite__submitDone = true;
			form.submit();

		}
</script>
<!-- 댓글 수정 -->
<script>
function toggleModifybtn(replyId) {
	
	console.log(replyId);
	
	$('#modify-btn-'+replyId).hide();
	$('#save-btn-'+replyId).show();
	$('#reply-'+replyId).hide();
	$('#modify-form-'+replyId).show();
}

function doModifyReply(replyId) {
	 console.log(replyId); // 디버깅을 위해 replyId를 콘솔에 출력
	    
	    // form 요소를 정확하게 선택
	    var form = $('#modify-form-' + replyId);
	    console.log(form); // 디버깅을 위해 form을 콘솔에 출력

	    // form 내의 input 요소의 값을 가져옵니다
	    var text = form.find('input[name="reply-text-' + replyId + '"]').val();
	    console.log(text); // 디버깅을 위해 text를 콘솔에 출력

	    // form의 action 속성 값을 가져옵니다
	    var action = form.attr('action');
	    console.log(action); // 디버깅을 위해 action을 콘솔에 출력
	
    $.post({
    	url: '/usr/reply/doModify', // 수정된 URL
        type: 'POST', // GET에서 POST로 변경
        data: { id: replyId, body: text }, // 서버에 전송할 데이터
        success: function(data) {
        	$('#modify-form-'+replyId).hide();
        	$('#reply-'+replyId).text(data);
        	$('#reply-'+replyId).show();
        	$('#save-btn-'+replyId).hide();
        	$('#modify-btn-'+replyId).show();
        },
        error: function(xhr, status, error) {
            alert('댓글 수정에 실패했습니다: ' + error);
        }
	})
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

th{
white-space: nowrap;
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
/* position: absolute; */
 width: 90px; 
 height: 40px; 
 border-radius: 7px; 
 border-color: rgba(2, 139, 175, 1); 
 border-style: solid; 
 border-width: 2px; 
/* left: 500px; */
/* top: 1018px; */
}

.toast-ui-editor{
/*     background-color: rgb(242, 242, 242); */
    border-radius: 10px;

}

.detail-regdate {
color: #6e6e73;
font-size: 14px;
padding-bottom: 20px;
}

.detail-writer{
/* color: #6e6e73; */
font-size: 16px;
padding-left: 10px;

}

.detail-hitCount{
color: #6e6e73;
font-size: 14px;
}


.detail-title{
font-size: 40px;
padding-left: 10px;
padding-top: 20px;
}

.detail-body{
font-size: 17px;
}

#likeCount{
display:inline;
font-weight: 600;
/* white-space: nowrap; */
}


#DislikeCount{
display:inline;
font-weight: 600;
}

.toast-ui-viewer{
 background-color: rgb(242, 242, 242);
/*      border-radius: 10px; */

}

.detail-contents{
 width:900px;
margin-left:auto;
margin-right: auto;
background-color: rgb(242, 242, 242);
border-radius: 10px;
color:black;
padding-left: 50px;
box-shadow: inset 0px 0px 10px #666;
}

#likeButton{
margin-bottom: 10px;
width: 75px;
display:inline;
white-space: nowrap;
}

#DislikeButton{
width: 75px;
display:inline;
white-space: nowrap;
}

.section-line{
margin-top: 50px;
margin-bottom: 50px;
width: 100%;
height: 1px;
background-color: rgb(2, 139, 175);
}

.detail-section-line {
margin-top: 10px;
margin-bottom: 20px; 
width: 10%;
height: 1px;
background-color: rgb(2, 139, 175);
}

.detail-img-body{
/* text-align: center; */
padding-top: 50px;
padding-bottom: 200px;
padding-left: 50px;
padding-right: 50px;
}

.detail-img{
margin-left: auto;
margin-right: auto;
padding-bottom: 50px;
}

.deteail-reply{
margin-top: 10px;
margin-bottom: 10px;
margin-left:auto;
margin-right:auto;
display:block;
width: 95%;
border-radius: 7px;
color:black;
}

.detail-reply-section{
background-color: #0D1E27;
border-radius: 7px;
margin-bottom: 50px;
padding-bottom: 10px;
}

.detail-reply-toptr{
 background-color: #0A171E; 
 padding-left: 25px;
 padding-top: 20px;
 padding-bottom: 20px;
}

.detail-reply-toptr-list{
background-color: rgb(7, 16, 21);
padding-left: 20px;
/* padding-top: 20px; */
  padding-bottom: 15px; 
/*  border-radius: 7px; */
 font-weight: 600;
}

.detail-reply-tbody{
text-align: center;
padding-left: 27px;
}

.back-btn{
margin-top:30px;
margin-left: 100px;
width: 100px;
}


</style>

<html class="html-body">
<section class="article-section">
		<table class="detail-contents">
			<tbody>
				<tr>
					<th></th>
				<tr>
					<th></th>
					<td class="detail-title">${article.title } </td>
				</tr>
								<tr>
					<th class="detail-writer"></th>
					<td class="detail-writer">작성자 : ${article.extra__writer } <div class="detail-section-line"></div></td>
					
				</tr>
				<tr>
					<th></th>
					<td class="detail-img-body">
					<img class="detail-img" src="${rq.getImgUri(article.id)}" onerror="${rq.profileFallbackImgOnErrorHtml}"
							alt="" />
						<div class="toast-ui-viewer">
							<script class="detail-body" type="text/x-template">${article.body}</script>
							
						</div>
					</td>
					
				</tr>
				<tr>
					<th class="detail-hitCount"></th>
					<td>
					 <button id="likeButton" class="btn btn-outline btn-success btn-xs" onclick="doGoodReaction(${param.id})">좋아요 👍 <div id="likeCount"> ${article.goodReactionPoint }</div></button>
					<button id="DislikeButton" class="btn btn-outline btn-error btn-xs" onclick="doBadReaction(${param.id})">싫어요 👎 <div id="DislikeCount"> ${article.badReactionPoint }</div></button>
					<div class="detail-section-line"></div>
						<span class="article-detail__hit-count detail-hitCount"></div>조회수 : ${article.hitCount }</span>
					</td>
				</tr>
				<tr>
					<th class="detail-regdate"></th>
					<td class="detail-regdate">게시일 : ${article.regDate } 
					
					</td>
				</tr>
			</tbody>
		</table>

<!-- 		<div class="section-line"></div> -->
		<div class="btns">
			<button class="btn back-btn" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../article/doDelete?id=${article.id }">삭제</a>
		</c:if>
		</div>
		<div class="section-line"></div>
</section>

<section class="article-section detail-reply-section">
	<c:if test="${rq.isLogined() }">
	</c:if>
	<c:if test="${!rq.isLogined() }">
		<a class="btn" href="${rq.loginUri }"> 로그인 </a> 후 댓글을 작성해주세요
	</c:if>
	<div class="">
		<h2 class="detail-reply-toptr-list" >댓글 리스트(${repliesCount })</h2>
		<table class="">
			<colgroup>
				<col style="width: 3%" />
			<col style="width: 20%" />
			<col style="width: 40%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 8%" />
			<col style="width: 9%" />
			</colgroup>
			<thead class="detail-reply-toptr">
				<tr class="detail-reply-toptr">
					<th class="detail-reply-toptr">번호</th>
					<th class="detail-reply-toptr">날짜</th>
					<th class="detail-reply-toptr">내용</th>
					<th class="detail-reply-toptr">작성자</th>
					<th class="detail-reply-toptr">좋아요</th>
					<th class="detail-reply-toptr">싫어요</th>
					<th class="detail-reply-toptr"></th>
					<th class="detail-reply-toptr"></th>
				</tr>
			</thead>
			<tbody class="detail-reply-tbody">
				<c:forEach var="reply" items="${replies }">
					<tr class="hover">
						<td class="detail-reply-tbody">${reply.id }</td>
						<td class="detail-reply-tbody">${reply.regDate.substring(0,10) }</td>
						<td class="detail-reply-tbody">
							<span id="reply-${reply.id }">${reply.body }</span>
							<form method="POST" id="modify-form-${reply.id }" style="display: none;" action="/usr/reply/doModify">
								<input type="text" value="${reply.body }" name="reply-text-${reply.id }" />
							</form>
						</td>
						<td class="detail-reply-tbody">${reply.extra__writer }</td>
						<td class="detail-reply-tbody">${reply.goodReactionPoint }</td>
						<td class="detail-reply-tbody">${reply.badReactionPoint }</td>
						<td class="detail-reply-tbody">
							<c:if test="${reply.userCanModify }">
								<%-- 							href="../reply/modify?id=${reply.id }" --%>
								<button onclick="toggleModifybtn('${reply.id}');" id="modify-btn-${reply.id }" style="white-space: nowrap;"
									class="btn btn-xs">수정</button>
								<button onclick="doModifyReply('${reply.id}');" style="white-space: nowrap; display: none;"
									id="save-btn-${reply.id }" class="btn btn-outline">저장</button>
							</c:if>
						</td>
						<td>
							<c:if test="${reply.userCanDelete }">
								<a style="white-space: nowrap;" class="btn btn-xs"
									onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="../reply/doDelete?id=${reply.id }">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<form action="../reply/doWrite" method="POST" onsubmit="ReplyWrite__submit(this); return false;">
			<input type="hidden" name="relTypeCode" value="article" />
			<input type="hidden" name="relId" value="${article.id }" />
			<table class="">
				<tbody>
<!-- 					<tr> -->
							<textarea class="deteail-reply" autocomplete="off" placeholder="내용을 입력해주세요"
								name="body"> </textarea>
<!-- 					</tr> -->
					<tr>
						<th></th>
						<td>
							<input class="btn btn-info btn-sm" type="submit" value="댓글 작성" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
			</tbody>
		</table>
	</div>
	</section>
</html>
	
<%@ include file="../common/foot.jspf"%>