<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- mushion head -->
<%-- <%@ include file="../common/mushionHead.jspf"%> --%>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />


<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="https://cdn.tailwindcss.com"></script>

<!-- barlow 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
</style>
<!-- inter 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100..900&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100..900&display=swap')
</style>
<!-- roboto 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap')
</style>

<div class="ms-join-body">
  <div class="ms-join-body2">
  		<div class="ms-join-imgbox">
      <img
      src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FsGkyw%2FbtsHb6EJ1Z5%2FNJTRs1PSk7TkSIcdTVXYt0%2Fimg.jpg"
      class="ms-join-img"
    /></div>
    <div class="ms-join-body3">
      <div class="content-main-box">
        <div class="content-welcome-box">
            <span class="content-welcome-box-text">우리와 함께해요</span
            ><span class="content-welcome-box-text">👋</span
            >
            <span class="content-welcome-box-text2"
              >커뮤니티에 오신 것을 환영합니다.<br />가입하고 함께 해요! </span>
        </div>
        
        <form action="../member/doJoin" method="POST"> 
                  <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">아이디</p>
            <input class="ms-join-content-inputbox" placeholder="아이디를 입력해주세요" autocomplete="off" name="loginId" />
          </div>

                <div
      class="ms-join-content-box"
    >
      <p class="ms-join-content-text">비밀번호</p>
      
      <input class="ms-join-content-inputbox" placeholder="비밀번호를 입력해주세요" autocomplete="off" name="loginPw" />
      
    </div>
              <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">이름</p>
            
            <input class="ms-join-content-inputbox" placeholder="이름을 입력해주세요" autocomplete="off" name="name" />

          </div>
        <div
        class="ms-join-content-box"
      >
        <p class="ms-join-content-text">닉네임</p>
		<input class="ms-join-content-inputbox" placeholder="닉네임을 입력해주세요" autocomplete="off" name="nickname" />
      </div>
          <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">이메일</p>
            <input class="ms-join-content-inputbox" placeholder="이메일을 입력해주세요" autocomplete="off" name="email" />
          </div>
          <div class="ms-join-content-box">
            <p class="ms-join-content-text">전화번호</p>
				<input class="ms-join-content-inputbox" placeholder="전화번호를 입력해주세요" autocomplete="off" name="cellphoneNum" />
            </div>

            <button class="ms-join-create-button" type="submit" style="background-color:#28A7FF" >
              <p class="ms-join-create-text">
                계정 만들기
              </p>
          </button>
			
          </form>
          <div><a class="ms-join-back-btn" href="/usr/home/Mushion">이전 페이지로 이동</a>
          <a class="ms-join-home-btn" href="/usr/home/main">홈으로</a></div>
          </div>
      </div>
    </div>
  </div>
</div>