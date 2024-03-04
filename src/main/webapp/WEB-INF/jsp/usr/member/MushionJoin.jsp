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
      <img
      src="unsplash_or0uertvyd0-1.png"
      class="ms-join-img"
    />
    <div class="ms-join-body3">
      <div class="content-main-box">
        <div class="content-welcome-box">
            <span class="content-welcome-box-text">우리와 함께해요</span
            ><span class="content-welcome-box-text">👋</span
            >
            <span class="content-welcome-box-text2"
              >커뮤니티에 오신 것을 환영합니다.<br />가입하고 함께 해요! </span>
        </div>
                  <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">아이디</p>
            <div
              class="ms-join-content-inputbox"
            >
              <p class="ms-join-content-inputtext">
                아이디를 입력해주세요
              </p>
            </div>
          </div>
                <div
      class="ms-join-content-box"
    >
      <p class="ms-join-content-text">비밀번호</p>
      <div
        class="ms-join-content-inputbox"
      >
        <p class="ms-join-content-inputtext">
          비밀번호를 입력해주세요!
        </p>
      </div>
    </div>
              <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">이름</p>
            <div
              class="ms-join-content-inputbox"
            >
              <p class="ms-join-content-inputtext">
                이름을 입력해주세요
              </p>
            </div>
          </div>
        <div
        class="ms-join-content-box"
      >
        <p class="ms-join-content-text">닉네임</p>
        <div
          class="ms-join-content-inputbox"
        >
          <p class="ms-join-content-inputtext">
            닉네임을 입력해주세요
          </p>
        </div>
      </div>
          <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">이메일</p>
            <div
              class="ms-join-content-inputbox"
            >
              <p class="ms-join-content-inputtext">
                이메일을 입력해주세요
              </p>
            </div>
          </div>
          <div
            class="ms-join-content-box"
          >
            <p class="ms-join-content-text">전화번호</p>
            <div
              class="ms-join-content-inputbox"
            >
              <p class="ms-join-content-inputtext">
                전화번호를 입력해주세요
              </p>
            </div>
          </div>

          <div
            class="flex flex-col justify-center items-center w-[201px] h-[62.9px] left-[898px] top-[918px] gap-2.5 p-4 rounded-[50px] bg-[#28a7ff]"
          >
            <div
              class="flex justify-center items-center flex-grow-0 flex-shrink-0 relative gap-[9px]"
            >
              <p class="flex-grow-0 flex-shrink-0 text-base font-semibold text-center text-white">
                계정 만들기
              </p>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>