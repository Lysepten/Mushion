<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
<link rel="stylesheet" href="/resource/mushion.css" />

<%-- <%@ include file="../common/head.jspf"%> --%>

<%@ include file="../common/mushionHead.jspf"%>

 
<style>

.msheader {
	width: 1920px;
}

</style>

<html style="background-color: #071015">

<section class="mt-8 text-xl px-4">
	<div class="ms-checkPw">
		<form action="../member/doCheckPw" method="POST">
			<table class="login-box table-box-1" style="color : #fff;">

				<tbody class="ms-checkPw-tbody">

					<tr>
						<th>아이디</th>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input
							class="input input-bordered w-full max-w-xs ms-checkPw-tbody-text"
							autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
							name="loginPw" style="background-color: #071015"/></td>
					</tr>
				</tbody>
			</table>
			<input style="color : #fff;" class="btn btn-outline w-full max-w-xs" type="submit"
							value="확인" />
		</form>

		<div class="btns">

			<button style="color : #fff;" class="btn btn-outline w-full max-w-xs" type="button"
				onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>
</html>



<%@ include file="../common/foot.jspf"%>