<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY"></c:set>

<link rel="stylesheet" href="/resource/mushion.css" />

<%@ include file="../common/mushionHead.jspf"%>
<!-- Member modify 관련 -->

<script type="text/javascript">
	let MemberModify__submitFormDone = false;
	function MemberModify__submit(form) {
		if (MemberModify__submitFormDone) {
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length > 0) {
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value.length == 0) {
				alert('비번 확인 써라');
				form.loginPwConfirm.focus();
				return;
			}
			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('비번 불일치');
				form.loginPw.focus();
				return;
			}
		}
		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim();
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		form.email.value = form.email.value.trim();

		MemberModify__submitFormDone = true;
		form.submit();
	}
</script>

<div class="div">
  <div class="div-2">
    <div class="div-12">
      <div class="div-13">
        <div class="div-14">프로필</div>
        <img
          loading="lazy"
          src="https://cdn.builder.io/api/v1/image/assets/TEMP/b9b3cd478ee61b7811749e5cc3044a95d71f601dd882279c29366feef9a46c56?"
          class="img-2"
        />
        <div class="div-15">${rq.loginedMember.name }</div>
        <div class="div-16">${rq.loginedMember.nickname }</div>
        <div class="div-17">
          <div class="div-18">
            <div class="div-19">Jazz</div>
            <div class="div-20">음악 취향</div>
          </div>
          <div class="div-21"></div>
          <div class="div-22">
            <div class="div-23">Minimal</div>
            <div class="div-24">스타일</div>
          </div>
          <div class="div-25"></div>
          <div class="div-26">
            <div class="div-27">
              <img
                loading="lazy"
                class="img-3"
                src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcJKPix%2FbtsG6XAa2sz%2FKBNXkkuOufaGYkrHPC7nB0%2Fimg.png"
              />
              <img
                loading="lazy"
                class="img-4"
                src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FOl9q1%2FbtsG598JR3b%2FLAY1YTIdIRFPuGg3csmQn1%2Fimg.png"
              />
              <img
                loading="lazy"
                class="img-5"
                src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcDNuMw%2FbtsG350ZfCo%2F5CsrVnUKjuHAIJDmOgsGV1%2Fimg.png"
              />
            </div>
            <div class="div-28">소셜 미디어</div>
          </div>
        </div>
      </div>
      <div class="div-29"></div>
      
      <div class="div-30">
      <form action="../member/doModify" method="POST" onsubmit="MemberModify__submit(this); return false;">
        <div class="div-31">
          <div class="div-32">기본 정보</div>
          
          <div class="div-33">
            <a href="/usr/home/Mushion"class="div-34">취소</a>
            <input class="div-35" type="submit" value="완료"/>
          </div>
        </div>
        <div class="div-36"></div>
        <div class="div-37">
          <div class="div-38">닉네임</div>
          <div class="div-39">이름</div>
        </div>
				<div class="div-40">
				<input class="div-41" autocomplete="off" type="text" placeholder="닉네임을 입력해주세요" name="nickname"
						value="${rq.loginedMember.nickname }" /> <input class="div-42" autocomplete="off" type="text"
						placeholder="이름을 입력해주세요" name="name" value="${rq.loginedMember.name }" />
				</div>
				
				<div class="div-43">전화번호</div>
				<input class="div-44" type="text" autocomplete="off" type="text" placeholder="전화번호를 입력해주세요" name="cellphoneNum"
					value="${rq.loginedMember.cellphoneNum }"/>
				
				<div class="div-45">이메일</div>
				<input class="div-46" type="text" placeholder="이메일을 입력해주세요" name="email" value="${rq.loginedMember.email }" />
			</div>
			</form>
    </div>
  </div>
</div>


<style>

.msheader {
width: 1920px;
}
  .div {
    background-color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .div-2 {
    background-color: rgba(7, 16, 21, 1);
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    display: flex;
    width: 1920px;
    height: 779px;
    padding-bottom: 63px;
    flex-direction: column;
  }
  @media (max-width: 991px) {
    .div-2 {
      max-width: 100%;
    }
  }
  .div-3 {
    background-color: #0d1e27;
    display: flex;
    width: 100%;
    align-items: center;
    color: #fff;
    justify-content: center;
    padding: 46px 60px;
  }
  @media (max-width: 991px) {
    .div-3 {
      max-width: 100%;
      padding: 0 20px;
    }
  }
  .div-4 {
    display: flex;
    width: 100%;
    max-width: 1109px;
    gap: 20px;
    justify-content: space-between;
  }
  @media (max-width: 991px) {
    .div-4 {
      max-width: 100%;
      flex-wrap: wrap;
    }
  }
  .div-5 {
    display: flex;
    gap: 13px;
    font-size: 28px;
    font-weight: 900;
    white-space: nowrap;
  }
  @media (max-width: 991px) {
    .div-5 {
      white-space: initial;
    }
  }
  .img {
    aspect-ratio: 1;
    object-fit: auto;
    object-position: center;
    width: 48px;
  }
  .div-6 {
    flex-grow: 1;
    flex-basis: auto;
    margin: auto 0;
  }
  .div-7 {
    mix-blend-mode: hard-light;
    box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
    display: flex;
    gap: 20px;
    font-size: 24px;
    font-weight: 500;
    justify-content: space-between;
    margin: auto 0;
  }
  @media (max-width: 991px) {
    .div-7 {
      max-width: 100%;
      flex-wrap: wrap;
    }
  }
  .div-8 {
    -webkit-text-stroke-width: 1;
    -webkit-text-stroke-color: #000;
    border-color: rgba(0, 0, 0, 1);
    border-style: solid;
    border-width: 1px;
  }
  .div-9 {
    -webkit-text-stroke-width: 1;
    border-color: rgba(0, 0, 0, 1);
    border-style: solid;
    border-width: 1px;
  }
  .div-10 {
    -webkit-text-stroke-width: 1;
    -webkit-text-stroke-color: #000;
    border-color: rgba(0, 0, 0, 1);
    border-style: solid;
    border-width: 1px;
  }
  .div-11 {
    -webkit-text-stroke-width: 1;
    -webkit-text-stroke-color: #000;
    border-color: rgba(0, 0, 0, 1);
    border-style: solid;
    border-width: 1px;
  }
  .div-12 {
    align-self: center;
    display: flex;
    margin-top: 60px;
    width: 100%;
    max-width: 1231px;
    gap: 20px;
    justify-content: space-between;
    padding: 0 20px;
  }
  @media (max-width: 991px) {
    .div-12 {
      max-width: 100%;
      flex-wrap: wrap;
      margin-top: 40px;
    }
  }
  .div-13 {
    align-self: start;
    display: flex;
    margin-top: 44px;
    flex-direction: column;
    align-items: center;
  }
  @media (max-width: 991px) {
    .div-13 {
      max-width: 100%;
      margin-top: 40px;
    }
  }
  .div-14 {
    color: #a9acbb;
    text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    font-weight: 600;
    font-size: 30px;
  }
  .img-2 {
    aspect-ratio: 1;
    object-fit: auto;
    object-position: center;
    width: 150px;
    stroke-width: 5px;
    stroke: #028baf;
    filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
    border-color: rgba(2, 139, 175, 1);
    margin-top: 47px;
    max-width: 100%;
  }
  @media (max-width: 991px) {
    .img-2 {
      margin-top: 40px;
    }
  }
  .div-15 {
  font-family: 'Pretendard-Regular';
    font-weight: 600;
    font-style: normal;
    color: #fff;
    text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    margin-top: 42px;
     font-size: 28px;
  }
  @media (max-width: 991px) {
    .div-15 {
      margin-top: 40px;
    }
  }
  .div-16 {
    color: #a9acbb;
    text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    font-family: 'Pretendard-Regular';
    font-weight: 600;
    font-style: normal;
    font-size: 24px;
  }
  .div-17 {
    align-self: stretch;
    display: flex;
    margin-top: 50px;
    align-items: center;
    gap: 20px;
    justify-content: space-between;
  }
  @media (max-width: 991px) {
    .div-17 {
      flex-wrap: wrap;
      margin-top: 40px;
    }
  }
  .div-18 {
    align-self: stretch;
    display: flex;
    flex-direction: column;
    margin: auto 0;
  }
  .div-19 {
    color: #fff;
     font-family: 'Pretendard-Regular';
    font-weight: 600;
    font-style: normal;
    font-size: 30px;
  }
  .div-20 {
    color: #a9acbb;
    margin-bottom: 14px;
    font-family: 'Pretendard-Regular';
    font-weight: 400;
    font-style: normal;
    font-size: 17px;
  }
  .div-21 {
    background-color: #028baf;
    align-self: start;
    width: 2px;
    height: 68px;
  }
  .div-22 {
    align-self: stretch;
    display: flex;
    flex-direction: column;
    white-space: nowrap;
    margin: auto 0;
  }
  @media (max-width: 991px) {
    .div-22 {
      white-space: initial;
    }
  }
  .div-23 {
    color: #fff;
    font-family: 'Pretendard-Regular';
    font-weight: 600;
    font-style: normal;
    font-size: 30px;
  }
  .div-24 {
    color: #a9acbb;
    align-self: center;
	margin-bottom: 12px;
    font-family: 'Pretendard-Regular';
    font-weight: 400;
    font-style: normal;
    font-size: 17px;
  }
  .div-25 {
    background-color: #028baf;
    align-self: start;
    width: 2px;
    height: 68px;
  }
  .div-26 {
    align-self: stretch;
    display: flex;
    flex-direction: column;
    margin: auto 0;
  }
  .div-27 {
    display: flex;
    gap: 10px;
  }
  .img-3 {
    aspect-ratio: 1;
    object-fit: auto;
    object-position: center;
    width: 32px;
  }
  .img-4 {
    aspect-ratio: 1;
    object-fit: auto;
    object-position: center;
    width: 32px;
  }
  .img-5 {
    aspect-ratio: 1;
    object-fit: auto;
    object-position: center;
    width: 32px;
  }
  .div-28 {
    color: #a9acbb;
    align-self: center;
    margin-top: 10px;
    margin-bottom: 10px;
    font-family: 'Pretendard-Regular';
    font-weight: 300;
    font-style: normal;
    font-size: 17px;
  }
  .div-29 {
    box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
    background-color: #028baf;
    width: 2px;
    height: 649px;
  }
  .div-30 {
    display: flex;
    flex-direction: column;
    margin: auto 0;
  }
  @media (max-width: 991px) {
    .div-30 {
      max-width: 100%;
    }
  }
  .div-31 {
    display: flex;
    width: 100%;
    gap: 20px;
    justify-content: space-between;
  }
  @media (max-width: 991px) {
    .div-31 {
      max-width: 100%;
      flex-wrap: wrap;
    }
  }
  .div-32 {
    color: #fff;
    align-self: start;
    font-family: 'Pretendard-Regular';
    font-weight: 600;
    font-style: normal;
    font-size: 18px;
   	padding-top: 10px;
  }
  .div-33 {
    display: flex;
    gap: 20px;
    font-size: 14px;
    white-space: nowrap;
  }
  @media (max-width: 991px) {
    .div-33 {
      white-space: initial;
    }
  }
  .div-34 {
    border-radius: 7px;
    border-color: rgba(2, 139, 175, 1);
    border-style: solid;
    border-width: 2px;
    color: #a9acbb;
    font-weight: 600;
    justify-content: center;
	height: 40px;
	width: 90px;
	text-align: center;
	padding-top: 7px;
  }
  @media (max-width: 991px) {
    .div-34 {
      white-space: initial;
      padding: 0 20px;
    }
  }
  .div-35 {
    border-radius: 7px;
    background-color: rgba(40, 167, 255, 1);
    border-color: rgba(0, 0, 0, 1);
    border-style: solid;
    border-width: 1px;
    color: #fff;
    font-weight: 600;
    justify-content: center;
	height: 40px;
	width: 90px;
	text-align: center;
	cursor: pointer;
  }
  @media (max-width: 991px) {
    .div-35 {
      white-space: initial;
      padding: 0 20px;
    }
  }
  .div-36 {
    background-color: #028baf;
    margin-top: 22px;
    height: 2px;
  }
  @media (max-width: 991px) {
    .div-36 {
      max-width: 100%;
    }
  }
  .div-37 {
    display: flex;
    margin-top: 38px;
    width: 419px;
    max-width: 100%;
    gap: 20px;
    font-size: 14px;
    color: #fff;
    font-weight: 400;
    white-space: nowrap;
    justify-content: space-between;
  }
  @media (max-width: 991px) {
    .div-37 {
      white-space: initial;
    }
  }
  .div-38 {
  font-size:16px;
  }
  .div-39 {
  left:50px;
  font-size:16px;
  }
  .div-40 {
    display: flex;
    margin-top: 20px;
    gap: 20px;
  }
  @media (max-width: 991px) {
    .div-40 {
      flex-wrap: wrap;
    }
  }
  .div-41 {
    border-radius: 7px;
    border-color: rgba(2, 139, 175, 1);
    border-style: solid;
    border-width: 2px;
    width: 360px;
    max-width: 100%;
    height: 35px;
    color: #fff;
    padding-top: 3px;
    text-align: center;
    
  }
  .div-42 {
    border-radius: 7px;
    border-color: rgba(2, 139, 175, 1);
    border-style: solid;
    border-width: 2px;
    width: 265px;
    max-width: 100%;
    height: 35px;
    color: #fff;
    padding-top: 3px;
    text-align: center;
  }
  .div-43 {
    color: #fff;
    margin-top: 29px;
  }
  @media (max-width: 991px) {
    .div-43 {
      max-width: 100%;
    }
  }
  .div-44 {
    border-radius: 7px;
    border-color: rgba(2, 139, 175, 1);
    border-style: solid;
    border-width: 2px;
    margin-top: 20px;
    height: 35px;
    color: #fff;
    padding-top: 3px;
    text-align: center;
    width: 645px;
  }
  @media (max-width: 991px) {
    .div-44 {
      max-width: 100%;
    }
  }
  
  .div-45 {
    color: #fff;
    margin-top: 29px;
/*     font: 400 14px Inter, sans-serif; */
  }
  
  @media (max-width: 991px) {
    .div-45 {
      max-width: 100%;
    }
  }

  .div-46 {
    border-radius: 7px;
    border-color: rgba(2, 139, 175, 1);
    border-style: solid;
    border-width: 2px;
    margin-top: 20px;
    height: 35px;
    color: #fff;
    padding-top: 3px;
    text-align: center;
    width: 645px;
  }
  @media (max-width: 991px) {
    .div-46 {
      max-width: 100%;
    }
  }
  
* {
font-family: 'Pretendard-Regular';
font-weight: 600;
font-style: normal;
}

input{
background-color: #071015;
width: 90%;
border: none;
outline: none;
};

input:focus {
border: none;
outline-color: navy;
outline: none;
}

</style>
